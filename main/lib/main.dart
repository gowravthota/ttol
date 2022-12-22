import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    var myVar = 'lorem ipsum';
    int yayDartSupportsVarTypes = 3;

    return MaterialApp(
      title: 'Legion Mobile',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Legion Mobile'),
        ),
        body: Center(
          child: Text('Dart has beautiful string interpolation'
              '\n$myVar\n$yayDartSupportsVarTypes'),
        ),
      ),
    );
  }
}