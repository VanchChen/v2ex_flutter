/*
https://www.v2ex.com/api/nodes/show.json?name=python  node_id 节点信息

用户主页
https://www.v2ex.com/api/members/show.json?username=Livid
https://www.v2ex.com/api/members/show.json?id=1

https://www.v2ex.com/api/nodes/all.json 所有节点

/api/topics/show.json node_id node_name username 某一主题下的帖子 p 页码

/api/replies/show.json topic_id 某一帖子的回复

*/

import 'package:dio/dio.dart';
import 'package:v2ex_flutter/models/topic.dart';
import 'package:v2ex_flutter/models/reply.dart';

class Request {
  static Future<List> hotList() async {
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/topics/hot.json");
    if (response.statusCode == 200) {
        var list = [];
        response.data.forEach((map) => list.add(Topic.fromJson(map))); 
        return list;
    }
    return [];
  } 

  static Future<List> latestList() async {
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/topics/latest.json");
    if (response.statusCode == 200) {
        var list = [];
        response.data.forEach((map) => list.add(Topic.fromJson(map))); 
        return list;
    }
    return [];
  }

  static Future<List> topicList(int nodeID) async {
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/topics/show.json?node_id=$nodeID");
    if (response.statusCode == 200) {
        //var list = [];
        //response.data.forEach((map) => list.add(Topic.fromJson(map))); 
        //return list;
    }
    return [];
  }

  static Future<List> topicReplyList(int topicID) async {
    Dio dio = Dio();
    Response<List> response = await dio.get("https://www.v2ex.com/api/replies/show.json?topic_id=$topicID");
    if (response.statusCode == 200) {
        var list = [];
        for (var i = 0; i < response.data.length; i++) {
          var reply =  Reply.fromJson(response.data[i]);
          reply.index = i + 1;
          list.add(reply);
        }
        return list;
    }
    return [];
  }
}