import 'package:flutter/material.dart';
import 'package:v2ex_flutter/models/topic.dart';
import 'package:v2ex_flutter/models/reply.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:v2ex_flutter/utils/date.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    int index;
    String content;
    String avatar;
    if (widget.reply != null) {
      userName = widget.reply.username;
      date = widget.reply.lastModified;
      content = widget.reply.contentRendered;
      avatar = widget.reply.avatar;
      index = widget.reply.index;
    } else {
      userName = widget.topic.username;
      date = widget.topic.lastModified;
      content = widget.topic.contentRendered;
      avatar = widget.topic.avatar;
      index = 0;
    }

    var dateString = Date.convertTimestamp2String(date);

    Container headerTitle = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userName, textAlign: TextAlign.left, textScaleFactor: 1),
          Text(
            "$dateString", 
            textAlign: TextAlign.left, 
            textScaleFactor: 0.7,
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      )
    );
    Container header = Container(
      height: 32,
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: CachedNetworkImageProvider(avatar),
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(child: headerTitle),
          Text(
            index == 0 ? "楼主" : "$index 楼",
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
    Widget divider = Divider(color: Colors.grey);
    return Container(
      padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          divider,
          Html(
            data: content,
            onLinkTap: (url) {
              print("tap " +  url);
            },
          )
        ],
      )
    );
  }
}