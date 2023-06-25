import 'package:article_app_elisoft/data/model/user_model.dart';
import 'package:article_app_elisoft/domain/repository/data_repositories.dart';
import 'package:article_app_elisoft/utils/failure.dart';
import 'package:dartz/dartz.dart';

class LoginUser {
  final DataRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, User>> execute(String email, String pass) {
    return repository.loginUser(email, pass);
  }
}
