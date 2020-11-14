import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:auth_app/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'repositories/auth_repository.dart';
import 'repositories/auth_repository.dart';
import 'screens/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/login_screen.dart';

main() {
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthenticationRepository _authRepository = AuthenticationRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc =
        AuthenticationBloc(authenticationRepository: _authRepository);
    _authenticationBloc.dispatch(changedUser: AuthenticationUserChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.uninitiliazed:
                return LoginScreen(
                  authRepository: _authRepository,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                return LoginScreen(
                  authRepository: _authRepository,
                );
                break;
              case AuthenticationStatus.authenticated:
                return HomeScreen();
                break;
              default:
                break;
            }
            return Container();
          },
        ),
      ),
      create: (BuildContext context) => AuthenticationBloc(
        authenticationRepository: _authRepository,
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }
}
