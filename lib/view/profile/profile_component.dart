import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/divider.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';
import 'package:iconsax/iconsax.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        );

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: MyColor.primary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Nama Pegawai",
              style: TextStyle(
                fontSize: MyTextStyle.subTitle3,
                fontWeight: MyTextStyle.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        titleBodyRow("Id Karyawan", "11223344"),
        titleBodyRow("Status Kepegawaian", "Tetap"),
        titleBodyRow("Posisi", "Programmer"),
        titleBodyRow("Departemen", "Konsultan"),
        titleBodyRow("Nomor NPWP", ""),
        const Spacer(),
        const Mydivider(),
        action(Iconsax.password_check, "Ubah Password", () {}),
        action(Iconsax.logout4, "Keluar", () {}),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.copyright_rounded,
              size: 15,
              color: MyColor.textFaded.shade400,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "2022  Gestalt Systech",
              style: TextStyle(fontSize: 10, color: MyColor.textFaded.shade400),
            )
          ],
        )
      ],
    );
  }

  ListTile action(IconData icon, String title, Function() onTap) {
    return ListTile(
      trailing: Icon(
        icon,
        size: 20,
      ),
      onTap: onTap,
      horizontalTitleGap: 0,
      title: Text(title),
      dense: true,
    );
  }

  Widget titleBodyRow(String title, String body) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: MyTextStyle.small,
            ),
          ),
          Text(
            body,
            style: const TextStyle(
              fontWeight: MyTextStyle.semiBold,
              fontSize: MyTextStyle.small,
            ),
          ),
        ],
      ),
    );
  }
}
