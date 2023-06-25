import 'package:equatable/equatable.dart';

import 'package:article_app_elisoft/data/model/user_model.dart';
import 'package:article_app_elisoft/utils/state_enum.dart';

class UserState extends Equatable {
  final User? user;
  final StateEnum loginState;
  final String loginMessage;
  const UserState({
    required this.user,
    required this.loginMessage,
    required this.loginState,
  });

  UserState copyWith({
    User? user,
    StateEnum? loginState,
    String? loginMessage,
  }) {
    return UserState(
      user: user ?? this.user,
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,
    );
  }

  factory UserState.initial() {
    return const UserState(
      user: null,
      loginMessage: '',
      loginState: StateEnum.empty,
    );
  }

  @override
  List<Object?> get props => [user, loginState, loginMessage];
}
