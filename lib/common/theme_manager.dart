import 'package:flutter/material.dart';

class ThemeManager {
  InputDecorationTheme textFormFieldDecoration() {
    return InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      errorMaxLines: 3,
    );
  }

  BoxDecoration buttonBoxDecoration(BuildContext context) {
    Color c1 = Theme.of(context).colorScheme.primary;
    Color c2 = Theme.of(context).colorScheme.secondary;
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  BoxDecoration avatarBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      border: Border.all(width: 5, color: Colors.white),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 20,
          offset: Offset(5, 5),
        ),
      ],
    );
  }

  ElevatedButtonThemeData buttonStyle() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }

  TextStyle buttonTextStyle() {
    return const TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
  }
}
