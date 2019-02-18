import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/topic.dart';
import '../models/reply.dart';
import '../widgets/detailItem.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.topic}) : super(key: key);

  final Topic topic;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget _titleItem;
  DetailItemWidget _topicItem;
  List<DetailItemWidget> _itemList = [];

  Future<Null> _refresh() async {
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/replies/show.json?topic_id=${widget.topic.id}&p=1");
    if (response.statusCode == 200) {
      setState(() {
        _itemList.clear();
        response.data.forEach((map) => _itemList.add(DetailItemWidget(reply: Reply.fromJson(map)))); 
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _titleItem = Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Text(
        widget.topic.title, 
        textScaleFactor: 1.2,
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
        )
      ),
    );

    _topicItem = DetailItemWidget(topic: widget.topic);

    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(color: Colors.grey);
    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.separated(
            itemCount: _itemList.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _titleItem;
              }
              if (index == 1) {
                return _topicItem;
              }
              return _itemList[index - 1];
            },
            separatorBuilder: (BuildContext context, int index) {
              return divider;
            },
          ),
        )
      ),
    );
  }
}