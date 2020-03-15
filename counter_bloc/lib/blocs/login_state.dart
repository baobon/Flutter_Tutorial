part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class CounterState extends LoginState {
  final int counter;
  CounterState({@required this.counter});
  @override
  List<Object> get props => [];
}


class ButtonPressedState extends LoginState {
  final String message;
  final bool error;
  ButtonPressedState({@required this.message,this.error});
  @override
  List<Object> get props => [];
}

class ShowPassState extends LoginState {
  final bool showPass;
  ShowPassState({@required this.showPass});

  @override
  List<Object> get props => [];
}
