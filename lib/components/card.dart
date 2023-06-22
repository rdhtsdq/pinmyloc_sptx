import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/size.dart';

class MyCard extends StatelessWidget {
  Widget? child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  Color? color;
  double? radius;
  Color? shadowColor;
  double? height;
  double? width;
  AlignmentGeometry? alignment;
  bool noShadow;
  double? spreadRadius;
  double? blurRadius;
  bool noOutline;

  MyCard(
      {super.key,
      this.child,
      this.padding,
      this.margin,
      this.color,
      this.radius,
      this.shadowColor,
      this.height,
      this.width,
      this.alignment,
      this.blurRadius,
      this.spreadRadius,
      this.noShadow = false,
      this.noOutline = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: color ?? MyColor.base,
          borderRadius: BorderRadius.circular(radius ?? MySize.radius),
          boxShadow: noShadow
              ? null
              : [
                  BoxShadow(
                    blurRadius: blurRadius ?? 3,
                    color: shadowColor ?? MyColor.shadowColor,
                    spreadRadius: spreadRadius ?? MySize.spreadShadow,
                    offset: const Offset(0, 0),
                  )
                ],
          border: noOutline
              ? null
              : Border.all(
                  width: 1,
                  color: MyColor.textFaded.shade400,
                )),
      child: child,
    );
  }
}
