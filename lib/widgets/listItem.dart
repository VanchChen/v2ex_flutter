import 'package:flutter/material.dart';
import 'package:v2ex_flutter/models/topic.dart';
import 'package:v2ex_flutter/pages/detailPage.dart';
import 'package:v2ex_flutter/utils/date.dart';

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
    var hintString = widget.topic.node_title + "  ";
    hintString += widget.topic.username + "  ";
    var replyString = "${widget.topic.replies}条回复";
    replyString += "  " + Date.convertTimestamp2String(widget.topic.last_modified);

    return GestureDetector(
      onTap: didTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.topic.title, 
              textScaleFactor: 1.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  hintString, 
                  textScaleFactor: 0.8,
                  style: TextStyle(
                    color: Colors.blueGrey
                  ),
                ),
                Text(
                  replyString, 
                  textScaleFactor: 0.7,
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  } 
}