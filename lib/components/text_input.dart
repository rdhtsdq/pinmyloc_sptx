import 'package:flutter/material.dart';
import '../../components/card.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  int maxLine;
  Function()? onTap;
  Function(String)? onChanged;
  Function(String)? onSubmitted;

  TextInput(
      {super.key,
      required this.hint,
      required this.controller,
      this.maxLine = 1,
      this.onTap,
      this.onChanged,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        maxLines: maxLine,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
