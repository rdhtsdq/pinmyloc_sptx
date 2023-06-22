import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../components/card.dart';
import '../../constant/text.dart';

class Search extends StatelessWidget {
  String? searchText;
  Function(String val)? onSubmitted;
  TextEditingController? controller;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  Search(
      {super.key,
      this.searchText,
      this.controller,
      this.onSubmitted,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      margin: margin ?? const EdgeInsets.only(bottom: 15),
      padding: padding,
      radius: 7,
      child: TextField(
        onSubmitted: onSubmitted,
        controller: controller,
        decoration: InputDecoration(
          icon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Iconsax.search_normal_1),
          ),
          hintText: searchText ?? MyText.cari,
          contentPadding: const EdgeInsets.only(
            left: 0,
            right: 7,
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
