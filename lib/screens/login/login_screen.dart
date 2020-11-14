import 'package:auth_app/bloc/login_bloc/login_bloc.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:auth_app/screens/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final AuthenticationRepository _authRepository;

  LoginScreen({Key key, @required AuthenticationRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  AuthenticationRepository get _authRepository => widget._authRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      authRepository: _authRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => _loginBloc,
        child: LoginForm(authenticationRepository: _authRepository),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
