// repo list page
import 'package:flutter/material.dart';

class RepoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: Text('Go to preferences!'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/preferences',
            );
          },
        ),
      ),
    );
  }
}