import 'package:flutter/material.dart';
import '../../components/card.dart';
import '../../constant/text_style.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.textColor,
    required this.text,
  });
  Function() onTap;
  Color color;
  Color textColor;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyCard(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        color: color,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Text(
          text,
          style: TextStyle(
              fontSize: MyTextStyle.subTitle3,
              color: textColor,
              fontWeight: MyTextStyle.semiBold),
        ),
      ),
    );
  }
}
