part of 'authentication_bloc.dart';

/*
uninitialized - waiting to see if the user is authenticated or not on app start.
authenticated - successfully authenticated
unauthenticated - not authenticated
 */

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class UninitializedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  final String displayName;

  const AuthenticatedState(this.displayName);

  @override
  List<Object> get props => [displayName];
  
  @override
  String toString() => "Authenicated { displayName: $displayName }";
}

class UnauthenticatedSate extends AuthenticationState{
  @override
  List<Object> get props => [null];
}
