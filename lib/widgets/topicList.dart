import 'package:flutter/material.dart';
import 'package:v2ex_flutter/widgets/listItem.dart';
import 'package:v2ex_flutter/controllers/request.dart';
import 'package:v2ex_flutter/models/node.dart';

class TopicList extends StatefulWidget {
  TopicList({Key key, this.nodeID}) : super(key: key);

  final int nodeID;

  final ScrollController _scrollController = ScrollController();

  void scrollToTop () {
    _scrollController.jumpTo(0);
  }

  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  List _itemList = [];

  Future<Null> _refresh() async {
    var _dataList;
    if (widget.nodeID == Node.HotID) {
      _dataList = await Request.hotList();
    } else if (widget.nodeID == Node.LatestID) {
      _dataList = await Request.latestList();
    } else if (widget.nodeID > 0) {
      _dataList = await Request.topicList(widget.nodeID, "");
    }

    if (this.mounted) {
      setState(() {
        _itemList =_dataList;
      });
    }
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
    Widget stuff = Container(height: 2);
    
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        //ListView生成全部 ListView.builder只生成visible
        child: ListView.builder(
          controller: widget._scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _itemList.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return stuff;
            }
            if (index == _itemList.length + 1) {
              return stuff;
            }
            return Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: ListItemWidget(topic: _itemList[index - 1]),
            );
          },
        )
      )
    );
  }
}