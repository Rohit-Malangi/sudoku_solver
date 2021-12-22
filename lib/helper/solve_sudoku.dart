class SolveSudoKu {
  bool isValidSudoku(List<List<int>> sudoku) {
    for (int i = 0; i < 9; ++i) {
      List<int> check = List<int>.filled(9, 0);
      for (int j = 0; j < 9; ++j) {
        if (sudoku[i][j] != 0) {
          ++check[sudoku[i][j] - 1];
          if (check[sudoku[i][j] - 1] == 2) return false;
        }
      }
    }
    for (int i = 0; i < 9; ++i) {
      List<int> check = List<int>.filled(9, 0);
      for (int j = 0; j < 9; ++j) {
        if (sudoku[j][i] != 0) {
          ++check[sudoku[j][i] - 1];
          if (check[sudoku[j][i] - 1] == 2) return false;
        }
      }
    }
    for (int a = 0; a < 3; ++a) {
      for (int b = 0; b < 3; ++b) {
        List<int> check = List<int>.filled(9, 0);
        for (int i = a * 3; i < a * 3 + 3; ++i) {
          for (int j = b * 3; j < b * 3 + 3; ++j) {
            if (sudoku[i][j] != 0) {
              ++check[sudoku[i][j] - 1];
              if (check[sudoku[i][j] - 1] == 2) return false;
            }
          }
        }
      }
    }
    return true;
  }

  bool solve(List<List<int>> sudoku) {
    for (int i = 0; i < 9; ++i) {
      for (int j = 0; j < 9; ++j) {
        if (sudoku[i][j] == 0) {
          for (int k = 1; k <= 9; ++k) {
            if (isValid(sudoku, i, j, k)) {
              sudoku[i][j] = k;
              if (solve(sudoku) == true) {
                return true;
              } else {
                sudoku[i][j] = 0;
              }
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool isValid(List<List<int>> sudoku, int row, int col, int val) {
    for (int i = 0; i < 9; ++i) {
      if (sudoku[i][col] == val || sudoku[row][i] == val) {
        return false;
      }
      if (sudoku[(3 * (row / 3).floor() + (i / 3).floor()).floor()]
              [(3 * (col / 3).floor() + i % 3).floor()] ==
          val) {
        return false;
      }
    }
    return true;
  }
}
