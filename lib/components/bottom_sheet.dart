import 'package:flutter/material.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/constant/text_style.dart';
import '../../constant/colors.dart';
import '../../constant/size.dart';

class MyBottomSheet {
  BuildContext context;
  MyBottomSheet(this.context);

  void showFullSheet(Widget child, {bool isDismissible = true}) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
          heightFactor: 0.98,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: MyColor.base),
            padding: const EdgeInsets.all(10),
            child: child,
          )),
    );
  }

  void showSheet(Widget child, {bool isDismissible = true}) {
    showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: MyColor.base),
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }

  void showCustomSheet(Widget child, double heightFactor,
      {bool isDismissible = true}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: heightFactor,
        child: Container(
          decoration: const BoxDecoration(
            color: MyColor.base,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: child,
        ),
      ),
    );
  }

  void showConfirmSheet({
    required Function() onConfirm,
    required Function() onReject,
    String confirmText = 'Terima',
    String rejectText = 'Tolak',
    bool isDismissible = true,
    Color confirmColor = MyColor.green,
    Color? rejectColor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.25,
        child: Container(
          decoration: const BoxDecoration(
            color: MyColor.base,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Konfirmasi",
                style: TextStyle(
                  fontSize: MyTextStyle.subTitle1,
                  fontWeight: MyTextStyle.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Btn(
                text: confirmText,
                textColor: MyColor.base,
                backgroundColor: confirmColor,
                onPressed: onConfirm,
              ),
              Btn(
                text: rejectText,
                textColor: MyColor.base,
                backgroundColor: rejectColor ?? MyColor.red,
                onPressed: onReject,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
