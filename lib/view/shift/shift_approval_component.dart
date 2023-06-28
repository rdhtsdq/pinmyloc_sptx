import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/bottom_sheet.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/components/show_my_snackbar.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class ShiftApprovalComponent extends StatefulWidget {
  const ShiftApprovalComponent({super.key});

  @override
  State<ShiftApprovalComponent> createState() => _ShiftApprovalComponentState();
}

class _ShiftApprovalComponentState extends State<ShiftApprovalComponent> {
  @override
  void initState() {
    super.initState();
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.all(0),
          ),
        );
  }

  void showConfirm() {
    MyBottomSheet(context).showConfirmSheet(
      onConfirm: () {},
      onReject: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          searchText: "Cari nama",
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async =>
                Future.delayed(const Duration(seconds: 3)).then((value) {
              print("object");
            }),
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              itemBuilder: (context, index) => MyCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                margin: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.calendar_1,
                              color: MyColor.textFaded.shade400,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Rabu, ${(index + 1).toString().padLeft(2, '0')} Mei 2023",
                              style: TextStyle(
                                fontSize: MyTextStyle.small,
                                fontWeight: MyTextStyle.bold,
                                color: MyColor.textFaded.shade700,
                              ),
                            )
                          ],
                        ),
                        if (index.isEven && index % 2 == 0)
                          Text(
                            "Diterima",
                            style: TextStyle(
                              color: MyColor.green,
                              fontSize: MyTextStyle.tiny,
                              fontWeight: MyTextStyle.bold,
                            ),
                          )
                      ],
                    ),
                    const Mydivider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        shiftComponent("Pegawai X", "07.00 - 16.00"),
                        MyCard(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Iconsax.repeat,
                            size: 20,
                            color: MyColor.textFaded.shade700,
                            grade: 30,
                          ),
                        ),
                        shiftComponent("Pegawai Y", "15.00 - 21.00"),
                      ],
                    ),
                    if (index.isOdd) ...[
                      const SizedBox(
                        height: 20,
                      ),
                      Btn(
                        text: "Konfirmasi",
                        backgroundColor: MyColor.primary,
                        onPressed: () => showConfirm(),
                        textColor: MyColor.base,
                        height: 35,
                      )
                    ]
                  ],
                ),
              ),
              itemCount: 10,
            ),
          ),
        )
      ],
    );
  }

  Widget shiftComponent(String title, String schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.personalcard,
              size: 20,
              color: MyColor.primary.shade300,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: MyTextStyle.bold,
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
              color: MyColor.accent.shade300,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              schedule,
              style: TextStyle(
                fontWeight: MyTextStyle.bold,
                color: MyColor.textFaded.shade600,
                fontSize: MyTextStyle.small,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
