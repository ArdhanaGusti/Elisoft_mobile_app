import 'package:article_app_elisoft/data/datasource/database_remote_datasource.dart';
import 'package:article_app_elisoft/data/repository/data_repositories.dart';
import 'package:article_app_elisoft/domain/repository/data_repositories.dart';
import 'package:article_app_elisoft/domain/usecase/get_article_detail.dart';
import 'package:article_app_elisoft/domain/usecase/get_articles.dart';
import 'package:article_app_elisoft/domain/usecase/login_user.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_bloc.dart';
import 'package:article_app_elisoft/presentation/bloc/user/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  //Bloc
  locator.registerFactory(
    () => UserBloc(
      locator(),
    ),
  );

  locator.registerFactory(
    () => ArticleBloc(
      locator(),
      locator(),
    ),
  );

  //usecase
  locator.registerLazySingleton(() => LoginUser(locator()));
  locator.registerLazySingleton(() => GetArticles(locator()));
  locator.registerLazySingleton(() => GetArticleDetails(locator()));

  //repository
  locator.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  //datasource
  locator.registerLazySingleton<DatabaseRemoteDataSource>(
    () => DatabaseRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  //helper
  locator.registerFactory(() => http.Client());
}
