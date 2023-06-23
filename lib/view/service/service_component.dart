import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class ServiceComponent extends StatefulWidget {
  const ServiceComponent({super.key});

  @override
  State<ServiceComponent> createState() => _ServiceComponentState();
}

class _ServiceComponentState extends State<ServiceComponent> {
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
          searchText: "Cari Tanggal",
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            itemBuilder: (context, index) => MyCard(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Kamis, ${(index + 1).toString().padLeft(2, '0')} Juni 2023",
                            style: TextStyle(
                              fontSize: MyTextStyle.tiny,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        index.isEven ? "Diterima" : "Ditolak",
                        style: TextStyle(
                          fontSize: MyTextStyle.tiny,
                          color: index.isEven ? MyColor.green : MyColor.red,
                        ),
                      ),
                    ],
                  ),
                  const Mydivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildSubComponent(Iconsax.location,
                      text: "Lokasi Dinas , alamat detailnya"),
                  buildSubComponent(Iconsax.document4,
                      text: "Alasan Dinas , ketemu siapa "),
                  const SizedBox(
                    height: 5,
                  ),
                  buildSubComponent(Iconsax.moneys, text: "Rp.x.xxx.xxx"),
                  buildSubComponent(
                    Iconsax.folder_2,
                    child: GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(),
                      ),
                      child: const Text(
                        "Lampiran",
                        style: TextStyle(
                          fontSize: MyTextStyle.small,
                          color: MyColor.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 20,
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
