import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final String articleId;
  const ArticlePage({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack for Overlapping Layout
            Stack(
              clipBehavior: Clip.none, // Allow overlap
              children: [
                Image.network(
                  'https://i.pinimg.com/736x/e5/b9/81/e5b98110fcd62d6ebe0e636262170175.jpg',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  height: MediaQuery.of(context).size.height * 0.1,
                  bottom: 0.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  height: MediaQuery.of(context).size.height * 0.2,
                  top: 0.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 24.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black.withOpacity(0.6),
                            size: 35.0,
                          ),
                          onPressed: () {
                            debugPrint('Tapped on back button');
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // Background Image
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Article Title',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.Article content goes here. This is a placeholder for the article content.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
