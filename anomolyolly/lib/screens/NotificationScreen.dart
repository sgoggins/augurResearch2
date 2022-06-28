// repo list page
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //child: Text("What do you want to see for this repo?"),
        child: TextButton(
          child: Text('go to your repo list'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/yourRepos',
            );
          },
        ),
      ),
    );
  }
}