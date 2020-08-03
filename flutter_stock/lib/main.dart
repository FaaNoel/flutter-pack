import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stock/auth/authentication.dart';
import 'package:flutter_stock/ui/root_page.dart';
import 'package:flutter_stock/auth/auth_provider.dart';

void main() => runApp(StockTracker());

class StockTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inherited widget to provde authentication
    return AuthProvider(
      baseAuth: AuthenticateUser(),
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Stock Tracker',
        theme: ThemeData(brightness: Brightness.dark),
        home: RootPage(),
      ),
    );
  }
}