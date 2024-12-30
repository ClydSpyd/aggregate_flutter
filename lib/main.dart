// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:news_test/models/app_config.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS TEST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'AGGREGATE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void _fetchData() async {
  AppConfig appConfig = GetIt.instance.get<AppConfig>();
  HTTPService httpService = GetIt.instance.get<HTTPService>();
  httpService.setAuthToken(appConfig.AUTH_TOKEN);
  httpService.getAllArticles();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    _fetchData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to NËWS',
            ),
            Text(
              'HELLO WORLD',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
