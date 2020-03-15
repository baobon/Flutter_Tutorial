part of 'login_bloc.dart';

/*
emty
loading
failure
success
update
 */

abstract class LoginState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get isFormValid => isEmailValid && isPasswordValid;
  const LoginState({this.isEmailValid, this.isPasswordValid, this.isSubmitting,
      this.isSuccess, this.isFailure});
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginEmptyState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSucessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginUpdateState extends LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;

  LoginUpdateState({this.isEmailValid, this.isPasswordValid});
  @override
  List<Object> get props => null;
}
