import 'package:flutter/material.dart';

class StartMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              // Navigate to main screen
              Navigator.pushNamed(context, '/main');
            },
            child: Text('Start'),
          ),
        ),
      ),
    );
  }

  FlatButton(
      {required MaterialColor color,
      required Color textColor,
      required Null Function() onPressed,
      required Text child}) {}
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Container(
        child: Center(
          child: Text('This is the main screen'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => StartMenuScreen(),
      '/main': (context) => MainScreen(),
    },
  ));
}
