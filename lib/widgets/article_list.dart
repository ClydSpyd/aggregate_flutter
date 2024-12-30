import 'package:dio/dio.dart';
import 'package:news_test/models/app_config.dart';
import 'package:news_test/services/http_service.dart';
import 'package:news_test/types/Article.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = GetIt.instance.get<AppConfig>();
    HTTPService httpService = GetIt.instance.get<HTTPService>();
    httpService.setAuthToken(appConfig.AUTH_TOKEN);

    return FutureBuilder(
        future: httpService.getAllArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Response response = snapshot.data as Response;
            List<dynamic> data = response.data;
            if (data.isEmpty) {
              return const Text('No data found');
            } else {
              List<Article> articles =
                  data.map((article) => Article.fromJson(article)).toList();
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.limeAccent,
                      ),
                      child: ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          articles[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        subtitle: Text(
                          articles[index].caption,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

// Widget itemsList(List<ListRecipe> recipes) {
//   return Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 20, vertical: 10), // Adjust the padding as needed
//       child: ListView.builder(
//         itemCount: recipes.length,
//         itemBuilder: (BuildContext context, int index) {
//           return RecipeListItem(recipe: recipes[index]);
//         },
//       ));
// }