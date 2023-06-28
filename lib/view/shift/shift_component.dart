import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/bottom_sheet.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/dialog.dart';
import 'package:frontend/components/my_text_input.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/components/show_my_snackbar.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class ShiftComponent extends StatefulWidget {
  const ShiftComponent({super.key});

  @override
  State<ShiftComponent> createState() => _ShiftComponentState();
}

class _ShiftComponentState extends State<ShiftComponent> {
  late MyBottomSheet showSheet;
  late ShowMySnackbar snackbar;

  @override
  void initState() {
    super.initState();
    showSheet = MyBottomSheet(context);
    snackbar = ShowMySnackbar(context);
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(padding: const EdgeInsets.all(0)),
        );
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
        Search(
            searchText: "Cari Tanggal",
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 15)),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => Future.delayed(const Duration(seconds: 4)),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                                color: MyColor.primary.shade400,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${(index + 1).toString().padLeft(2, '0')} Juni 2023",
                                style: const TextStyle(
                                  fontWeight: MyTextStyle.bold,
                                  fontSize: MyTextStyle.subTitle3,
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
                                color: MyColor.accent.shade400,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "16.00 - 01.00",
                                style: TextStyle(
                                  fontWeight: MyTextStyle.bold,
                                  color: MyColor.textFaded.shade600,
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
                              fontSize: MyTextStyle.subTitle3,
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
                              color: MyColor.textFaded.shade600,
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
          MyCard(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
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
                      width: 10,
                    ),
                    Text(
                      "05 Juni 2023",
                      style: const TextStyle(
                        fontSize: MyTextStyle.subTitle3,
                        fontWeight: MyTextStyle.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //my shift
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.personalcard,
                              size: 20,
                              color: MyColor.textFaded.shade600,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Saya",
                              style: const TextStyle(
                                fontWeight: MyTextStyle.bold,
                                fontSize: MyTextStyle.subTitle3,
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
                              width: 10,
                            ),
                            Text(
                              "16.00 - 01.00",
                              style: TextStyle(
                                fontWeight: MyTextStyle.bold,
                                color: MyColor.textFaded.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //swap icon
                    MyCard(
                      shadowColor: MyColor.textFaded.shade300,
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Iconsax.repeat,
                        size: 18,
                        color: MyColor.textFaded.shade600,
                      ),
                    ),
                    //requested user
                    Column(
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
                              width: 10,
                            ),
                            Text(
                              "Pegawai X",
                              style: const TextStyle(
                                fontWeight: MyTextStyle.bold,
                                fontSize: MyTextStyle.subTitle3,
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
                              width: 10,
                            ),
                            Text(
                              "16.00 - 01.00",
                              style: TextStyle(
                                fontWeight: MyTextStyle.bold,
                                color: MyColor.textFaded.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _alasan.renderField(
            context,
            hint: "Alasan Tukar",
            maxLine: 5,
          ),
          ElevatedButton(
            onPressed: () {
              if (_alasan.value == "" || _alasan.value == null) {
                MyDialog(context).showInfo("Harap isi alasan");
              } else {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.pop(context);
                Navigator.pop(context);
                snackbar.showSuccess("Berhasil mengajukan");
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColor.primary,
              minimumSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              MyText.ajukan,
              style: TextStyle(
                color: MyColor.base,
              ),
            ),
          )
        ],
      ),
    );
  }
}
