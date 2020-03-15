part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class CounterUp extends LoginEvent {
  final int counter;
  CounterUp({@required this.counter});
  @override
  List<Object> get props => [];
}

class CounterDown extends LoginEvent {
  final int counter;
  CounterDown({@required this.counter});
  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  final String userName;
  final String passWord;
  LoginButtonPressedEvent({@required this.userName, this.passWord});
  @override
  List<Object> get props => [];
}

class ShowPassEvent extends LoginEvent {
  final bool showPass;

  ShowPassEvent({@required this.showPass});

  @override
  List<Object> get props => [];
}
