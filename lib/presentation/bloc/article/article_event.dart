import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class OnGetArticles extends ArticleEvent {
  const OnGetArticles();

  @override
  List<Object> get props => [];
}

class OnGetArticleDetails extends ArticleEvent {
  final String uuid;
  const OnGetArticleDetails(this.uuid);

  @override
  List<Object> get props => [uuid];
}
