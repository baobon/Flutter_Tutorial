part of 'authentication_bloc.dart';

/*
We will need:

an AppStarted event to notify the bloc that it needs to check if the user is currently authenticated or not.
a LoggedIn event to notify the bloc that the user has successfully logged in.
a LoggedOut event to notify the bloc that the user has successfully logged out.
 */

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class LoggedInEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class LoggedOutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
