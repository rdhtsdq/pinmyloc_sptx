import 'package:flutter/material.dart';
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
      TextInputType keyboardType = TextInputType.text}) {
    return MyCard(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: TextField(
        onTap: onTap,
        obscureText: show ?? false,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        maxLines: maxLine,
        controller: _controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  String get value => _controller.text;

  void dispose() => _controller.dispose();
}
