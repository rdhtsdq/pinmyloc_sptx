import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

class HistoryComponents extends StatefulWidget {
  const HistoryComponents({super.key});

  @override
  State<HistoryComponents> createState() => _HistoryComponentsState();
}

class _HistoryComponentsState extends State<HistoryComponents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCard(
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => MyCard(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.login_14),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Masuk"),
                        Text("08.00"),
                      ],
                    )
                  ],
                ),
                Divider(
                  height: 25,
                  thickness: 0.3,
                  color: MyColor.textFaded,
                ),
                Row(
                  children: [
                    Icon(Iconsax.arrow_circle_left),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Break"),
                        Text("12.00"),
                      ],
                    )
                  ],
                ),
                Divider(
                  height: 25,
                  thickness: 0.3,
                  color: MyColor.textFaded,
                ),
                Row(
                  children: [
                    Icon(Iconsax.arrow_circle_left),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Back"),
                        Text("13.00"),
                      ],
                    )
                  ],
                ),
                Divider(
                  height: 25,
                  thickness: 0.3,
                  color: MyColor.textFaded,
                ),
                Row(
                  children: [
                    Icon(Iconsax.logout_14),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pulang"),
                        Text("17.00"),
                      ],
                    )
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
}
