import 'package:flutter/material.dart';
import 'package:flutter_final_course_task/common/theme_manager.dart';
import 'package:flutter_final_course_task/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.grey.shade100,
        textTheme: TextTheme(button: ThemeManager().buttonTextStyle()),
        elevatedButtonTheme: ThemeManager().buttonStyle(),
        inputDecorationTheme: ThemeManager().textFormFieldDecoration(),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo, accentColor: Colors.grey),
      ),
      home: const LoginPage(),
    );
  }
}
