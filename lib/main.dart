import 'package:article_app_elisoft/presentation/bloc/article/article_bloc.dart';
import 'package:article_app_elisoft/presentation/bloc/user/user_bloc.dart';
import 'package:article_app_elisoft/presentation/pages/login_page.dart';
import 'package:article_app_elisoft/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:article_app_elisoft/injection.dart' as di;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleBloc>(),
        ),
      ],
      child: MaterialApp(
        title: "My App",
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        navigatorKey: navigatorKey,
        home: const Login(),
      ),
    );
  }
}
