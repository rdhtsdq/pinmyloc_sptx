import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class MySnackbar {
  static const bool showClose = true;
  static const Duration duration = Duration(seconds: 3);
  static const SnackBarBehavior behavior = SnackBarBehavior.floating;

  static SnackBar success(
      {required String message, String? label, Function()? onPressed}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      behavior: behavior,
      duration: duration,
      showCloseIcon: showClose,
      action: label != null && onPressed != null
          ? SnackBarAction(label: label, onPressed: onPressed)
          : null,
    );
  }

  static SnackBar error(
      {required String message, String? label, Function()? onPressed}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      behavior: behavior,
      duration: duration,
      showCloseIcon: showClose,
      action: label != null && onPressed != null
          ? SnackBarAction(label: label, onPressed: onPressed)
          : null,
    );
  }

  static SnackBar warning(
      {required String message, String? label, Function()? onPressed}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.yellow.shade800,
      behavior: behavior,
      duration: duration,
      showCloseIcon: showClose,
      action: label != null && onPressed != null
          ? SnackBarAction(label: label, onPressed: onPressed)
          : null,
    );
  }

  static SnackBar message(
      {required String message, String? label, Function()? onPressed}) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      behavior: behavior,
      duration: duration,
      showCloseIcon: showClose,
      closeIconColor: MyColor.textBase,
      action: label != null && onPressed != null
          ? SnackBarAction(
              label: label,
              onPressed: onPressed,
            )
          : null,
    );
  }
}
