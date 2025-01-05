// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_test/models/app_config.dart';
import 'package:news_test/services/http_service.dart';
import 'package:news_test/types/api_response.dart';
import 'package:news_test/types/article.dart';
import 'package:news_test/types/home_state_model.dart';
import 'package:news_test/widgets/article_carousel.dart';
import 'package:news_test/widgets/article_listt_v2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppConfig appConfig;
  late HTTPService httpService;
  List<Article> articles = [];
  bool isLoading = true;
  HomeStateModel? homeState;
  String? error;

  @override
  void initState() {
    super.initState();
    appConfig = GetIt.instance.get<AppConfig>();
    httpService = GetIt.instance.get<HTTPService>();
    httpService.setAuthToken(appConfig.AUTH_TOKEN);
    // fetchArticles();
    fetchHomeState();
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

  Future<void> fetchHomeState() async {
    try {
      final ApiResponse response = await httpService.getHomeContent();
      if (response.success) {
        // Safely access data when the request is successful
        final data = response.data;
        print("DATA: $data");

        setState(() {
          homeState = HomeStateModel.fromJson(data);
          isLoading = false;
        });
      } else {
        // Handle the error case
        setState(() {
          isLoading = false;
          error = response.error;
        });
        print("Error fetching home content: ${response.error}");
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // @todo handle error
      print('Error in fetchHomeState: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 44,
                color: Colors.cyan,
              ),
              const Text('An error occurred', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 8),
              Text(
                '$error',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.cyan),
              ),
            ],
          ),
        ),
      );
    }

    if (homeState == null ||
        homeState!.tracks.isEmpty ||
        homeState!.tracks[0].articles.isEmpty) {
      return const Center(child: Text('No articles found'));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ArticleCarousel(
                articles: homeState!.carouselItems, title: 'Latest News'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ArticleList(
                articles: homeState!.tracks[0].articles, title: 'Trending Now'),
          )
        ],
      ),
    );
    // child: ArticleList(articles: homeState.tracks[0].articles),
  }
}
