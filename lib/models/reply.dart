class Reply {
  int          index;
  final int    id;
  final int    topic_id;
  final int    member_id;
  final String avatar;
  final String username;
  final String content;
  final String content_rendered;
  final int    created;
  final int    last_modified;

  Reply.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      topic_id = json['topic_id'],
      member_id = json['member_id'],
      avatar = "https:" + json['member']['avatar_normal'],
      username = json['member']['username'],
      content = json['content'],
      content_rendered = json['content_rendered'],
      created = json['created'],
      last_modified = json['last_modified'];
}