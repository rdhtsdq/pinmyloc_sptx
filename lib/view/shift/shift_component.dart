import 'package:flutter/material.dart';
import 'package:frontend/components/bottom_sheet.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/my_text_input.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:iconsax/iconsax.dart';

class ShiftComponent extends StatefulWidget {
  const ShiftComponent({super.key});

  @override
  State<ShiftComponent> createState() => _ShiftComponentState();
}

class _ShiftComponentState extends State<ShiftComponent> {
  late MyBottomSheet showSheet;

  @override
  void initState() {
    super.initState();
    showSheet = MyBottomSheet(context);
  }

  void showSelector() {
    showSheet.showFullSheet(
      buildSelector(),
    );
  }

  void showForm() {
    showSheet.showFullSheet(buildForm());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(searchText: "Cari Tanggal"),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return MyCard(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.calendar_1,
                              size: 20,
                              color: MyColor.textFaded.shade500,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${(index + 1).toString().padLeft(2, '0')} Juni 2023",
                              style: const TextStyle(
                                fontWeight: MyTextStyle.bold,
                                fontSize: MyTextStyle.subTitle1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock,
                              size: 20,
                              color: MyColor.textFaded.shade500,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "16.00 - 01.00",
                              style: TextStyle(
                                fontWeight: MyTextStyle.bold,
                                color: MyColor.textFaded.shade700,
                                fontSize: MyTextStyle.subTitle3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => showSelector(),
                      icon: Icon(
                        Iconsax.repeat,
                        color: MyColor.textFaded.shade600,
                        size: 20,
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 25,
          ),
        ),
      ],
    );
  }

  Widget buildSelector() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            MyText.tukarShift,
            style: TextStyle(
                fontSize: MyTextStyle.subTitle1, fontWeight: MyTextStyle.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => showForm(),
                child: MyCard(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.personalcard,
                            size: 20,
                            color: MyColor.textFaded.shade500,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Pegawai ${index + 1}",
                            style: const TextStyle(
                              fontWeight: MyTextStyle.bold,
                              fontSize: MyTextStyle.subTitle1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            size: 20,
                            color: MyColor.textFaded.shade500,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "16.00 - 01.00",
                            style: TextStyle(
                              fontWeight: MyTextStyle.bold,
                              color: MyColor.textFaded.shade700,
                              fontSize: MyTextStyle.subTitle3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForm() {
    MyTextInput _alasan = MyTextInput();
    return WillPopScope(
      onWillPop: () async {
        _alasan.dispose();
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            MyText.tukarShift,
            style: TextStyle(
                fontSize: MyTextStyle.subTitle1, fontWeight: MyTextStyle.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("05 Juni 2023"),
          const SizedBox(
            height: 10,
          ),
          _alasan.renderField(
            context,
            hint: "Alasan Tukar",
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
