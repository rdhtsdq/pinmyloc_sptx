import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/bottom_sheet.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/constant/size.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/card.dart';
import '../../constant/colors.dart';
import '../../constant/text_style.dart';
import '../../controller/any/any.dart';
import '../../model/view_setting.dart';

class DashboardComponents extends StatelessWidget {
  const DashboardComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;

    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySize.checkRadius)),
    );

    //set view setting
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            fabChild: const Icon(
              Icons.fingerprint_rounded,
              color: MyColor.base,
            ),
            fabAction: () {
              MyBottomSheet(context).showCustomSheet(
                buildAttendance(context),
                0.7,
              );
            },
          ),
        );

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat Datang",
            style: TextStyle(
              fontSize: MyTextStyle.subTitle3,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Calendar
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
          MyCard(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Jadwal Hari Ini",
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "08.00 - 17.00",
                  style: TextStyle(fontSize: MyTextStyle.subTitle1),
                )
              ],
            ),
          ),
          MyCard(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "List Kerja Hari Ini",
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                  5,
                  (index) => Theme(
                    data: Theme.of(context)
                        .copyWith(checkboxTheme: newCheckBoxTheme),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: false,
                      onChanged: (value) {
                        print(value);
                      },
                      title: Text(
                        "Task 1",
                        style: TextStyle(
                          fontSize: MyTextStyle.body,
                          fontWeight: MyTextStyle.bold,
                        ),
                      ),
                      subtitle: Text("Nama"),
                      dense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAttendance(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Absensi hari ini",
            style: TextStyle(
              fontSize: MyTextStyle.subTitle3,
              fontWeight: MyTextStyle.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildScheduleToday(
            false,
            "08.00",
            "Gestalt Center",
            "Masuk",
            () {},
            context,
          ),
          const SizedBox(
            height: 40,
          ),
          buildScheduleToday(
            true,
            "-",
            "-",
            "Istirahat",
            () {},
            context,
          ),
          const SizedBox(
            height: 40,
          ),
          buildScheduleToday(
            false,
            "-",
            "-",
            "Selesai  ",
            () {},
            context,
          ),
          const SizedBox(
            height: 40,
          ),
          buildScheduleToday(
            false,
            "-",
            "-",
            "Pulang",
            () {},
            context,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: MyTextStyle.header3,
                    fontWeight: MyTextStyle.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: MyTextStyle.small,
                  ),
                )
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
            vertical: 10,
          ),
          margin: const EdgeInsets.all(0),
        ),
      ],
    );
  }

  Text absenTime(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: MyTextStyle.header3,
        fontWeight: MyTextStyle.bold,
      ),
    );
  }

  InkWell absenButton(Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: MyCard(
        color: MyColor.primary,
        radius: 5,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: const Text(
          "Absen",
          style: TextStyle(
              color: MyColor.base,
              fontSize: MyTextStyle.subTitle3,
              fontWeight: MyTextStyle.semiBold),
        ),
      ),
    );
  }

  Widget icon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Icon(
        Icons.circle,
        size: 15,
        color: MyColor.primary.shade400,
      ),
    );
  }
}
