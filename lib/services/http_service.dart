// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;
  String? _authToken;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.API_BASE_URL;
    print("HTTP_BASE_URL: $_base_url");
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authToken != null) {
          options.headers['Cookie'] = 'authToken=$_authToken';
        }
        return handler.next(options);
      },
    ));
  }

  Future<Object> fetch(String path) async {
    try {
      print('HTTPService: Fetching data from $_base_url/$path');
      Response data = await dio.get('$_base_url/$path');
      return data;
    } catch (e) {
      print('HTTPService: Unable to perform fetch request');
      print(e);
      return e;
    }
  }

  void setAuthToken(String token) {
    _authToken = token;
  }

  Future<Object> getAllArticles() async {
    print("GET ALL ARTICLES");
    print("ARTICLE_BASE_URL: $_base_url/article/all");
    try {
      Response data = await dio.get('$_base_url/article/all');
      print(data);
      return data;
    } catch (e) {
      print(e);
      return e;
    }
  }

  // Future<Object> getRecipeById(String id) async {
  //   print("GET RANDOM");
  //   try {
  //     Response data = await dio.get('$_base_url/lookup.php?i=$id');
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     return e;
  //   }
  // }

  // Future<Object> getRandomRecipe() async {
  //   print("GET RANDOM");
  //   try {
  //     Response data = await dio.get('$_base_url/random.php');
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     return e;
  //   }
  // }
}
