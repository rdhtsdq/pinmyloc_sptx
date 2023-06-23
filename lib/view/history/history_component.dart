import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:flutter_dash/flutter_dash.dart';

class HistoryComponents extends StatefulWidget {
  const HistoryComponents({super.key});

  @override
  State<HistoryComponents> createState() => _HistoryComponentsState();
}

class _HistoryComponentsState extends State<HistoryComponents> {
  @override
  void initState() {
    super.initState();
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.all(0),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCard(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: DropdownButtonFormField(
            items: ["May 2023", "June 2023", "July 2023", "August 2023"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: "Pilih Periode",
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(12, 10, 10, 10),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            dropdownColor: MyColor.base,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemBuilder: (context, index) => MyCard(
            color: Colors.transparent,
            noShadow: true,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar_1,
                      size: 20,
                      color: MyColor.textFaded,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${(index + 1).toString().padLeft(2, '0')} Juni 2023",
                      style: const TextStyle(
                        fontSize: MyTextStyle.small,
                      ),
                    )
                  ],
                ),
                const Mydivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyCard(
                      noShadow: true,
                      color: Colors.indigo.shade50,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          timeliner(context),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              section(
                                Icon(
                                  Iconsax.login_14,
                                  color: MyColor.primary.shade400,
                                ),
                                "Masuk",
                                "08.00",
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              section(
                                Icon(
                                  Iconsax.logout_14,
                                  color: MyColor.accent.shade400,
                                ),
                                "Keluar",
                                "17.30",
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.3,
                    // ),
                    MyCard(
                      noShadow: true,
                      color: MyColor.accent.shade50,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          timeliner(context),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              section(
                                Icon(
                                  Iconsax.arrow_circle_left,
                                  color: MyColor.primary.shade400,
                                ),
                                "Istirahat",
                                "12.00",
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              section(
                                  Icon(
                                    Iconsax.arrow_circle_right,
                                    color: MyColor.accent.shade400,
                                  ),
                                  "Selesai",
                                  "13.00")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          itemCount: 25,
        )),
      ],
    );
  }

  Column timeliner(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.circle_rounded,
          size: 10,
          color: MyColor.green,
        ),
        Dash(
          dashThickness: 1,
          dashColor: MyColor.textFaded.shade400,
          direction: Axis.vertical,
          length: 50,
          dashGap: 3,
          dashLength: 2,
        ),
        // SizedBox(
        //   height: ,
        //   child: VerticalDivider(
        //     thickness: 1,
        //   ),
        // ),
        Icon(
          Icons.circle_rounded,
          size: 10,
          color: MyColor.red,
        ),
      ],
    );
  }

  Widget section(Widget icon, String title, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: MyColor.textFaded.shade600,
            fontSize: MyTextStyle.tiny,
          ),
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: MyTextStyle.subTitle3,
            fontWeight: MyTextStyle.semiBold,
          ),
        ),
      ],
    );
  }
}
