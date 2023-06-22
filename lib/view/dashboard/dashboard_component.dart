import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardComponents extends StatelessWidget {
  const DashboardComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat Datang",
            style: TextStyle(
              fontSize: MyTextStyle.subTitle2,
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
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Text(
                          MyText.masuk,
                          style: TextStyle(
                            fontSize: MyTextStyle.subTitle3,
                            fontWeight: MyTextStyle.bold,
                            color: MyColor.textFaded,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // state.data!.dIn!.time != "Absen"
                        //     ? absenTime(state.data!.dIn?.time ?? "")
                        //     :
                        absenButton(() {}),
                        Text(
                            // state.data!.dIn!.location ?? "",
                            "")
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          MyText.pulang,
                          style: TextStyle(
                            fontSize: MyTextStyle.subTitle3,
                            fontWeight: MyTextStyle.bold,
                            color: MyColor.textFaded,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        absenTime("Tunggu"),
                        // state.data!.dOut!.time != "Absen"
                        //     ? absenTime(state.data!.dOut?.time ?? "")
                        //     :
                        // absenButton(() {}),
                        Text(//state.data!.dOut!.location ?? ""
                            "")
                      ],
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.coffee_rounded),
                  label: const Text(
                    "Istirahat",
                    style: TextStyle(
                      fontSize: MyTextStyle.subTitle2,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
}
