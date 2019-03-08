import 'package:flutter/material.dart';

class NodeListPage extends StatefulWidget {
  @override
  _NodeListPageState createState() => _NodeListPageState();
}

class _NodeListPageState extends State<NodeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("节点列表"),
      ),
      body: Container(
        child: Text("节点"),
      ),
    );
  }
}