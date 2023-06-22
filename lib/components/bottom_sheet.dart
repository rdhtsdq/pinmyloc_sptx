import 'package:flutter/material.dart';
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
      backgroundColor: MyColor.base,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (context) => FractionallySizedBox(
          heightFactor: 0.98,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: child,
          )),
    );
  }

  void showSheet(Widget child, {bool isDismissible = true}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      isDismissible: isDismissible,
      backgroundColor: MyColor.base,
      enableDrag: true,
      builder: (context) => Padding(
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
      backgroundColor: MyColor.base,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (context) => FractionallySizedBox(
          heightFactor: heightFactor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          )),
    );
  }
}
