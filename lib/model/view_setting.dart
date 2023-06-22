import 'package:flutter/material.dart';

class ViewSetting {
  Function()? fabAction;
  Function()? refresh;
  Widget? fabChild;
  EdgeInsetsGeometry? padding;

  ViewSetting({this.fabAction, this.refresh, this.fabChild, this.padding});
}
