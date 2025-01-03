import 'package:flutter/material.dart';
import 'package:news_test/pages/article_page.dart';
import 'package:news_test/types/article.dart';
import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('dd-MM-yyyy');

class ArticleList extends StatelessWidget {
  final List<Article> articles;
  final String title;

  const ArticleList({super.key, required this.articles, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 4.0, horizontal: 8), // Add top and bottom padding
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  debugPrint('Tapped on ${articles[index].title}');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ArticlePage(articleId: articles[index].id);
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        // Image Container
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Container(
                            width: 120, // Set width for the image container
                            height: 100, // Set the desired height
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(articles[index].imgUrl),
                                fit: BoxFit
                                    .cover, // Ensure image fills the container
                              ),
                            ),
                          ),
                        ),
                        // Title Text
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    formatter.format(DateTime.parse(
                                        articles[index].createdAt)),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.w700)),
                                Text(
                                  articles[index].title,
                                  maxLines: 2, // Limit text to 2 lines
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
