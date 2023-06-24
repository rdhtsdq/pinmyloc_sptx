import 'package:flutter/material.dart';

class ViewSetting {
  Function()? fabAction;
  Function()? refresh;
  Widget? fabChild;
  EdgeInsetsGeometry? padding;
  bool isHead;
  List<Widget>? children;

  ViewSetting({
    this.fabAction,
    this.refresh,
    this.fabChild,
    this.padding,
    this.isHead = false,
    this.children,
  });
}
