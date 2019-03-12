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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void updateNodeList() async {
    var newList = await Preference.nodeList();
    List<Node> allList = await Preference.allNodeList();
    if (allList == null || allList.length == 0) {
      //only request once.
      allList = await Request.allNodeList();
      Preference.setALLNodeList(allList);
    }

    setState(() {
      nodeList = newList;
      remainNodeList = [];
      for (Node node in allList) {
        if (!newList.contains(node)) {
          remainNodeList.add(node);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    updateNodeList();
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("分类列表"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => { 
              showDialog(
                context: context,
                child: AlertDialog(
                  content: Text("是否保存？"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text("确定"),
                      onPressed: () {
                        Navigator.pop(context);
                        Preference.setNodeList(nodeList);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("保存成功"),
                        ));
                      }
                    )
                  ],
                )
              )
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: ListView(
          children: <Widget>[
            titleWidget("我的分类"),
            Wrap(
              children: nodeList.map((node) => 
                GestureDetector(
                  child: nodeCard(node),
                  onTap: () => {
                    setState(() {
                      nodeList.remove(node);
                      remainNodeList.add(node);
                    })
                  },
                )
              ).toList(),
            ),
            Container(height: 20,),
            titleWidget("点击添加到分类"),
            Wrap(
              children: remainNodeList.map((node) => 
                GestureDetector(
                  child: nodeCard(node),
                  onTap: () => {
                    setState(() {
                      nodeList.add(node);
                      remainNodeList.remove(node);
                    })
                  },
                )
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}