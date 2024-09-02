import 'package:flutter/material.dart';
import 'package:money_lover/common/color_extension.dart';
import 'package:money_lover/login/sign_up.dart';
import 'package:money_lover/login/signup_social.dart';
import 'package:money_lover/login/welcome_view.dart';
import 'package:money_lover/main_tab/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mooney',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
          background: TColor.gray80,
          primary: TColor.primary,
          primaryContainer: TColor.gray60,
          secondary: TColor.secondary,
        ),
        useMaterial3: false,
      ),
      initialRoute: '',
      routes: {
        'welcome_screen': (context) => WelcomeView(),
        'sign_up' : (context) => SignUp(),
        'signUp_social' : (context) => SocialSignUp(),
      },
      home: MainTabView(),
    );
  }
}
