
import 'package:anomolyolly/screens/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/ApplicationState.dart';

class Header extends StatelessWidget {
  const Header(this.heading, {super.key});
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      heading,
      style: const TextStyle(fontSize: 24),
    ),
  );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {super.key});
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Text(
      content,
      style: const TextStyle(fontSize: 18),
    ),
  );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail, {super.key});
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          detail,
          style: const TextStyle(fontSize: 18),
        )
      ],
    ),
  );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.deepPurple)),
    onPressed: onPressed,
    child: child,
  );
}

class MyWidgets {
  static AppBar getAppBar(String title)  {
    return AppBar(
        title: Text(title),
        actions: <Widget>[
          Consumer<ApplicationState>(builder: (context, appState, child) {
            if(appState.loginState == ApplicationLoginState.loggedIn) {
              return IconButton(
                  icon: Icon(
                      Icons.logout),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  }
              );
            }  else {
              return Container();
            }
          })
        ]
    );
  }
}
