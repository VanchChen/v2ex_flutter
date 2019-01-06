import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  ListItemWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(child: Text(widget.title)),
    );
  } 
}