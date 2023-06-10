import 'package:flutter/material.dart';

void main() => runApp(XOGame());

class XOGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      home: GameBoard(),
    );
  }
}

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<List<String>> _grid;
  late String _currentPlayer;

  @override
  void initState() {
    super.initState();
    _grid = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    _currentPlayer = 'X';
  }

  void _handleTap(int row, int col) {
    setState(() {
      _grid[row][col] = _currentPlayer;
      _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
    });
  }

  Widget _buildGridTile(int row, int col) {
    return GestureDetector(
      onTap: () => _handleTap(row, col),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(_grid[row][col]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                _buildGridTile(0, 0),
                _buildGridTile(0, 1),
                _buildGridTile(0, 2),
                _buildGridTile(1, 0),
                _buildGridTile(1, 1),
                _buildGridTile(1, 2),
                _buildGridTile(2, 0),
                _buildGridTile(2, 1),
                _buildGridTile(2, 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
