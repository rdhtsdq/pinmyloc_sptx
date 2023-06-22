import 'package:flutter/material.dart';
import '../../components/card.dart';
import '../../constant/colors.dart';
import '../../constant/size.dart';
import '../../constant/text_style.dart';

class DoubleButton extends StatelessWidget {
  final String cancel;
  final String confirm;
  final Function()? onCancel;
  final Function()? onConfirm;

  const DoubleButton(
      {super.key,
      required this.cancel,
      required this.confirm,
      this.onCancel,
      this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: onCancel,
          child: MyCard(
            noShadow: true,
            radius: MySize.checkRadius,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: MyColor.textFaded.shade300,
            child: Text(
              cancel,
              style: TextStyle(
                  fontWeight: MyTextStyle.semiBold,
                  fontSize: MyTextStyle.subTitle3,
                  color: MyColor.textFaded.shade500),
            ),
          ),
        ),
        GestureDetector(
          onTap: onConfirm,
          child: MyCard(
            noShadow: true,
            radius: MySize.checkRadius,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: MyColor.primary.shade400,
            child: Text(
              confirm,
              style: TextStyle(
                  fontWeight: MyTextStyle.semiBold,
                  fontSize: MyTextStyle.subTitle3,
                  color: MyColor.base),
            ),
          ),
        ),
      ],
    );
  }
}
