import 'package:article_app_elisoft/presentation/bloc/article/article_bloc.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_event.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_state.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ArticleDetail extends StatefulWidget {
  final String uuid;
  const ArticleDetail({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  void initState() {
    context.read<ArticleBloc>().add(OnGetArticleDetails(widget.uuid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.detailState == StateEnum.empty) {
            return Center(
              child: Text("Kosong"),
            );
          } else if (state.detailState == StateEnum.error) {
            return Center(
              child: Text(state.detailMessage),
            );
          } else if (state.detailState == StateEnum.loading) {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                size: 45,
                color: Colors.blue,
              ),
            );
          }
          if (state.article == null) {
            return const Center(
              child: Text("Article not found"),
            );
          }
          var article = state.article!;
          return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: article.image,
                      placeholder: (context, url) => Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          size: 45,
                          color: Colors.blue,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: width * 5 / 8,
                      width: width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          article.title,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            wordSpacing: 5.0,
                          ),
                        ),
                        Text(
                          "Oleh: ${state.article!.user.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.blue[800],
                          ),
                        ),
                        Text(
                          article.content,
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
