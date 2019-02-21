class Topic {
  final int    id;
  final int    node_id;
  final String node_name;
  final String node_title;
  final int    member_id;
  final String avatar;
  final String username;
  final String title;
  final String url;
  final String content;
  final String content_rendered;
  final int    replies;
  final int    created;
  final int    last_modified;

  Topic.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      node_id = json['node']['id'],
      node_name = json['node']['name'],
      node_title = json['node']['title'],
      member_id = json['member']['id'],
      avatar = "https:" + json['member']['avatar_normal'],
      username = json['member']['username'],
      title = json['title'],
      url = json['url'],
      content = json['content'],
      content_rendered = json['content_rendered'],
      replies = json['replies'],
      created = json['created'],
      last_modified = json['last_modified'];
}