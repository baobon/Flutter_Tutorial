import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is CounterUp) {
      
      yield LoginInitial();
      yield CounterState(counter: event.counter + 1);
      
    } else if (event is CounterDown) {
      yield LoginInitial();
      yield CounterState(counter: event.counter - 1);
    } else if (event is LoginButtonPressedEvent) {
      if (event.userName.length > 6 && event.userName.contains('@') == true) {
        if (event.passWord.length > 6) {
          yield ButtonPressedState(message: "Login Sucess", error: false);
          print(event.userName + " pass " + event.passWord);
        } else {
         yield  ButtonPressedState(message: "Password wrong", error: true);
        }
      } else {
        yield ButtonPressedState(message: "Email wrong", error: true);
      }
    } else if (event is ShowPassEvent) {
      yield LoginInitial();
      yield ShowPassState(showPass: event.showPass);
    }
  }
}
