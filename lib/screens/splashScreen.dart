import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/sample_screen', (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('FTELEGRAM',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}
