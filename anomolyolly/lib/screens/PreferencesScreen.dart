// repo list page
import 'package:flutter/material.dart';

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
              child: TextButton(
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
