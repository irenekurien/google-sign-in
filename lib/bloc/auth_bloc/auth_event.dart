part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class AuthenticationLogIn extends AuthenticationEvent {
  const AuthenticationLogIn(this.user);

  final User user;

  @override
  List<Object> get props => [user];
  @override
  String toString() => 'LoggedIn';
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
