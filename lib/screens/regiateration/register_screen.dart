import 'package:auth_app/bloc/register_bloc/registeration_bloc.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  final AuthenticationRepository _authRepository;

  RegisterScreen({Key key, @required AuthenticationRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
      authRepository: widget._authRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: BlocProvider<RegisterBloc>(
        create: (BuildContext context) => _registerBloc,
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}
