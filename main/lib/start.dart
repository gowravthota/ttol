import 'package:flutter/material.dart';
import 'package:startup_namer/game_screen.dart';
import 'package:startup_namer/test_chess.dart';

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
              child: const Text('Chess Tester'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChessGame(),
                  ),
                );
              },
            ),
// ignore: todo
// TODO: Add options screen
            ElevatedButton(
              child: const Text('Quit'),
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
