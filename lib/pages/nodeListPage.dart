import 'package:flutter/material.dart';
import 'package:v2ex_flutter/controllers/preference.dart';
import 'package:v2ex_flutter/models/node.dart';

class NodeListPage extends StatefulWidget {
  @override
  _NodeListPageState createState() => _NodeListPageState();
}

class _NodeListPageState extends State<NodeListPage> {
  List<Node> nodeList = [];

  void updateNodeList() async {
    var newList = await Preference.nodeList();
    setState(() {
      nodeList = newList;
    });
  }

  @override
  void initState() {
    super.initState();

    updateNodeList();
  }

  @override
  Widget build(BuildContext context) {
    var gridList = nodeList.map(
      (node) => Card(
        child: Center(
          child: Text(node.title),
        ),
      )
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("分类列表"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
          children: <Widget>[
            titleWidget("我的分类"),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 6,
              childAspectRatio: 16/9,
              children: gridList,
            ),
            Container(height: 20,),
            titleWidget("点击添加到分类"),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 6,
              childAspectRatio: 16/9,
              children: gridList,
            ),
          ],
        ),
      ),
    );
  }

  Widget titleWidget(String title) {
    return Container(
      width: double.infinity,
      child: Text(
        title, 
        style: TextStyle(
          color: Colors.brown,
          fontSize: 12,
        ), 
        textAlign: TextAlign.left
      )
    );
  }
}