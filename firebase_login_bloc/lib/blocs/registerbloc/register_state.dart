part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get isFormValid => isEmailValid && isPasswordValid;
  const RegisterState({this.isEmailValid, this.isPasswordValid, this.isSubmitting,
      this.isSuccess, this.isFailure});
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterEmptyState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterFailState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSucessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterUpdateState extends RegisterState {
  final bool isEmailValid;
  final bool isPasswordValid;

  RegisterUpdateState({this.isEmailValid, this.isPasswordValid});
  @override
  List<Object> get props => null;
}
