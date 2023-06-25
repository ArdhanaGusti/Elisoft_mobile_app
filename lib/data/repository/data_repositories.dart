import 'package:article_app_elisoft/data/datasource/database_remote_datasource.dart';
import 'package:article_app_elisoft/data/model/article_model.dart';
import 'package:article_app_elisoft/data/model/user_model.dart';
import 'package:article_app_elisoft/domain/repository/data_repositories.dart';
import 'package:article_app_elisoft/utils/exception.dart';
import 'package:article_app_elisoft/utils/failure.dart';
import 'package:dartz/dartz.dart';

class DataRepositoryImpl implements DataRepository {
  final DatabaseRemoteDataSource remoteDataSource;

  DataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> loginUser(String email, String pass) async {
    try {
      final result = await remoteDataSource.loginUser(email, pass);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    try {
      final result = await remoteDataSource.getArticles();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, Article>> getArticleDetail(String uuid) async {
    try {
      final result = await remoteDataSource.getArticleDetails(uuid);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}
