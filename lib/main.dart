import 'package:flutter/material.dart';
import 'pages/homePage.dart';

void main() => runApp(V2exApp());

class V2exApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'V2EX'),
    );
  }
}

