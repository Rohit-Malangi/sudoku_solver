import 'package:flutter/material.dart';

import 'package:sudoku_solver/helper/solve_sudoku.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<int>> sudoku = List.generate(9, (_) => List<int>.filled(9, 0));
  Future<void> _showMyDialog(int row, int col) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Any Number From 1 to 9'),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('1'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 1;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('2'),
                      onPressed: () {
                        setState(() {
                          sudoku[row][col] = 2;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: const Text('3'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 3;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('4'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 4;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('5'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 5;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('6'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 6;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('7'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 7;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('8'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 8;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('9'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          sudoku[row][col] = 9;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cencel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sudoku Solver'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Table(
                children: List.generate(
                  9,
                  (row) => TableRow(
                    children: List.generate(
                      9,
                      (col) => Container(
                        height: 60,
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: (sudoku[row][col] == 0)
                            ? InkWell(
                                onTap: () => _showMyDialog(row, col),
                                child: const Text(''),
                              )
                            : InkWell(
                                onTap: () => _showMyDialog(row, col),
                                child: Center(
                                  child: Text('${sudoku[row][col]}'),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (SolveSudoKu().isValidSudoku(sudoku)) {
                      SolveSudoKu().solve(sudoku);
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Invalid User Input',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: const Text('Solve'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      List.generate(
                        9,
                        (index) => sudoku[index].fillRange(0, 9, 0),
                      );
                    });
                  },
                  child: const Text('Reset'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
