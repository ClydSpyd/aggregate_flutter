class Article {
  final String id;
  final String title;
  final String caption;
  final String content;
  final String imgUrl;
  final List<String> tags;
  final String rawContent;
  final String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.caption,
    required this.content,
    required this.imgUrl,
    required this.tags,
    required this.rawContent,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['_id'],
      title: json['title'],
      caption: json['caption'],
      content: json['content'],
      imgUrl: json['imgUrl'],
      tags: List<String>.from(json['tags']),
      rawContent: json['rawContent'],
      createdAt: json['createdAt'],
    );
  }
}
