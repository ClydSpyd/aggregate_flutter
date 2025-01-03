// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:news_test/models/app_config.dart';
import 'package:news_test/widgets/app_bar_main.dart';
import 'package:news_test/pages/home_page.dart';
import 'package:news_test/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadConfig();
  registerHttpService();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String configContent = await rootBundle.loadString('assets/config/main.json');
  Map configData = jsonDecode(configContent);
  GetIt.instance.registerSingleton<AppConfig>(AppConfig(
      API_BASE_URL: configData["API_BASE_URL"],
      AUTH_TOKEN: configData["AUTH_TOKEN"]));
  print("API_BASE_URL: ${configData["API_BASE_URL"]}");
}

void registerHttpService() {
  GetIt.instance.registerSingleton<HTTPService>(HTTPService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS TEST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: const AppBarMain(),
        body: const HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.amp_stories_rounded),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_rounded),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps_rounded),
              label: 'Discover',
            ),
          ],
        ),
      ),
    );
  }
}
