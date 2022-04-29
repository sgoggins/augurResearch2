// TO DO: create the routes by using the original class to set up routes
//    & then change how you're moving from page to page by using routes
//    then finish setting up the other pages (list, preference, notification, your list)

import 'package:flutter/material.dart';

void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/createUser': (context) => CreateUserScreen(),
        '/repoList': (context) => RepoListScreen(),
        '/preferences': (context) => PreferencesScreen(),
        '/notification': (context) => NotificationScreen(),
        '/yourRepos': (context) => YourReposScreen(),
      },
    );
  }
}

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
        FlatButton(
          child: Text('Create an Account'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/createUser',
            );
          },
        ),
        FlatButton(
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
        FlatButton(
          child: Text('Already have an account? Login!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Create Account!'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return RepoListScreen();
              }),
            );
          },
        ),
      ]),
    );
  }
}

// repo list page
class RepoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
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

// repo list page
class YourReposScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: new Container(
          child: FlatButton(
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

// repo list page
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //child: Text("What do you want to see for this repo?"),
        child: FlatButton(
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

bool isSwitched = false;
var textValue = 'Switch is OFF';

void toggleSwitch(bool value) {
  if (isSwitched == false) {
    setState(() {
      isSwitched = true;
      textValue = 'Switch Button is ON';
    });
    print('Switch Button is ON');
  } else {
    setState(() {
      isSwitched = false;
      textValue = 'Switch Button is OFF';
    });
    print('Switch Button is OFF');
  }
}

void setState(Null Function() param0) {}

// repo list page
class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: new Column(children: [
            new Container(
              child: new Text(
                'What do you want to see for this repo?',
                textAlign: TextAlign.center,
              ),
            ),
            new Container(
              child: new Row(children: [
                new Text('Issues'),
                Switch(value: isSwitched, onChanged: toggleSwitch),
              ]),
            ),
            new Container(
              child: new Row(children: [
                new Container(
                  child: new Row(children: [
                    Slider(
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.blue,
                      value: 10,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: 10.round().toString(),
                      onChanged: (double value) {
                        setState(() {});
                      },
                    ),
                  ]),
                )
              ]),
            ),
            new Container(
              child: new Row(children: [
                new Text('Pull Requests'),
                Switch(value: isSwitched, onChanged: toggleSwitch),
              ]),
            ),
            new Container(
              child: new Row(children: [
                new Container(
                  child: new Row(children: [
                    Slider(
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.blue,
                      value: 10,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: 10.round().toString(),
                      onChanged: (double value) {
                        setState(() {});
                      },
                    ),
                  ]),
                )
              ]),
            ),
            new Container(
              child: new Row(children: [
                new Text('Committs'),
                Switch(value: isSwitched, onChanged: toggleSwitch),
              ]),
            ),
            new Container(
              child: new Row(children: [
                Slider(
                  activeColor: Colors.blueGrey,
                  inactiveColor: Colors.blue,
                  value: 10,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: 10.round().toString(),
                  onChanged: (double value) {
                    setState(() {});
                  },
                ),
              ]),
            ),
            new Container(
              child: FlatButton(
                child: Text('go to your repo list'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/notification',
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
