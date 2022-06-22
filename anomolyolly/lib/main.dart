import 'package:anomolyolly/screens/YourReposScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnomolyOllyApp());
}

class AnomolyOllyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => YourReposScreen(),
        // '/createUser': (context) => CreateUserScreen(),
        // '/repoList': (context) => RepoListScreen(),
        // '/preferences': (context) => PreferencesScreen(),
        // '/notification': (context) => NotificationScreen(),
        // '/yourRepos': (context) => YourReposScreen(),
      },
    );
  }
}


