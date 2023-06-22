import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/search.dart';
import 'package:iconsax/iconsax.dart';

class OvertimeComponent extends StatefulWidget {
  const OvertimeComponent({super.key});

  @override
  State<OvertimeComponent> createState() => _OvertimeComponentState();
}

class _OvertimeComponentState extends State<OvertimeComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => MyCard(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Iconsax.login),
                  const SizedBox(
                    height: 15,
                  ),
                  Icon(Iconsax.logout),
                ],
              ),
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
