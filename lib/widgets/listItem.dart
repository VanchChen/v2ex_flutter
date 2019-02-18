import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../pages/detailPage.dart';

class ListItemWidget extends StatefulWidget {
  ListItemWidget({Key key, @required this.topic}) : super(key: key);

  final Topic topic;

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItemWidget> {
  void didTap() {
    Navigator.push(context, 
      new MaterialPageRoute(builder: (context) {
        return new DetailPage(topic: widget.topic);
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.topic.title),
      onTap: didTap,
    );
  } 
}