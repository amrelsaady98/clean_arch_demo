import 'dart:io';

import 'package:clean_arch_demo/core/constants/constants.dart';
import 'package:clean_arch_demo/core/services/internet_service/dio_client.dart';
import 'package:clean_arch_demo/core/services/internet_service/dio_exception.dart'
    as dio_exception;
import 'package:clean_arch_demo/features/daily_news/data/models/articel_model.dart';
import 'package:dio/dio.dart';

class NewsApiServices {
  Future<Response<List<ArticleModel>>> getArticles(
      {required String apiKey, String? country, String? category}) async {
    try {
      var _response =
          await DioClient.instance.get("/top-headlines", queryParameters: {
        "apiKey": apiKey,
        "country": country ?? "eg",
        "category": category ?? "general",
      });
      List<ArticleModel> _value = _response.data!['articles']
          .map<ArticleModel>(
              (dynamic i) => ArticleModel.fromMap(i as Map<String, dynamic>))
          .toList();
      return Response(
        data: _value,
        statusCode: _response.statusCode,
        requestOptions: _response.requestOptions,
      );
    } on DioError catch (e) {
      var error = dio_exception.DioException.fromDioError(e);
      return Response(
        requestOptions: e.requestOptions,
        statusCode: e.response?.statusCode,
        statusMessage: dio_exception.DioException.fromDioError(e).errorMessage,
      );
    }
  }
}
