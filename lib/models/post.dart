class Post {
  final int    id;
  final String username;
  final String title;
  final String url;
  final String content;
  final int    replies;
  final int    created;

  Post.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      username = json['member']['username'],
      title = json['title'],
      url = json['url'],
      content = json['content'],
      replies = json['replies'],
      created = json['created'];
}