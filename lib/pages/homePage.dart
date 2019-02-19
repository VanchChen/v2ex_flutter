import 'package:flutter/material.dart';
import '../widgets/listItem.dart';
import 'package:dio/dio.dart';
import '../models/topic.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _itemList = [];

  Future<Null> _refresh() async {
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/topics/latest.json");
    if (response.statusCode == 200) {
      setState(() {
        _itemList.clear();
        response.data.forEach((map) => _itemList.add(ListItemWidget(topic: Topic.fromJson(map)))); 
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    Widget divider = Divider(color: Colors.grey);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.separated(
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemList[index];
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