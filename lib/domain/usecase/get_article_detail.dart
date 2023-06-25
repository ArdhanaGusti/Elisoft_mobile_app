import 'package:article_app_elisoft/data/model/article_model.dart';
import 'package:article_app_elisoft/domain/repository/data_repositories.dart';
import 'package:article_app_elisoft/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetArticleDetails {
  final DataRepository repository;

  GetArticleDetails(this.repository);

  Future<Either<Failure, Article>> execute(String uuid) {
    return repository.getArticleDetail(uuid);
  }
}
