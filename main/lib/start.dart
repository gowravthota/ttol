import 'package:flutter/material.dart';
import 'package:startup_namer/game_screen.dart';

class StartMenuScreen extends StatelessWidget {
  const StartMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Start Menu'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: const Text('Start Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RunGame(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Options'),
              onPressed: () {
// ignore: todo
// TODO: Add options screen
              },
            ),
            ElevatedButton(
              child: Text('Quit'),
              onPressed: () {
// ignore: todo
// TODO: Add quit functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
