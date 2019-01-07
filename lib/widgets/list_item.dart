import 'package:flutter/material.dart';
import '../models/post.dart';

class ListItemWidget extends StatefulWidget {
  ListItemWidget({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.post.title)
    );
  } 
}