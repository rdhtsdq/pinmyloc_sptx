import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';
import 'package:iconsax/iconsax.dart';

class ServiceComponent extends StatefulWidget {
  const ServiceComponent({super.key});

  @override
  State<ServiceComponent> createState() => _ServiceComponentState();
}

class _ServiceComponentState extends State<ServiceComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => MyCard(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Iconsax.calendar,
                        color: MyColor.textFaded,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Kamis, 02 06 2023"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("data"),
                  Text("data"),
                  Text("data")
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
