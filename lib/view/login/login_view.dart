import 'package:flutter/material.dart';
import 'package:frontend/components/card.dart';
import 'package:frontend/components/my_text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/components/show_my_snackbar.dart';
import 'package:frontend/controller/bloc/login_bloc.dart';
import 'package:frontend/view/main_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../constant/text.dart';
import '../../constant/text_style.dart';
import '../../constant/colors.dart';

class ShowCubit extends Cubit<bool> {
  ShowCubit() : super(true);

  void update() {
    emit(!state);
  }
}

class LoginView extends StatelessWidget {
  LoginView({super.key});

  MyTextInput userid = MyTextInput();
  MyTextInput password = MyTextInput();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ShowMySnackbar(context).showError(state.message);
        }

        if (state is LoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainView(),
            ),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 120,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    MyText.login,
                    style: TextStyle(
                        fontSize: MyTextStyle.header1,
                        fontWeight: MyTextStyle.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  userid.renderField(
                    context,
                    hint: "Userid",
                  ),
                  BlocBuilder<ShowCubit, bool>(
                    builder: (context, state) {
                      return password.renderField(
                        context,
                        hint: "Kata Sandi",
                        show: state,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ShowCubit>().update();
                          },
                          icon: Icon(
                              state ? Icons.visibility_off : Icons.visibility),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<LoginBloc>()
                              .add(Login(userid.value, password.value));
                        },
                        child: MyCard(
                          noShadow: true,
                          color: MyColor.primary,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          child: state is LoginLoading
                              ? LoadingAnimationWidget.prograssiveDots(
                                  color: MyColor.base, size: 30)
                              : const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    fontSize: MyTextStyle.subTitle2,
                                    color: MyColor.base,
                                    fontWeight: MyTextStyle.bold,
                                  ),
                                ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
