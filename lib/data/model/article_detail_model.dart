import 'dart:convert';

import 'package:article_app_elisoft/data/model/article_model.dart';

ArticleDetailModel articleModelFromJson(String str) =>
    ArticleDetailModel.fromJson(json.decode(str));

String articleModelToJson(ArticleDetailModel data) =>
    json.encode(data.toJson());

class ArticleDetailModel {
  int code;
  bool status;
  String message;
  Article article;

  ArticleDetailModel({
    required this.code,
    required this.status,
    required this.message,
    required this.article,
  });

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) =>
      ArticleDetailModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        article: Article.fromJson(json["article"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "article": article.toJson(),
      };
}
