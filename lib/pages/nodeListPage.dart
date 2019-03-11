import 'package:flutter/material.dart';
import 'package:v2ex_flutter/controllers/preference.dart';
import 'package:v2ex_flutter/models/node.dart';
import 'package:v2ex_flutter/controllers/request.dart';

class NodeListPage extends StatefulWidget {
  @override
  _NodeListPageState createState() => _NodeListPageState();
}

class _NodeListPageState extends State<NodeListPage> {
  List<Node> nodeList = [];
  List<Node> remainNodeList = [];

  void updateNodeList() async {
    var newList = await Preference.nodeList();
    var allList = await Request.allNodeList();
    setState(() {
      nodeList = newList;
      remainNodeList = allList;
      // allList.forEach((node) => 
      //   if ()
      // );
    });
  }

  @override
  void initState() {
    super.initState();

    updateNodeList();
  }

  @override
  Widget build(BuildContext context) {
    Widget nodeCard(Node node) {
      double widgetWidth = (MediaQuery.of(context).size.width - 20);
      int divider = (widgetWidth / 80).floor();
      double width = (widgetWidth / divider).floorToDouble();
      double height = (width / 16 * 9).floorToDouble();
      return SizedBox(
        width: width,
        height: height,
        child: Card(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              node.title,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      );
    }

    var gridList = nodeList.map((node) => nodeCard(node)).toList();

    var gridRemainList = remainNodeList.map((node) => nodeCard(node)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("分类列表"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: ListView(
          children: <Widget>[
            titleWidget("我的分类"),
            Wrap(
              children: gridList,
            ),
            Container(height: 20,),
            titleWidget("点击添加到分类"),
            Wrap(
              children: gridRemainList,
            ),
          ],
        ),
      ),
    );
  }

  Widget titleWidget(String title) {
    return Text(
      title, 
      style: TextStyle(
        color: Colors.brown,
        fontSize: 12,
      ), 
      textAlign: TextAlign.left
    );
  }
}