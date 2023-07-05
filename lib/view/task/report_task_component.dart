import 'package:flutter/material.dart';

class ReportTaskComponent extends StatefulWidget {
  const ReportTaskComponent({super.key});

  @override
  State<ReportTaskComponent> createState() => _ReportTaskComponentState();
}

class _ReportTaskComponentState extends State<ReportTaskComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Report Task")],
    );
  }
}
