// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_test/types/article.dart';
import 'package:news_test/services/http_service.dart';
import 'package:news_test/widgets/article_content.dart';

class ArticlePage extends StatefulWidget {
  final String articleId;
  const ArticlePage({super.key, required this.articleId});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool isLoading = true;
  late HTTPService httpService;
  late Article article;

  @override
  void initState() {
    super.initState();
    httpService = GetIt.instance.get<HTTPService>();
    fetchArticle();
  }

  Future<void> fetchArticle() async {
    try {
      final Response response =
          await httpService.fetchArticle(widget.articleId) as Response;
      final data = response.data;

      setState(() {
        article = Article.fromJson(data);
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // @todo handle error
      print('Error fetching article: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return ArticleContent(article: article);
  }
}
