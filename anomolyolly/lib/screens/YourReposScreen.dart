// repo list page
import 'package:flutter/material.dart';


class YourReposScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: new Container(
          child: TextButton(
            child: Text('Go to notification page'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/notification',
              );
            },
          ),
        ));
  }
}

