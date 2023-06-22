import 'package:flutter/material.dart';
import '../../components/card.dart';
import '../../constant/size.dart';
import '../../constant/text.dart';

class DropDownItem {
  String title;
  dynamic value;

  DropDownItem(this.title, this.value);
}

class MyDropdown extends StatefulWidget {
  final String? hint;
  final List<DropDownItem> item;
  final Function(dynamic val) onChanged;
  const MyDropdown(
      {super.key, this.hint, required this.item, required this.onChanged});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return MyCard(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 7, right: 7, bottom: 7),
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(MySize.radius),
        elevation: 1,
        decoration: InputDecoration(
          hintText: widget.hint ?? MyText.pilihData,
        ),
        items: widget.item
            .map(
              (e) => DropdownMenuItem(
                child: Text(e.title),
              ),
            )
            .toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
