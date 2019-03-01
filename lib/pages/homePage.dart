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
  var _pageController = PageController();
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
              _pageController.animateToPage(
                _selectedIndex, 
                duration: Duration(milliseconds: 400), 
                curve: Curves.easeOut
              );
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
    List<TopicList> _tabPageList = _tabList.map((node) => TopicList(nodeID: node.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color(0xFFE8E8E8),
        child: Column(
          children: <Widget>[
            Container(
              height: 30,
              child: titleList(),
            ),
            Flexible(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: _tabPageList,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });

                  _tabPageList[_selectedIndex].scrollToTop();
                },
              )
            )
          ],
        )
      ),
    );
  }
}