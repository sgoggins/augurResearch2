import 'package:flutter/material.dart';

// login page
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          //color: Colors.pink,
          //padding: EdgeInsets.all(50),
          padding: EdgeInsets.fromLTRB(50, 200, 50, 50),
          child: TextField(
            // controller: _controller,
          ),
        ),
        Container(
          //color: Colors.yellow,
          padding: EdgeInsets.all(50),
          child: TextField(
            // controller: _controller,
          ),
        ),
        TextButton(
          child: Text('Create an Account'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/createUser',
            );
          },
        ),
        TextButton(
          child: Text('Login!'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/repoList',
            );
          },
        ),
      ]),
    );
  }
}