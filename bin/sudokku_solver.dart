class SudokkuCell {
  int value, row, col, startRow = -1, startCol = -1;
  SudokkuCell(this.value, this.row, this.col) {
    //calculating the starting pos of the sudokku square of the paticular cell
    if (row == 5 || row == 4) {
      startRow = 3;
    } else if (row == 7 || row == 8) {
      startRow = 6;
    } else if (row == 2 || row == 1) {
      startRow = 0;
    } else {
      startRow = row;
    }

    if (col == 5 || col == 4) {
      startCol = 3;
    } else if (col == 7 || col == 8) {
      startCol = 6;
    } else if (col == 2 || col == 1) {
      startCol = 0;
    } else {
      startCol = col;
    }
  }
}

class SudokkuSolver {
  ///holds the sudokku puzzle
  late List<List<SudokkuCell>> board;

  ///checks whether we need to find the next empty slot or continue with existing slot
  bool _findNextSlot = true;

  ///Holds the cells that the values has been added
  ///Used for backtracking
  late List<SudokkuCell> completedCells;
  SudokkuSolver._();

  ///Convert 2D list into SudokkuSolver object
  factory SudokkuSolver.fromList(List<List<int>> rawBoard) {
    SudokkuSolver solver = SudokkuSolver._();
    solver.board = [];
    solver.completedCells = [];
    for (int i = 0; i < rawBoard.length; i++) {
      final List<SudokkuCell> cells = [];
      for (int j = 0; j < rawBoard[i].length; j++) {
        cells.add(SudokkuCell(rawBoard[i][j], i, j));
      }
      solver.board.add(cells);
    }
    return solver;
  }

  ///search in the square of the specified cell
  ///if found then true will be returned
  bool searchSquare(SudokkuCell cell) {
    bool found = false;
    for (int i = cell.startRow; i < cell.startRow + 3; i++) {
      for (int j = cell.startCol; j < cell.startCol + 3; j++) {
        if (board[i][j].value == cell.value && cell.col != j && cell.row != i) {
          found = true;
          break;
        }
      }
    }
    return found;
  }

  ///find the first empty slot in the cell
  ///Empty slot is obtained by checking the cell having value 0.
  SudokkuCell? findFirstEmptySlot() {
    SudokkuCell? cell;
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j].value == 0) {
          cell = board[i][j];
          break;
        }
      }
      if (cell != null) break;
    }
    return cell;
  }

  ///Here the backtracking logic is used.
  SudokkuCell? _check(SudokkuCell cell, bool isFound) {
    if (isFound) {
      if (cell.value >= 9) {
        // check for othrt numbers ranging from 1-9
        cell.value = 0;
        if (completedCells.isNotEmpty) {
          //if the [completedCells] is empty then there is no solution.
          cell = completedCells.removeLast();
        } else {
          print("NULL");
          return null;
        }
      }
      _findNextSlot = false;
    }
    return cell;
  }

  ///solves the given puzzle.
  void solve() {
    SudokkuCell? currentCell;
    while (true) {
      bool found = false;
      if (_findNextSlot) {
        SudokkuCell? tempCell = findFirstEmptySlot();
        if (tempCell == null) {
          break;
        } else {
          currentCell = tempCell;
        }
      }

      currentCell?.value = currentCell.value + 1;

      //check row wise
      for (int i = 0; i < 9; i++) {
        if (board[i][currentCell!.col].value == currentCell.value &&
            currentCell.row != i) {
          found = true;
          break;
        }
      }

      //validation
      currentCell = _check(currentCell!, found);
      if (currentCell == null) {
        break;
      } else if (found) {
        continue;
      }
      //reseting
      found = false;

      //check column wise

      for (int j = 0; j < 9; j++) {
        if (board[currentCell.row][j].value == currentCell.value &&
            currentCell.col != j) {
          found = true;
          break;
        }
      }

      //validation
      currentCell = _check(currentCell, found);
      if (currentCell == null) {
        break;
      } else if (found) {
        continue;
      }

      ///search in the square cells
      found = searchSquare(currentCell);

      //validation
      currentCell = _check(currentCell, found);
      if (currentCell == null) {
        break;
      } else if (found) {
        continue;
      }
      completedCells.add(currentCell);
      _findNextSlot = true;
    }
  }

  ///convert the object into 2D list.
  List<List<int>> toList() {
    final List<List<int>> rawBoard = [];
    for (int i = 0; i < board.length; i++) {
      final List<int> cells = [];
      for (int j = 0; j < board[i].length; j++) {
        cells.add(board[i][j].value);
      }
      rawBoard.add(cells);
    }
    return rawBoard;
  }
}

void main() {
  List<List<int>> board = [
    [0, 0, 8, 0, 0, 0, 0, 4, 0],
    [9, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 3, 9, 0, 2, 0],
    [0, 0, 0, 5, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 5, 0, 7],
    [4, 0, 0, 7, 0, 0, 0, 0, 8],
    [0, 1, 0, 0, 6, 0, 0, 0, 0],
    [0, 4, 0, 2, 1, 0, 0, 0, 0],
    [8, 7, 5, 3, 0, 0, 0, 0, 0]
  ];

  SudokkuSolver solver = SudokkuSolver.fromList(board);
  print("Sudokku Object created");
  print("Solving the puzzle");
  solver.solve();
  print(solver.toList());
}
