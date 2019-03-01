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

  Column contentColumn() {
    var hintString = widget.topic.nodeTitle + "  ";
    hintString += widget.topic.username + "  ";
    var replyString = "${widget.topic.replies}条回复";
    replyString += "  " + Date.convertTimestamp2String(widget.topic.lastModified);

    return Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didTap,
      behavior: HitTestBehavior.translucent,
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
          child: contentColumn(),
        ),
      ),
    );
  } 
}