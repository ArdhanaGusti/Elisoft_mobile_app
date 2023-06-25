import 'package:article_app_elisoft/presentation/bloc/user/user_bloc.dart';
import 'package:article_app_elisoft/presentation/bloc/user/user_event.dart';
import 'package:article_app_elisoft/presentation/bloc/user/user_state.dart';
import 'package:article_app_elisoft/presentation/pages/home_page.dart';
import 'package:article_app_elisoft/presentation/widgets/body_alert.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isHide = true;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
        if (state.loginState == StateEnum.loading) {
          fToast.showToast(
            child: LoadingAnimationWidget.discreteCircle(
              size: 45,
              color: Colors.blue,
            ),
            gravity: ToastGravity.CENTER,
            toastDuration: Duration(days: 1),
          );
        } else if (state.loginState == StateEnum.loaded) {
          fToast.removeCustomToast();
          fToast.showToast(
            child: bodyAlert(Icons.check,
                "Login ${state.user!.name} Succesfull", Colors.greenAccent),
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: 2),
          );
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return Home(
                name: state.user!.name,
              );
            },
          ));
        } else if (state.loginState == StateEnum.error) {
          fToast.showToast(
            child: bodyAlert(
              Icons.error,
              "Login Failed",
              const Color(0xFFB22727),
            ),
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: 2),
          );
        }
      }, builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Image.asset("assets/login.jpeg", width: width),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Username",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 50),
                    child: TextField(
                      obscureText: isHide,
                      controller: passController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHide = !isHide;
                              });
                            },
                            icon: Icon(
                              Icons.visibility,
                              color: Color(0xFF006778),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Material(
                      color: const Color(0xFF006778),
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          if (emailController.text == '') {
                            fToast.showToast(
                              child: bodyAlert(
                                Icons.error,
                                "Username can't be empty",
                                const Color(0xFFB22727),
                              ),
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: Duration(seconds: 2),
                            );
                          } else if (passController.text == '') {
                            fToast.showToast(
                              child: bodyAlert(
                                Icons.error,
                                "Password can't be empty",
                                const Color(0xFFB22727),
                              ),
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: Duration(seconds: 2),
                            );
                          } else if (emailController.text != '' ||
                              passController.text != '') {
                            context.read<UserBloc>().add(OnLoginUser(
                                  emailController.text,
                                  passController.text,
                                ));
                          }
                        },
                        child: Container(
                          width: width,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            // color: Color(0xFF28448f),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
