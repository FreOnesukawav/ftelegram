import 'package:flutter/material.dart';
import 'package:ftelegram/screens/sampleScreen.dart';
import 'package:ftelegram/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FTelegram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {"/sample_screen": (_) => SampleScreen()},
    );
  }
}
