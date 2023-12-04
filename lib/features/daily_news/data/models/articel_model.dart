import 'dart:convert';

import 'package:clean_arch_demo/features/daily_news/domain/entities/article_entity/article_entity.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article_entity/source.dart';
import 'package:flutter/material.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.source,
    super.author,
    super.content,
    super.description,
    super.publishedAt,
    super.title,
    super.url,
    super.urlToImage,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> data) => ArticleModel(
        source: data['source'] == null
            ? null
            : Source.fromMap(data['source'] as Map<String, dynamic>),
        author: data['author'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        url: data['url'] as String?,
        urlToImage: data['urlToImage'] as String?,
        publishedAt: data['publishedAt'] as String?,
        content: data['content'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'source': source?.toMap(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ArticleEntity].
  factory ArticleModel.fromJson(String data) {
    return ArticleModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ArticleEntity] to a JSON string.

  String toJson() => json.encode(toMap());
}
