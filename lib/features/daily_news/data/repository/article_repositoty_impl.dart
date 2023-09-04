import 'dart:io';

import 'package:cleanlearn/core/resources/data_state.dart';
import 'package:cleanlearn/core/util/constants.dart';
import 'package:cleanlearn/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:cleanlearn/features/daily_news/data/models/article.dart';
import 'package:cleanlearn/features/daily_news/domain/repository/article_repositoty.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              requestOptions: httpResponse.response.requestOptions,
              error: httpResponse.response.statusMessage,
              type: DioExceptionType.badResponse,
              response: httpResponse.response),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
