import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/constant/text.dart';
import 'package:frontend/constant/text_style.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/model/menu.dart';
import 'package:frontend/view/main_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          context.read<ViewCubit>().setView(
                Menu(title: "Dashboard", id: "DASH000"),
              );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainView(),
              ),
              (route) => false);
        },
      );
    });

    return Scaffold(
      backgroundColor: MyColor.primary.shade400,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                MyText.appName,
                style: TextStyle(
                    fontSize: MyTextStyle.header1,
                    color: MyColor.base,
                    fontWeight: MyTextStyle.semiBold),
              ),
              LoadingAnimationWidget.prograssiveDots(
                  color: MyColor.base, size: 40)
            ],
          ),
        ),
      ),
    );
  }
}
