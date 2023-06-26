import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class ShiftSwapHistoryComponent extends StatefulWidget {
  const ShiftSwapHistoryComponent({super.key});

  @override
  State<ShiftSwapHistoryComponent> createState() =>
      _ShiftSwapHistoryComponentState();
}

class _ShiftSwapHistoryComponentState extends State<ShiftSwapHistoryComponent> {
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
        Search(
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) => MyCard(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.calendar_1,
                            size: 20,
                            color: MyColor.textFaded.shade400,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${(index + 1).toString().padLeft(2, '0')} Juni 2023",
                            style: const TextStyle(
                              fontWeight: MyTextStyle.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        index.isEven ? "Diterima" : "Ditolak",
                        style: TextStyle(
                            fontSize: MyTextStyle.tiny,
                            color: index.isEven ? MyColor.green : MyColor.red,
                            fontWeight: MyTextStyle.bold),
                      ),
                    ],
                  ),
                  const Mydivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //my shift
                      shiftComponent("Saya", "07.00 - 16.00"),
                      //swap icon
                      MyCard(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Iconsax.repeat,
                          size: 18,
                          color: MyColor.textFaded.shade600,
                        ),
                      ),
                      //requested user
                      shiftComponent("Pegawai x", "15.00 - 22.00")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }

  Widget shiftComponent(String title, String schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.personalcard,
              size: 20,
              color: MyColor.primary.shade300,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: MyTextStyle.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Iconsax.clock,
              size: 20,
              color: MyColor.accent.shade300,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              schedule,
              style: TextStyle(
                fontWeight: MyTextStyle.bold,
                color: MyColor.textFaded.shade600,
                fontSize: MyTextStyle.small,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
