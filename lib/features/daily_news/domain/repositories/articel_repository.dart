import 'package:clean_arch_demo/core/resourses/data_state.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article_entity/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
