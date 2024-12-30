import 'package:flutter/material.dart';
import 'package:news_test/types/Article.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
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
                articles[index].title,
                textAlign: TextAlign.center,
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
}
