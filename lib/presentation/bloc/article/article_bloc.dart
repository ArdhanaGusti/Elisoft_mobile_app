import 'package:article_app_elisoft/domain/usecase/get_article_detail.dart';
import 'package:article_app_elisoft/domain/usecase/get_articles.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_event.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_state.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticles getArticles;
  final GetArticleDetails getArticleDetails;

  ArticleBloc(
    this.getArticles,
    this.getArticleDetails,
  ) : super(ArticleState.initial()) {
    on<OnGetArticles>(
      (event, emit) async {
        emit(state.copyWith(
          articleState: StateEnum.loading,
        ));
        final result = await getArticles.execute();
        result.fold((failure) {
          emit(state.copyWith(
            articleState: StateEnum.error,
            articleMessage: failure.message,
          ));
        }, (articles) {
          emit(state.copyWith(
            articleState: StateEnum.loaded,
            articles: articles,
            articleMessage: '',
          ));
        });
      },
    );
    on<OnGetArticleDetails>(
      (event, emit) async {
        emit(state.copyWith(
          detailState: StateEnum.loading,
        ));
        final result = await getArticleDetails.execute(event.uuid);
        result.fold((failure) {
          emit(state.copyWith(
            detailState: StateEnum.error,
            detailMessage: failure.message,
          ));
        }, (article) {
          emit(state.copyWith(
            detailState: StateEnum.loaded,
            article: article,
            detailMessage: '',
          ));
        });
      },
    );
  }
}
