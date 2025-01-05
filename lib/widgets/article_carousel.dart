import 'package:flutter/material.dart';
import 'package:news_test/pages/article_page.dart';
import 'package:news_test/types/article.dart';
import 'package:news_test/utils/navigation_util.dart';

class ArticleCarousel extends StatelessWidget {
  final List<Article> articles;
  final String title;

  const ArticleCarousel(
      {super.key, required this.articles, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 16.0), // Add top and bottom padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
              height: 8), // Add some space between the title and the carousel
          Expanded(
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.95,
                initialPage: articles.length * 5,
              ),
              itemBuilder: (context, index) {
                final articleIndex = index % articles.length;
                return _ArticleCard(article: articles[articleIndex]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final Article article;

  const _ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Tapped on ${article.title}');
        navigateWithSlideTransition(
            context, ArticlePage(articleId: article.id));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Article text
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article.caption,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
