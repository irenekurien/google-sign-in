import 'dart:async';

import 'package:auth_app/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthenticationRepository _authRepository;

  LoginBloc({
    @required AuthenticationRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        super(null);

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _authRepository.logInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _authRepository.logInWithEmailAndPassword(
        password: password,
        email: email,
      );
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  void dispose() {}

  void dispatch(LoginWithCredentialsPressed loginWithCredentialsPressed) {}
}
