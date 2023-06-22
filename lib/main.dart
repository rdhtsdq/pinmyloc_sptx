import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/constant/colors.dart';
import 'package:frontend/controller/any/any.dart';
import 'package:frontend/controller/bloc/login_bloc.dart';
import 'package:frontend/view/login/login_view.dart';
import 'package:frontend/view/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => FocusedCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedCubit(),
        ),
        BlocProvider(
          create: (context) => ViewSettingCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Pinmyloc',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('id')],
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: MyColor.primary,
            ),
            useMaterial3: true,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        home: const Splash(),
      ),
    );
  }
}
