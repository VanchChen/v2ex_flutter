class Reply {
  int          index;
  final int    id;
  final int    topicID;
  final int    memberID;
  final String avatar;
  final String username;
  final String content;
  final String contentRendered;
  final int    created;
  final int    lastModified;

  Reply.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      topicID = json['topic_id'],
      memberID = json['member_id'],
      avatar = "https:" + json['member']['avatar_normal'],
      username = json['member']['username'],
      content = json['content'],
      contentRendered = json['content_rendered'],
      created = json['created'],
      lastModified = json['last_modified'];
}