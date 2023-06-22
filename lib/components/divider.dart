import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class Mydivider extends StatelessWidget {
  const Mydivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: MyColor.textFaded.shade400,
    );
  }
}
