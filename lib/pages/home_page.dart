// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:news_test/widgets/Article_List.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.limeAccent),
              foregroundColor:
                  WidgetStateProperty.all<Color>(Colors.purpleAccent),
            ),
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search button clicked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print('Notification button clicked');
            },
          ),
        ],
      ),
      body: const Center(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: ArticleList()),
        )),
      ),
    );
  }
}
