import 'package:anomolyolly/screens/NotificationScreen.dart';
import 'package:anomolyolly/screens/ReposListScreen.dart';
import 'package:anomolyolly/screens/SignInUpScreen.dart';
import 'package:anomolyolly/screens/YourReposScreen.dart';
import 'package:anomolyolly/state/ApplicationState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/NavigationRoutes.dart';

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
        NavigationRoutes.SIGN_IN_UP: (context) => SignInUpScreen(),
        // '/createUser': (context) => CreateUserScreen(),
        NavigationRoutes.REPOS_LIST: (context) => ReposListScreen(),
        // '/preferences': (context) => PreferencesScreen(),
        '/notification': (context) => NotificationScreen(),
        '/yourRepos': (context) => YourReposScreen(),
      },
    );
  }
}



