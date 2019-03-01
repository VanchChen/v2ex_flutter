class Node {
  final int    id;
  final int    stars;
  final int    topics;
  final String avatar;
  final String name;
  final String title;
  final String url;
  final String header;
  final String footer;
  final String parentName;

  Node({this.id, this.stars, this.topics, this.avatar, this.name, 
    this.title, this.url, this.header, this.footer, this.parentName}) : super();

  Node.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      stars = json['stars'],
      topics = json['topics'],
      avatar = "https:" + json['avatar_normal'],
      name = json['name'],
      title = json['title'],
      url = json['url'],
      header = json['header'],
      footer = json['footer'],
      parentName = json['parent_node_name'];
}