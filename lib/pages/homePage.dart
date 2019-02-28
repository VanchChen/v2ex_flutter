import 'package:flutter/material.dart';
import 'package:v2ex_flutter/widgets/topicList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Text("data");
                },
              ),
            ),
            Flexible(
              child: TopicList(),
            ),
          ],
        )
      ),
    );
  }
}