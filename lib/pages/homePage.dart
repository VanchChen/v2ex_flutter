import 'package:flutter/material.dart';
import 'package:v2ex_flutter/widgets/topicList.dart';
import 'package:v2ex_flutter/models/node.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  var _tabList = [
    Node(id: TopicList.TopicHot, title: "热门"), 
    Node(id: TopicList.TopicLatest, title: "最新")
  ];

  Widget titleList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _tabList.length,
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
          onPressed: () {
            if (_selectedIndex != index) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          child: Text(
            _tabList[index].title, 
            style: TextStyle(
              color: _selectedIndex == index ? 
                Colors.brown : Colors.black
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 30,
              child: titleList(),
            ),
            Flexible(
              child: TopicList(nodeID: _tabList[_selectedIndex].id),
            ),
          ],
        )
      ),
    );
  }
}