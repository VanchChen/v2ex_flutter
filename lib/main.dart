import 'package:flutter/material.dart';
import 'widgets/list_item.dart';
import 'package:dio/dio.dart';
import 'models/post.dart';

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
  List<Widget> _itemList = [];

  Future<Null> _pullDownRefresh() async {
    print('pull down');
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/topics/hot.json");
    if (response.statusCode == 200) {
      setState(() {
        _itemList.clear();
        response.data.forEach((map) => _itemList.add(ListItemWidget(post: Post.fromJson(map)))); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: _pullDownRefresh,
          child: ListView.builder(
            itemCount: _itemList.length,
            itemExtent: 44,
            itemBuilder: (BuildContext context, int index) {
              return _itemList[index];
            },
          ),
        ),
      ),
    );
  }
}