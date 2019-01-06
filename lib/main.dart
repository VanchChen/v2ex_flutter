import 'package:flutter/material.dart';
import 'widgets/list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'V2EX'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _itemList = [
    ListItemWidget(title: "aaa"),
    ListItemWidget(title: "bbb"),
    ListItemWidget(title: "ccc"),
   ];
/*
  void _updateItemList() {
    setState(() {
      
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return _itemList[index];
          },
        ),
      ),
    );
  }
}