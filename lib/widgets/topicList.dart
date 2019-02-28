import 'package:flutter/material.dart';
import 'package:v2ex_flutter/widgets/listItem.dart';
import 'package:v2ex_flutter/controllers/request.dart';

class TopicList extends StatefulWidget {
  TopicList({Key key, this.topicID, this.topicName}) : super(key: key);

  final int topicID;
  final String topicName;

  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  List _itemList = [];

  Future<Null> _refresh() async {
    var _dataList = await Request.latestList();
    setState(() {
      _itemList =_dataList;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200)).then((_) {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  @override 
  Widget build(BuildContext context) {
    Widget stuff = Container(height: 5);
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      //ListView生成全部 ListView.builder只生成visible
      child: Container(
        color: Color(0xFFE8E8E8),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _itemList.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return stuff;
            }
            if (index == _itemList.length + 1) {
              return stuff;
            }
            return ListItemWidget(topic: _itemList[index - 1]);
          },
        ),
      )
    );
  }
}