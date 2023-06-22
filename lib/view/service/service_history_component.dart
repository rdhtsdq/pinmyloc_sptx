import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

class ServiceHistoryComponents extends StatefulWidget {
  const ServiceHistoryComponents({super.key});

  @override
  State<ServiceHistoryComponents> createState() =>
      _ServiceHistoryComponentsState();
}

class _ServiceHistoryComponentsState extends State<ServiceHistoryComponents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Iconsax.calendar,
                        color: MyColor.textFaded.shade800,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Rabu, 02 Mar 2023"),
                    ],
                  ),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
            ),
            itemCount: 20,
          ),
        )
      ],
    );
  }
}
