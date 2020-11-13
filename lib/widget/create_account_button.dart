import 'package:auth_app/repositories/auth_repository.dart';
import 'package:auth_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final AuthenticationRepository _authRepository;

  CreateAccountButton({
    Key key,
    @required AuthenticationRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegistrationScreen(authRepository: _authRepository);
          }),
        );
      },
    );
  }
}
