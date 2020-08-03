import 'package:flutter/material.dart';
import 'package:flutter_nub/Constants.dart';
import 'package:flutter_nub/Services.dart';
import 'package:flutter_nub/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeScreen(),
    );
  }
}
