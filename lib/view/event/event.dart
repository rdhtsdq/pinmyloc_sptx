import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:iconsax/iconsax.dart';

class EventComponent extends StatelessWidget {
  const EventComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
                      color: MyColor.textFaded.shade700,
                    ),
                    Text(
                      "Januari 2023",
                      style: TextStyle(
                        fontSize: MyTextStyle.subTitle3,
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
