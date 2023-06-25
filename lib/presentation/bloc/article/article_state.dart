import 'package:equatable/equatable.dart';

import 'package:article_app_elisoft/data/model/article_model.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';

class ArticleState extends Equatable {
  final List<Article> articles;
  final Article? article;
  final StateEnum detailState;
  final String detailMessage;
  final StateEnum articleState;
  final String articleMessage;
  const ArticleState({
    required this.article,
    required this.detailMessage,
    required this.detailState,
    required this.articles,
    required this.articleMessage,
    required this.articleState,
  });

  ArticleState copyWith({
    List<Article>? articles,
    Article? article,
    StateEnum? detailState,
    String? detailMessage,
    StateEnum? articleState,
    String? articleMessage,
  }) {
    return ArticleState(
      articles: articles ?? this.articles,
      article: article ?? this.article,
      detailState: detailState ?? this.detailState,
      detailMessage: detailMessage ?? this.detailMessage,
      articleState: articleState ?? this.articleState,
      articleMessage: articleMessage ?? this.articleMessage,
    );
  }

  factory ArticleState.initial() {
    return const ArticleState(
      articles: [],
      articleMessage: '',
      articleState: StateEnum.empty,
      article: null,
      detailMessage: '',
      detailState: StateEnum.empty,
    );
  }

  @override
  List<Object?> get props {
    return [
      articles,
      article,
      detailState,
      detailMessage,
      articleState,
      articleMessage,
    ];
  }
}
