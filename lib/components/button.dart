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

  static Widget small(
      {required Function()? onTap,
      required Color color,
      required Color textColor,
      required String text,
      EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 20),
      EdgeInsetsGeometry padding =
          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      double? width}) {
    return GestureDetector(
      onTap: onTap,
      child: MyCard(
        margin: margin,
        padding: padding,
        color: color,
        width: width,
        noShadow: true,
        alignment: Alignment.center,
        child: width != null
            ? FittedBox(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: MyTextStyle.subTitle3,
                      color: textColor,
                      fontWeight: MyTextStyle.semiBold),
                ),
              )
            : Text(
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

@immutable
class Btn extends StatelessWidget {
  Color? backgroundColor;
  Color? textColor;
  String text;
  Function()? onPressed;
  double? height;

  Btn(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.text,
      this.onPressed,
      this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size.fromHeight(height ?? 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
