import 'package:flutter/material.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';

class MyDialog {
  BuildContext context;
  MyDialog(this.context);
  showInfo(String message) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: MyColor.base,
          title: const Text(
            "Info",
            style: TextStyle(
              fontSize: MyTextStyle.subTitle3,
              fontWeight: MyTextStyle.bold,
            ),
          ),
          content: Text(
            message,
          ),
        ),
      );
}
