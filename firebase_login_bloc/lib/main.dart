import 'package:firebase_login_bloc/blocs/authenticationbloc/authentication_bloc.dart';
import 'package:firebase_login_bloc/repositories/user_repository.dart';
import 'package:firebase_login_bloc/screens/login/home_screen.dart';
import 'package:firebase_login_bloc/screens/login/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authenticationbloc/simple_bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AppStartedEvent()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  // const App({Key key, this._userRepository}) : super(key: key);

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is UninitializedState) {
          return SplashScreen();
        }
        if (state is UnauthenticatedSate) {
          return HomeScreen(name: state.displayName);
        }
        if (state is AuthenticatedState) {
          return HomeScreen(name: state.displayName);
        }
      },
    );
  }
}
