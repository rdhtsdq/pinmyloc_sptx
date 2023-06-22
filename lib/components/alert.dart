import 'package:flutter/material.dart';
import '../../components/card.dart';
import '../../constant/colors.dart';
import '../../constant/size.dart';
import '../../constant/text_style.dart';

class Alert {
  BuildContext context;
  Alert(this.context);
  showMessageAlert(String msg) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySize.radius),
        ),
        backgroundColor: MyColor.base,
        content: Text(
          msg,
          style: TextStyle(),
        ),
      ),
    );
  }

  showConfirmAlert(
      {required Function() onCancel,
      required Function() onConfirm,
      required String title,
      String? subtitle,
      String confirmText = "Konfirmasi",
      String cancelText = "Batal",
      List<Widget>? extraContext}) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: MyTextStyle.subTitle2,
                fontWeight: MyTextStyle.semiBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: TextStyle(color: MyColor.textFaded.shade600),
              ),
            if (extraContext != null) ...extraContext,
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onCancel,
                  child: MyCard(
                    noShadow: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    color: MyColor.textFaded.shade300,
                    child: Text(
                      cancelText,
                      style: TextStyle(
                          fontWeight: MyTextStyle.semiBold,
                          color: MyColor.textFaded),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onConfirm,
                  child: MyCard(
                    noShadow: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    color: MyColor.primary,
                    child: Text(
                      confirmText,
                      style: const TextStyle(
                          fontWeight: MyTextStyle.semiBold,
                          color: MyColor.base),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
