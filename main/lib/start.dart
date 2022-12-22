import 'package:flutter/material.dart';
import 'package:startup_namer/game_screen.dart';

class StartMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Start Menu'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text('Start Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(questions: questions),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('Options'),
              onPressed: () {
// TODO: Add options screen
              },
            ),
            ElevatedButton(
              child: Text('Quit'),
              onPressed: () {
// TODO: Add quit functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
