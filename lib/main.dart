import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:auth_app/repositories/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App(authenticationRepository: AuthenticationRepository()));
}
