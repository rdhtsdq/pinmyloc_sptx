import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import './constant/colors.dart';
import './controller/any/any.dart';
import './controller/bloc/login_bloc.dart';
import './view/login/login_view.dart';
import './view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ),
        BlocProvider(
          create: (context) => ViewCubit(),
        ),
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
