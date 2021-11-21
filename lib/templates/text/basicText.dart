import 'package:flutter/material.dart';

class BasicText extends StatelessWidget {
  const BasicText({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Colors.white)),
    );
  }
}
