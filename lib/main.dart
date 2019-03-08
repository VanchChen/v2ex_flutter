import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/homePage.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(V2exApp());
} 

class V2exApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFF0444c),
      ),
      home: HomePage(title: 'V2EX'),
    );
  }
}

