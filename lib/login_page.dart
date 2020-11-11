import 'package:auth_app/my_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  signInWithGoogle().then(
                    (user) {
                      if (user != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return MyPage(
                                user: this.user,
                              );
                            },
                          ),
                        );
                      }
                    },
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
                splashColor: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/google_g.png'),
                        height: 35,
                        alignment: Alignment.centerRight,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 23),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
