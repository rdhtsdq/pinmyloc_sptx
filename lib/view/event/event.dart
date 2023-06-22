import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class EventComponent extends StatelessWidget {
  const EventComponent({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        );

    return ListView(
      clipBehavior: Clip.none,
      children: [
        ...List.generate(
          12,
          (index) => MyCard(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Iconsax.calendar_1,
                      color: MyColor.textFaded.shade600,
                      size: 20,
                    ),
                    Text(
                      "${(index + 1).toString().padLeft(2, '0')} 2023",
                      style: TextStyle(
                        fontWeight: MyTextStyle.bold,
                      ),
                    ),
                  ],
                ),
                const Mydivider(),
                buildChild("10", "Event"),
                buildChild("10", "Event"),
                buildChild("10", "Event"),
                buildChild("10", "Event"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildChild(String date, String name) {
    return Row(
      children: [
        Text(date),
        const SizedBox(
          width: 5,
        ),
        Text(name)
      ],
    );
  }
}
