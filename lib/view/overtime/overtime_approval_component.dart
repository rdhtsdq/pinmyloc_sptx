import 'package:flutter/material.dart';
import 'package:frontend/components/bottom_sheet.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';

class OvertimeApprovalComponent extends StatefulWidget {
  const OvertimeApprovalComponent({super.key});

  @override
  State<OvertimeApprovalComponent> createState() =>
      _OvertimeApprovalComponentState();
}

class _OvertimeApprovalComponentState extends State<OvertimeApprovalComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
        // const SizedBox(
        //   height: 10,
        // ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => MyCard(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pegawai"),
                      Text("Rabu, 09 07 2023"),
                    ],
                  ),
                  Text("Alasan"),
                  Text("data"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      MyBottomSheet(context).showSheet(
                        Column(
                          children: [Text("Konfirmasi")],
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
}
