import 'package:flutter/material.dart';
import 'package:flutter_omega/navigation_bar_controller.dart';
import 'package:flutter_omega/pages/OnBoarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      debugShowCheckedModeBanner: false,
      home: SelectorPage(),
    );
  }
}