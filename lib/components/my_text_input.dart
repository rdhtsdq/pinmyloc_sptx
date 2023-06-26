import 'package:flutter/material.dart';
import 'package:frontend/constant/text_style.dart';
import '../../components/card.dart';

class MyTextInput {
  final TextEditingController _controller = TextEditingController();

  MyCard renderField(BuildContext context,
      {required String hint,
      int maxLine = 1,
      Function()? onTap,
      Function(String)? onChanged,
      Function(String)? onSubmitted,
      bool? show,
      Widget? suffixIcon,
      TextInputType keyboardType = TextInputType.text,
      TextStyle style = const TextStyle(fontSize: MyTextStyle.body),
      bool small = false,
      EdgeInsetsGeometry margin = const EdgeInsets.only(bottom: 10),
      EdgeInsetsGeometry padding = const EdgeInsets.only(
        left: 10,
        right: 10,
      )}) {
    return MyCard(
      margin: margin,
      padding: padding,
      child: TextField(
        onTap: onTap,
        obscureText: show ?? false,
        style: style,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        maxLines: maxLine,
        controller: _controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          isDense: small,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  String get value => _controller.text;

  void dispose() => _controller.dispose();
}
