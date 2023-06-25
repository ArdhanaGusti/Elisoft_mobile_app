import 'package:article_app_elisoft/domain/usecase/login_user.dart';
import 'package:article_app_elisoft/presentation/bloc/user/user_event.dart';
import 'package:article_app_elisoft/presentation/bloc/user/user_state.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginUser loginUser;

  UserBloc(
    this.loginUser,
  ) : super(UserState.initial()) {
    on<OnLoginUser>(
      (event, emit) async {
        emit(state.copyWith(
          loginState: StateEnum.loading,
        ));
        final result = await loginUser.execute(event.email, event.password);
        result.fold((failure) {
          emit(state.copyWith(
            loginState: StateEnum.error,
            loginMessage: failure.message,
          ));
        }, (user) {
          emit(state.copyWith(
            loginState: StateEnum.loaded,
            user: user,
          ));
        });
        emit(state.copyWith(
          loginState: StateEnum.finish,
        ));
      },
    );
  }
}
