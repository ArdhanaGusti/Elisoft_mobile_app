import 'dart:convert';

import 'package:article_app_elisoft/data/model/article_detail_model.dart';
import 'package:article_app_elisoft/data/model/article_model.dart';
import 'package:article_app_elisoft/data/model/user_model.dart';
import 'package:article_app_elisoft/utils/exception.dart';
import 'package:http/http.dart' as http;

abstract class DatabaseRemoteDataSource {
  Future<User> loginUser(String email, String pass);
  Future<List<Article>> getArticles();
  Future<Article> getArticleDetails(String uuid);
}

class DatabaseRemoteDataSourceImpl implements DatabaseRemoteDataSource {
  static const baseUrl = 'https://demo.treblle.com/api/v1';

  final http.Client client;

  DatabaseRemoteDataSourceImpl({required this.client});

  @override
  Future<User> loginUser(String email, String pass) async {
    final response = await client.post(Uri.parse('$baseUrl/auth/login'), body: {
      "email": email,
      "password": pass,
    });
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)).user;
    } else {
      throw ServerException("Can't connect to server");
    }
  }

  @override
  Future<List<Article>> getArticles() async {
    final response = await client.get(Uri.parse('$baseUrl/articles'));
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(jsonDecode(response.body)).articles;
    } else {
      throw ServerException("Can't connect to server");
    }
  }

  @override
  Future<Article> getArticleDetails(String uuid) async {
    final response = await client.get(Uri.parse('$baseUrl/articles/$uuid'));
    if (response.statusCode == 200) {
      return ArticleDetailModel.fromJson(jsonDecode(response.body)).article;
    } else {
      throw ServerException("Can't connect to server");
    }
  }
}
