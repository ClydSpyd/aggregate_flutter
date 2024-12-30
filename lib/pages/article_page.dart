// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_test/models/app_config.dart';
import 'package:news_test/services/http_service.dart';
import 'package:news_test/types/Article.dart';
import 'package:news_test/widgets/article_listt_v2.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late AppConfig appConfig;
  late HTTPService httpService;
  List<Article> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    appConfig = GetIt.instance.get<AppConfig>();
    httpService = GetIt.instance.get<HTTPService>();
    httpService.setAuthToken(appConfig.AUTH_TOKEN);
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      final Response response = await httpService.getAllArticles() as Response;
      final List<dynamic> data = response.data;
      setState(() {
        articles = data.map((article) => Article.fromJson(article)).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // @todo handle error
      print('Error fetching articles: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (articles.isEmpty) {
      return const Center(child: Text('No articles found'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ArticleList(articles: articles),
    );
  }
}
