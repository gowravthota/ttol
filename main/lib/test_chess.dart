import 'package:flutter/material.dart';

class ChessGame extends StatefulWidget {
  @override
  ChessGameState createState() => ChessGameState();
}

class ChessGameState extends State<ChessGame> {
  // Create a 2D list to represent the chess board
  List<List<String>> _board = [
    ["R", "N", "B", "Q", "K", "B", "N", "R"],
    ["P", "P", "P", "P", "P", "P", "P", "P"],
    ["y", "br", "y", "br", "y", "br", "y", "br"],
    ["br", "y", "br", "y", "br", "y", "br", "y"],
    ["y", "br", "y", "br", "y", "br", "y", "br"],
    ["br", "y", "br", "y", "br", "y", "br", "y"],
    ["P", "P", "P", "P", "P", "P", "P", "P"],
    ["R", "N", "B", "Q", "K", "B", "N", "R"],
  ];
// br is brown, y is yellow on an 8x8 board, everything else denotes a piece on the board N = Knight, R = Rook, B = Bishop, Q = Queen, K = King, P = Pawn
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 8,
              children: _board.expand((row) {
                return row.map((cell) {
                  if (cell == "P") {
                    return Image(
                      image: AssetImage("assets/pawn.png"),
                      width: 50.0,
                      height: 50.0,
                    );
                  } else if (cell == "R") {
                    return Image(
                      image: AssetImage("assets/rook.jpg"),
                      width: 50.0,
                      height: 50.0,
                    );
                  } else if (cell == "N") {
                    return Image(
                      image: AssetImage("assets/knight.png"),
                      width: 50.0,
                      height: 50.0,
                    );
                  } else if (cell == "B") {
                    return Image(
                      image: AssetImage("assets/bishop.jpg"),
                      width: 50.0,
                      height: 50.0,
                    );
                  } else if (cell == "Q") {
                    return Image(
                      image: AssetImage("assets/queen.jpg"),
                      width: 50.0,
                      height: 50.0,
                    );
                  } else if (cell == "K") {
                    return Image(
                      image: AssetImage("assets/king.jpg"),
                      width: 50.0,
                      height: 50.0,
                    );
                  }
                  return Container(
                    color: cell == "y" ? Colors.yellow : Colors.brown,
                  );
                }).toList();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
