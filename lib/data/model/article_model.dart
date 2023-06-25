import 'dart:convert';

import 'package:article_app_elisoft/data/model/user_model.dart';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  int code;
  bool status;
  String message;
  List<Article> articles;

  ArticleModel({
    required this.code,
    required this.status,
    required this.message,
    required this.articles,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  String uuid;
  String title;
  String content;
  String image;
  int views;
  Created created;
  User user;

  Article({
    required this.uuid,
    required this.title,
    required this.content,
    required this.image,
    required this.views,
    required this.created,
    required this.user,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        uuid: json["uuid"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        views: json["views"],
        created: Created.fromJson(json["created"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "content": content,
        "image": image,
        "views": views,
        "created": created.toJson(),
        "user": user.toJson(),
      };
}

class Created {
  DateTime date;
  int timezoneType;
  Timezone timezone;

  Created({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: timezoneValues.map[json["timezone"]]!,
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum Timezone { UTC }

final timezoneValues = EnumValues({"UTC": Timezone.UTC});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
