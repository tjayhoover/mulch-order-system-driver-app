import 'package:equatable/equatable.dart';

import 'package:driver_app/models/user.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailureState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  final User loggedInUser;
  LoginSuccessState(this.loggedInUser);
  @override
  List<Object?> get props => [loggedInUser];
}
