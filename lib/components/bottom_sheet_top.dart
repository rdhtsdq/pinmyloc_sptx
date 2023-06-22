import 'package:flutter/material.dart';
import '../../components/card.dart';
import '../../constant/colors.dart';

class BottomSheetTop extends StatelessWidget {
  const BottomSheetTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyCard(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 40,
        height: 5,
        noShadow: true,
        color: MyColor.textFaded,
      ),
    );
  }
}
