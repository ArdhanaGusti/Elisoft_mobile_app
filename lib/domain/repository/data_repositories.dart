import 'package:article_app_elisoft/data/model/article_model.dart';
import 'package:article_app_elisoft/data/model/user_model.dart';
import 'package:article_app_elisoft/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class DataRepository {
  Future<Either<Failure, User>> loginUser(String email, String pass);
  Future<Either<Failure, List<Article>>> getArticles();
  Future<Either<Failure, Article>> getArticleDetail(String uuid);
}
