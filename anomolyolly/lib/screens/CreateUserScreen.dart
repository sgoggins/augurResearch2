import 'package:flutter/material.dart';

import 'ReposListScreen.dart';

// create user page
class CreateUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          //color: Colors.pink,
          //padding: EdgeInsets.all(50),
          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
          child: TextField(
            // controller: _controller,
          ),
        ),
        Container(
          //color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
          child: TextField(
            // controller: _controller,
          ),
        ),
        Container(
          //color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
          child: TextField(
            // controller: _controller,
          ),
        ),
        Container(
          //color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
          child: TextField(
            // controller: _controller,
          ),
        ),
        Container(
          //color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
          child: TextField(
            // controller: _controller,
          ),
        ),
        Container(
          //color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
          child: TextField(
            // controller: _controller,
          ),
        ),
        TextButton(
          child: Text('Already have an account? Login!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text('Create Account!'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ReposListScreen();
              }),
            );
          },
        ),
      ]),
    );
  }
}