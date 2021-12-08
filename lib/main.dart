import 'package:borsa_oyunu/screens/bottomNavigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trader Game',
        theme: ThemeData(
            primaryColor: new Color(0xffF9D943),
            accentColor: new Color(0xff25D366)),
        color: Color(0xffEAECEF),
        home: BottomNavigation());
  }
}
