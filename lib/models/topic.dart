class Topic {
  final int    id;
  final int    nodeID;
  final String nodeName;
  final String nodeTitle;
  final int    memberID;
  final String avatar;
  final String username;
  final String title;
  final String url;
  final String content;
  final String contentRendered;
  final int    replies;
  final int    created;
  final int    lastModified;

  Topic.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nodeID = json['node']['id'],
      nodeName = json['node']['name'],
      nodeTitle = json['node']['title'],
      memberID = json['member']['id'],
      avatar = "https:" + json['member']['avatar_normal'],
      username = json['member']['username'],
      title = json['title'],
      url = json['url'],
      content = json['content'],
      contentRendered = json['content_rendered'],
      replies = json['replies'],
      created = json['created'],
      lastModified = json['last_modified'];
}