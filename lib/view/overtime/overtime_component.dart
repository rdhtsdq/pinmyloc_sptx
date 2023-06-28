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

class OvertimeComponent extends StatefulWidget {
  const OvertimeComponent({super.key});

  @override
  State<OvertimeComponent> createState() => _OvertimeComponentState();
}

class _OvertimeComponentState extends State<OvertimeComponent> {
  late MyBottomSheet sheet;

  @override
  void initState() {
    super.initState();
    sheet = MyBottomSheet(context);
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.all(0),
            isHead: true,
            fabChild: const Icon(
              Icons.add_rounded,
              color: MyColor.base,
            ),
            children: [
              Row(
                children: [
                  const Text(
                    "Ajukan Lembur Pegawai",
                    style: TextStyle(fontSize: MyTextStyle.tiny),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // sheet.showFullSheet(
                      // buildForm(ServiceFormType.head),
                      // );
                    },
                    backgroundColor: MyColor.primary,
                    child: const Icon(
                      Iconsax.people,
                      color: MyColor.base,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Ajukan Lembur",
                    style: TextStyle(fontSize: MyTextStyle.tiny),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // sheet.showFullSheet(
                      //   buildForm(ServiceFormType.employee),
                      // );
                    },
                    backgroundColor: MyColor.primary,
                    child: const Icon(Iconsax.edit, color: MyColor.base),
                  ),
                ],
              ),
            ],
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
          child: RefreshIndicator(
            onRefresh: () => Future.delayed(const Duration(seconds: 4)),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemBuilder: (context, index) => MyCard(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.calendar_1,
                          size: 20,
                          color: MyColor.textFaded.shade400,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${(index + 1).toString().padLeft(2, '0')} Juni 2023",
                          style: TextStyle(
                            fontSize: MyTextStyle.small,
                            color: MyColor.textFaded.shade700,
                          ),
                        )
                      ],
                    ),
                    const Mydivider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Icon(
                      Iconsax.login,
                      size: 20,
                      color: MyColor.primary.shade400,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Icon(
                      Iconsax.logout,
                      size: 20,
                      color: MyColor.accent.shade400,
                    ),
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
}
