import 'package:flutter/material.dart';

final neuraTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: const Color(0xFF0D0D0D),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121212),

    selectedItemColor: Colors.white,

    unselectedItemColor: Colors.grey,

    type: BottomNavigationBarType.fixed,
  ),
);
