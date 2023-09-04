import 'package:cleanlearn/core/resources/data_state.dart';
import 'package:cleanlearn/features/daily_news/data/models/article.dart';
import 'package:cleanlearn/features/daily_news/domain/repository/article_repositoty.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    throw UnimplementedError();
  }
}
