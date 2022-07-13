import 'package:anomolyolly/screens/NotificationScreen.dart';
import 'package:anomolyolly/screens/ReposListScreen.dart';
import 'package:anomolyolly/screens/SignInUpScreen.dart';
import 'package:anomolyolly/screens/YourReposScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: (context, _) => AnomolyOllyApp(),
      ));
}

class AnomolyOllyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff4A7BA6),
        appBarTheme: AppBarTheme(
          color: const Color(0xff4A7BA6),
        ),
      ),
      routes: {
        '/': (context) => SignInUpScreen(),
        // '/createUser': (context) => CreateUserScreen(),
        // '/repoList': (context) => RepoListScreen(),
        // '/preferences': (context) => PreferencesScreen(),
        '/notification': (context) => NotificationScreen(),
        '/yourRepos': (context) => YourReposScreen(),
      },
    );
  }
}



