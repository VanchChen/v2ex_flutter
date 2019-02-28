import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../widgets/detailItem.dart';
import '../controllers/request.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.topic}) : super(key: key);

  final Topic topic;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Widget _titleItem;
  DetailItemWidget _topicItem;
  List _itemList = [];

  Future<Null> _refresh() async {
    var _dataList = await Request.topicReplyList(widget.topic.id);
    
    setState(() {
      _itemList = _dataList;
    });
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

    Future.delayed(Duration(milliseconds: 200)).then((_) {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget footer = Container(height: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Center(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: ListView.builder(
            itemCount: _itemList.length + 3,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _titleItem;
              }
              if (index == 1) {
                return _topicItem;
              }
              if (index == _itemList.length + 2) {
                return footer;
              }
              return DetailItemWidget(reply: _itemList[index - 2]);
            },
          ),
        )
      ),
    );
  }
}