import 'package:shared_preferences/shared_preferences.dart';
import 'package:v2ex_flutter/models/node.dart';
import 'dart:convert';

class Preference {
  static List<Node> defaultNodeList() {
    return [
      Node(id: Node.HotID, title: "热门"), 
      Node(id: Node.LatestID, title: "最新"),
    ];
  }

  static Future<List<Node>> nodeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = prefs.getStringList("NodeList");
    if (jsonList == null || jsonList.length == 0) {
      //一个都没有，填充初始值
      setNodeList(defaultNodeList());
      return defaultNodeList();
    }
    return jsonList.map((json) => Node.fromJson(jsonDecode(json))).toList();
  }

  static Future<bool> setNodeList(List<Node> nodeList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("NodeList", nodeList.map((node) => jsonEncode(node)).toList());
  }

  static Future<List<Node>> allNodeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = prefs.getStringList("AllNodeList");
    if (jsonList == null) return [];
    return jsonList.map((json) => Node.fromJson(jsonDecode(json))).toList();
  }

  static Future<bool> setALLNodeList(List<Node> nodeList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("AllNodeList", nodeList.map((node) => jsonEncode(node)).toList());
  }
}