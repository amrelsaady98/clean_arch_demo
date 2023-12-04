import 'package:clean_arch_demo/core/resourses/data_state.dart';
import 'package:clean_arch_demo/features/daily_news/data/models/articel_model.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article_entity/article_entity.dart';
import 'package:clean_arch_demo/features/daily_news/domain/repositories/articel_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getArticles() {
    throw UnimplementedError();
  }
}
