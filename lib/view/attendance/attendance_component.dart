import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceComponent extends StatefulWidget {
  const AttendanceComponent({super.key});

  @override
  State<AttendanceComponent> createState() => _AttendanceComponentState();
}

class _AttendanceComponentState extends State<AttendanceComponent> {
  @override
  void initState() {
    super.initState();
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          BlocBuilder<SelectedCubit, DateTime>(
            builder: (context, selected) {
              return BlocBuilder<FocusedCubit, DateTime>(
                builder: (context, focused) {
                  return MyCard(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TableCalendar(
                      locale: 'id',
                      focusedDay: focused,
                      firstDay: DateTime(2020),
                      lastDay: DateTime.now().add(const Duration(days: 30)),
                      availableGestures: AvailableGestures.none,
                      selectedDayPredicate: (day) {
                        return isSameDay(selected, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        context.read<FocusedCubit>().setDate(focusedDay);
                        context.read<SelectedCubit>().setDate(selectedDay);
                      },
                      weekendDays: const [7],
                      calendarStyle: CalendarStyle(
                        markerDecoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        isTodayHighlighted: true,
                        selectedDecoration: const BoxDecoration(
                          color: MyColor.primary,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: MyColor.secondary,
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: const TextStyle(
                          fontSize: 15,
                        ),
                        weekendTextStyle:
                            const TextStyle(fontSize: 15, color: Colors.red),
                      ),
                      currentDay: DateTime.now(),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        titleTextStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        headerPadding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 3,
                          bottom: 8,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildScheduleToday(
                  false, "08.00", "Gestalt Center", "Masuk", () {}, context),
              buildDash(),
              buildScheduleToday(
                  true, "Tunggu", "-", "Istirahat", () {}, context),
              buildDash(),
              buildScheduleToday(
                  false, "Tunggu", "-", "Selesai", () {}, context),
              buildDash(),
              buildScheduleToday(
                  false, "Tunggu", "-", "Pulang", () {}, context),
            ],
          ),
          // buildScheduleToday(false, "08.00", "Gestalt Center", "Absen", () {}, context),
        ],
      ),
    );
  }

  Padding buildDash() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Dash(
        dashThickness: 1,
        dashColor: MyColor.textFaded.shade400,
        direction: Axis.vertical,
        length: 50,
        dashGap: 3,
        dashLength: 2,
      ),
    );
  }

  Widget buildScheduleToday(bool active, String title, String subtitle,
      String btnText, Function() onTap, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: MyColor.primary,
                  size: 15,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: MyTextStyle.header3,
                        fontWeight: MyTextStyle.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: MyTextStyle.small,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        MyButton.small(
          color: !active ? MyColor.textFaded.shade300 : MyColor.primary,
          onTap: !active ? null : onTap,
          text: btnText,
          width: MediaQuery.of(context).size.width * 0.25,
          textColor: !active ? MyColor.textFaded.shade700 : MyColor.base,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          margin: const EdgeInsets.all(0),
        ),
      ],
    );
  }
}
