import 'package:flutter/material.dart';
import 'package:frontend/view/attendance/attendance_component.dart';
import 'package:frontend/view/dashboard/dashboard_component.dart';
import 'package:frontend/view/attendance/history_component.dart';
import 'package:frontend/view/overtime/overtime_approval_component.dart';
import 'package:frontend/view/overtime/overtime_component.dart';
import 'package:frontend/view/profile/profile_component.dart';
import 'package:frontend/view/service/service_approval_component.dart';
import 'package:frontend/view/service/service_component.dart';
import 'package:frontend/view/shift/shift_approval_component.dart';
import 'package:frontend/view/shift/shift_component.dart';
import 'package:frontend/view/shift/shift_swap_history_component.dart';

class View {
  static final views = {
    "DASH000": const DashboardComponents(),
    "ABSN001": const AttendanceComponent(),
    "ABSN002": const HistoryComponents(),
    "SHFT001": const ShiftComponent(),
    "SHFT002": const ShiftSwapHistoryComponent(),
    "SHFT003": const ShiftApprovalComponent(),
    "LMBR001": const OvertimeComponent(),
    "LMBR002": const OvertimeApprovalComponent(),
    "TSKL001": Container(),
    "TSKL002": Container(),
    "DNSK001": const ServiceComponent(),
    "DNSK002": const ServiceApprovalComponents(),
    "IZNK000": Container(),
    "EVNT000": Container(),
    "PRFL000": const ProfileComponent(),
  };
}
