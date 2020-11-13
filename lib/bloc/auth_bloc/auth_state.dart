part of 'auth_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, uninitiliazed }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.uninitiliazed,
    this.user = User.empty,
  });

  const AuthenticationState.uninitiliazed() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
