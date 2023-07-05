import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskComponent extends StatefulWidget {
  const TaskComponent({super.key});

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent>
    with SingleTickerProviderStateMixin {
  DateTime now = DateTime.now();
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.all(0),
            fabAction: () {},
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCard(
          margin:
              const EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TableCalendar(
            locale: 'id',
            focusedDay: now,
            firstDay: DateTime(2020),
            lastDay: DateTime.now().add(const Duration(days: 30)),
            availableGestures: AvailableGestures.none,
            // selectedDayPredicate: (day) {
            //   return isSameDay(selected, day);
            // },
            onDaySelected: (selectedDay, focusedDay) {
              context.read<FocusedCubit>().setDate(focusedDay);
              context.read<SelectedCubit>().setDate(selectedDay);
            },
            calendarFormat: CalendarFormat.week,
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
            currentDay: now,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleTextStyle:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              headerPadding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 3,
                bottom: 8,
              ),
            ),
          ),
        ),
        TabBar(
          tabs: [
            Tab(
              text: "Saya",
            ),
            Tab(
              text: "Karyawan",
            )
          ],
          controller: controller,
        ),
        Expanded(
          child: TabBarView(
            children: [
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemBuilder: (context, index) => MyCard(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: CheckboxListTile(
                    value: index.isEven ? true : false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("data ${index + 1}"),
                  ),
                ),
                itemCount: 10,
              ),
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemBuilder: (context, index) => MyCard(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: CheckboxListTile(
                    value: index.isOdd ? true : false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("data ${index + 3 / 2}"),
                  ),
                ),
                itemCount: 10,
              ),
            ],
            controller: controller,
          ),
        )
      ],
    );
  }
}
