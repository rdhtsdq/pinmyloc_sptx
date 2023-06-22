import 'package:flutter/material.dart';
import '../../components/snackbar.dart';

class ShowMySnackbar {
  BuildContext context;
  ShowMySnackbar(this.context);

  void showSuccess(String message, {Function()? action, String? actionText}) {
    ScaffoldMessenger.of(context).showSnackBar(MySnackbar.success(
        message: message, label: actionText, onPressed: action));
  }

  void showWarning(String message, {Function()? action, String? actionText}) {
    ScaffoldMessenger.of(context).showSnackBar(MySnackbar.warning(
        message: message, label: actionText, onPressed: action));
  }

  void showError(String message, {Function()? action, String? actionText}) {
    ScaffoldMessenger.of(context).showSnackBar(MySnackbar.error(
        message: message, label: actionText, onPressed: action));
  }

  void showMessage(String message, {Function()? action, String? actionText}) {
    ScaffoldMessenger.of(context).showSnackBar(
      MySnackbar.message(
          message: message, label: actionText, onPressed: action),
    );
  }
}
