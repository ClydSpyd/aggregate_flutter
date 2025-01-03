import 'package:news_test/types/article.dart';

class HomeStateModel {
  final List<Article> carouselItems;
  final List<Track> tracks;

  HomeStateModel({required this.carouselItems, required this.tracks});

  factory HomeStateModel.fromJson(Map<String, dynamic> json) {
    return HomeStateModel(
      carouselItems: (json['carouselItems'] as List<dynamic>)
          .map((item) => Article.fromJson(item))
          .toList(),
      tracks: (json['tracks'] as List<dynamic>)
          .map((item) => Track.fromJson(item))
          .toList(),
    );
  }
}

class Track {
  final String title;
  final List<Article> articles;

  Track({required this.title, required this.articles});
  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      title: json['title'],
      articles: (json['articles'] as List<dynamic>)
          .map((item) => Article.fromJson(item))
          .toList(),
    );
  }
}
