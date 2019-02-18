import 'package:flutter/material.dart';

class DetailItemWidget extends StatefulWidget {
  DetailItemWidget({Key key, @required this.title}) : super(key:key);

  final String title;

  @override
  DetailItemState createState() => DetailItemState();  
}

class DetailItemState extends State<DetailItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(widget.title));
  }
}