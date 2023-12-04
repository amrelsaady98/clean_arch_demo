import 'package:clean_arch_demo/core/constants/constants.dart';
import 'package:clean_arch_demo/features/daily_news/data/data_sourses/remote/news_api_service.dart';
import 'package:clean_arch_demo/features/daily_news/data/models/articel_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            child: Text('Hello World!'),
            onTap: () async {
              Response<List<ArticleModel>> _response =
                  await NewsApiServices().getArticles(apiKey: NEWS_API_KEY);
              print("${_response.statusCode}");
              print("${_response.statusMessage}");
            },
          ),
        ),
      ),
    );
  }
}
