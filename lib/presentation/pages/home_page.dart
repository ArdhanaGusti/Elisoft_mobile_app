import 'package:article_app_elisoft/presentation/bloc/article/article_bloc.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_event.dart';
import 'package:article_app_elisoft/presentation/bloc/article/article_state.dart';
import 'package:article_app_elisoft/presentation/pages/article_detail_page.dart';
import 'package:article_app_elisoft/presentation/pages/loading_page.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';
import 'package:article_app_elisoft/utils/theme_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  final String name;
  const Home({
    super.key,
    required this.name,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<ArticleBloc>().add(const OnGetArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      if (state.articleState == StateEnum.loading) {
        return const Loading();
      } else if (state.articleState == StateEnum.error) {
        return Scaffold(
          body: Center(
            child: Text(state.articleMessage),
          ),
        );
      } else if (state.articleState == StateEnum.loaded) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome, ",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    margin: EdgeInsets.only(top: 20),
                    height: 200,
                    // color: Colors.red,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var article = state.articles[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArticleDetail(uuid: article.uuid);
                              },
                            ));
                          },
                          child: Container(
                            height: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 20),
                            width: 0.583 * width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF247881),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: bHeading1,
                                ),
                                Text(
                                  article.content,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: bSubHeading1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: state.articles.length,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var article = state.articles[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArticleDetail(uuid: article.uuid);
                              },
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF247881).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.only(
                              bottom: 20,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: article.image,
                                          width: 80,
                                          placeholder: (context, url) =>
                                              Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            width: 80,
                                            height: 80,
                                            child: Center(
                                              child: LoadingAnimationWidget
                                                  .discreteCircle(
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        article.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: bSubHeading1,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    article.content,
                                    style: bSubHeading1,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('dd MMMM yyyy, HH:mm:ss')
                                          .format(article.created.date),
                                      style: bSubHeading1,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
