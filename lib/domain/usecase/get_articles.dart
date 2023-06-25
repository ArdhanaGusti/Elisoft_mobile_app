import 'package:article_app_elisoft/data/model/article_model.dart';
import 'package:article_app_elisoft/domain/repository/data_repositories.dart';
import 'package:article_app_elisoft/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetArticles {
  final DataRepository repository;

  GetArticles(this.repository);

  Future<Either<Failure, List<Article>>> execute() {
    return repository.getArticles();
  }
}
