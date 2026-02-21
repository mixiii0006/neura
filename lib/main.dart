import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'core/navbar.dart';

void main() {

  runApp(const NeuraApp());

}

class NeuraApp extends StatelessWidget {

  const NeuraApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "NEURA",

      debugShowCheckedModeBanner: false,

      theme: neuraTheme,

      home: const Navbar(),

    );

  }

}