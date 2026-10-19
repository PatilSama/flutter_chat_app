import 'package:chatapp/core/constant/color_const.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: ColorConst.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConst.accentColor,
          primary: ColorConst.accentColor,
          secondary: ColorConst.accentColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConst.accentColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: TextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
