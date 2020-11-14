import 'dart:async';

import 'package:auth_app/models/user.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.uninitiliazed()) {
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppStarted()),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User> _userSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is AuthenticationLogIn) {
      yield _mapAuthenticationLogInToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      _authenticationRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _authenticationRepository.isSignedIn();
      if (isSignedIn) {
        AuthenticationLogIn event;
        yield AuthenticationState.authenticated(event.user);
      } else {
        yield AuthenticationState.unauthenticated();
      }
    } catch (_) {
      yield AuthenticationState.unauthenticated();
    }
  }

  AuthenticationState _mapAuthenticationLogInToState(
    AuthenticationLogIn event,
  ) {
    return event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }

  void dispose() {}

  void dispatch({
    loggedOut,
    loggedIn,
  }) {}
}
