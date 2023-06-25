import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class OnLoginUser extends UserEvent {
  final String email, password;
  const OnLoginUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
