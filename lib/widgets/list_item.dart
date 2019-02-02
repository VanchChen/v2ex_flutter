import 'package:flutter/material.dart';
import '../models/post.dart';
import '../pages/detailPage.dart';

class ListItemWidget extends StatefulWidget {
  ListItemWidget({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItemWidget> {
  void didTap() {
    print("tap $widget.post");

    Navigator.push(context, 
      new MaterialPageRoute(builder: (context) {
        return new DetailPage();
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.post.title),
      onTap: didTap,
    );
  } 
}