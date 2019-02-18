import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../models/reply.dart';

class DetailItemWidget extends StatefulWidget {
  final Topic topic;
  final Reply reply;

  DetailItemWidget({Key key, this.topic, this.reply}) : super(key:key);

  @override
  DetailItemState createState() => DetailItemState();  
}

class DetailItemState extends State<DetailItemWidget> {
  @override
  Widget build(BuildContext context) {
    String userName;
    int date;
    String content;
    String avatar;
    if (widget.reply != null) {
      userName = widget.reply.username;
      date = widget.reply.last_modified;
      content = widget.reply.content_rendered;
      avatar = widget.reply.avatar;
    } else {
      userName = widget.topic.username;
      date = widget.topic.last_modified;
      content = widget.topic.content_rendered;
      avatar = widget.topic.avatar;
    }

    Container headerTitle = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userName, textAlign: TextAlign.left, textScaleFactor: 1.2),
          Text("$date", textAlign: TextAlign.left, textScaleFactor: 0.8,)
        ],
      )
    );
    Container header = Container(
      height: 44,
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: CircleAvatar(
              radius: 19,
              backgroundImage: AssetImage('assets/icon.png'),
              backgroundColor: Colors.white,
            ),
          ),
          headerTitle,
          Text("楼主")
        ],
      ),
    );
    return Container(
      padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          Text(content)
        ],
      )
    );
    
  }
}