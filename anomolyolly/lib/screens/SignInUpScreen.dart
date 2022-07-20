
import 'package:anomolyolly/widgets/MyWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/ApplicationState.dart';
import 'authentication.dart';

class SignInUpScreen extends StatelessWidget {
  const SignInUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidgets.getAppBar("Sign In or Sign Up"),
      body: ListView(
        children: <Widget>[
          Consumer<ApplicationState>(
            builder: (context, appState, _) =>
                Authentication(
                  email: appState.email,
                  loginState: appState.loginState,
                  startLoginFlow: appState.startLoginFlow,
                  verifyEmail: appState.verifyEmail,
                  signInWithEmailAndPassword: appState
                      .signInWithEmailAndPassword,
                  cancelRegistration: appState.cancelRegistration,
                  registerAccount: appState.registerAccount),
          ),
        ],
      ),
    );
  }
}