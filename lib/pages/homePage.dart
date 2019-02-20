import 'package:flutter/material.dart';
import 'package:v2ex_flutter/widgets/listItem.dart';
import 'package:v2ex_flutter/controllers/request.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  List<Widget> _itemList = [];

  Future<Null> _refresh() async {
    var _dataList = await Request.latestList();
    setState(() {
      _itemList.clear();
      _dataList.forEach((map) => _itemList.add(ListItemWidget(topic: map))); 
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
    Widget divider = Divider(color: Colors.grey);
    Widget header = Container(height: 20);
    Widget footer = Container(height: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: ListView.separated(
            itemCount: _itemList.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return header;
              }
              if (index == _itemList.length + 1) {
                return footer;
              }
              return _itemList[index - 1];
            },
            separatorBuilder: (BuildContext context, int index) {
              return divider;
            },
          ),
        ),
      ),
    );
  }
}