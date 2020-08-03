import 'package:flutter/material.dart';
import 'package:flutter_times/pages/choose_location.dart';
import 'package:flutter_times/pages/home.dart';
import 'package:flutter_times/pages/loading.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

