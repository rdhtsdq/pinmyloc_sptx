import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/search.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/view_setting.dart';

class ServiceApprovalComponents extends StatefulWidget {
  const ServiceApprovalComponents({super.key});

  @override
  State<ServiceApprovalComponents> createState() =>
      _ServiceApprovalComponentsState();
}

class _ServiceApprovalComponentsState extends State<ServiceApprovalComponents> {
  @override
  void initState() {
    super.initState();
    context.read<ViewSettingCubit>().setSetting(
          ViewSetting(
            padding: const EdgeInsets.all(0),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          searchText: "Cari Tanggal",
        ),
      ],
    );
  }
}
