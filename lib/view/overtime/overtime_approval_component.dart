import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/bottom_sheet.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class OvertimeApprovalComponent extends StatefulWidget {
  const OvertimeApprovalComponent({super.key});

  @override
  State<OvertimeApprovalComponent> createState() =>
      _OvertimeApprovalComponentState();
}

class _OvertimeApprovalComponentState extends State<OvertimeApprovalComponent> {
  @override
  void initState() {
    super.initState();
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.all(0),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) => MyCard(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSubComponent(Iconsax.calendar_1,
                          text: "Rabu 02 Juni 2023"),
                      if (index.isEven)
                        const Text(
                          "Diterima",
                          style: TextStyle(
                              fontSize: MyTextStyle.tiny, color: MyColor.green),
                        )
                    ],
                  ),
                  const Mydivider(),
                  buildSubComponent(Iconsax.card, text: "Nama Pegawai"),
                  buildSubComponent(Iconsax.clock, text: "Hari Libur "),
                  buildSubComponent(Iconsax.document, text: "Alasan"),
                  if (!index.isEven)
                    ElevatedButton(
                      onPressed: () {
                        MyBottomSheet(context).showSheet(
                          Column(
                            children: [
                              Text("Konfirmasi"),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Konfirmasi",
                        style: TextStyle(color: MyColor.base),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0,
                        minimumSize: const Size.fromHeight(30),
                      ),
                    )
                ],
              ),
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }

  Container buildSubComponent(IconData icon, {String? text, Widget? child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: MyColor.textFaded.shade400,
          ),
          const SizedBox(
            width: 10,
          ),
          child ??
              Text(
                text ?? "",
                style: TextStyle(
                  fontSize: MyTextStyle.small,
                ),
              )
        ],
      ),
    );
  }
}
