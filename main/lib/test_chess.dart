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

  List<List<bool>> _highlight = List.generate(8, (_) => List.filled(8, false));

  List<List<int>> getPossibleMoves(int row, int col, List<List<String>> board) {
    List<List<int>> moves = []; // Initialize 'moves' with an empty list

    // White pawns can only move upwards
    if (board[row][col] == "P") {
      // Check if the space in front of the pawn is empty
      if (row > 0 && board[row - 1][col] == " ") {
        moves.add([row - 1, col]);
      }
      // Check if the pawn is on its starting row and the space in front of it is empty, in which case it can move two spaces
      if (row == 6 &&
          board[row - 1][col] == " " &&
          board[row - 2][col] == " ") {
        moves.add([row - 2, col]);
      }
      // Check if there is an enemy piece on the diagonals in front of the pawn
      if (col > 0 &&
          row > 0 &&
          board[row - 1][col - 1].toUpperCase() != board[row][col]) {
        moves.add([row - 1, col - 1]);
      }
      if (col < 7 &&
          row > 0 &&
          board[row - 1][col + 1].toUpperCase() != board[row][col]) {
        moves.add([row - 1, col + 1]);
      }
    } else if (board[row][col] == "p") {
      // Black pawns can only move downwards
      // Check if the space in front of the pawn is empty
      if (row < 7 && board[row + 1][col] == " ") {
        moves.add([row + 1, col]);
      }
      // Check if the pawn is on its starting row and the space in front of it is empty, in which case it can move two spaces
      if (row == 1 &&
          board[row + 1][col] == " " &&
          board[row + 2][col] == " ") {
        moves.add([row + 2, col]);
      }
      // Check if there is an enemy piece on the diagonals in front of the pawn
      if (col > 0 &&
          row < 7 &&
          board[row + 1][col - 1].toUpperCase() != board[row][col]) {
        moves.add([row + 1, col - 1]);
      }
      if (col < 7 &&
          row < 7 &&
          board[row + 1][col + 1].toUpperCase() != board[row][col]) {
        moves.add([row + 1, col + 1]);
      }
    }
    return moves;
  }
  // end getPossibleMoves

  List<List<int>> _onTap(int row, int col, List<List<String>> board) {
    String piece = board[row][col];
    List<List<int>> moves = []; // Initialize moves with an empty list

    if (piece == "P" || piece == "p") {
      moves = getPossibleMoves(row, col, board);
    }
    return moves;
  }

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
                      width: 25.0,
                      height: 25.0,
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
