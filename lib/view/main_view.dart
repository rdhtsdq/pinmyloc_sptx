import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/view/dashboard/dashboard_component.dart';
import 'package:frontend/view/event/event.dart';
import 'package:frontend/view/service/service_history_component.dart';
import 'package:frontend/view/shift/shift_component.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: MyColor.base,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: MyColor.base,
          actions: [
            IconButton(
              onPressed: () {
                key.currentState?.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                size: 26,
              ),
            )
          ],
          title: Text(
            // "Dashboard",
            "Shift",
            style: TextStyle(
                fontSize: MyTextStyle.header2, fontWeight: MyTextStyle.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: ShiftComponent(),
      ),
      endDrawer: Drawer(
        surfaceTintColor: MyColor.base,
        backgroundColor: MyColor.base,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  MyText.appName,
                  style: TextStyle(
                      fontSize: MyTextStyle.subTitle1,
                      fontWeight: MyTextStyle.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                  7,
                  (index) => MyCard(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text("data $index"),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
