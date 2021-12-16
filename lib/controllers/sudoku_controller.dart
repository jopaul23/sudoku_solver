import 'package:sudoku/controllers/solution.dart';
import 'package:sudoku/dataBase/sudokus.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';

class SudokuController extends GetxController {
  bool isSolver = true;
  int selectedCellRow = -1;
  int selectedCellColumn = -1;
  int blockBaseX = -1, blockBaseY = -1, blockLimitX = -1, blockLimitY = -1;
  String level = "medium";
  int mistakes = 0;
  bool isPaused = false;
  bool isMistake = false;
  int toBeCorrected = 81;

  List<List<int>> sudokuList = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  List<List<int>> sudokuSolutionList = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [8, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  getSudoku(int levelId) {
    isSolver = false;
    late int index;
    if (levelId == 0) {
      index = Random().nextInt(easy.length);
      level = "easy";
    } else if (levelId == 1) {
      index = Random().nextInt(hard.length);
      level = "hard";
    } else if (levelId == 2) {
      index = Random().nextInt(evil.length);
      level = "hard";
    }
    String sudokuString = easy[index];
    toBeCorrected = sudokuString.split('.').length - 1;
    sudokuString = sudokuString.replaceAll('.', '0');
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        sudokuList[i][j] = int.parse(sudokuString[i * 9 + j]);
      }
    }
    mapToFixedCells();
    sudokuSolutionList = mainSection(sudokuList);
    print(
        "index $index \nSudokuString $sudokuString\nsolutionList $sudokuSolutionList");
  }

  bool checkCorrect(int n) {
    if (sudokuSolutionList[selectedCellRow][selectedCellColumn] == n) {
      return true;
    }
    mistakes += 1;
    isMistake = true;
    return false;
  }

  List<Tuple2<int, int>> fixedCells = [];
  mapToFixedCells() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (sudokuList[i][j] != 0) {
          fixedCells.add(Tuple2(i, j));
        }
      }
    }
  }

  List<List<List<int>>> pencilList = [
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], []],
  ];
  List<List<int>> changeStack = [];
  int top = -1;

  updateSelectedCell(int rowNum, int columnNum) {
    isMistake = false;
    selectedCellRow = rowNum;
    selectedCellColumn = columnNum;
    if (isFixed()) {
      eraserSelected = false;
      pencilSelected = false;
    }

    blockDefiner();
    update();
  }

  bool isFixed() {
    if (fixedCells.contains(Tuple2(selectedCellRow, selectedCellColumn))) {
      return true;
    } else {
      return false;
    }
  }

  changeCellValue(int value) {
    int status = 0; //0-fixed cell, 1-correct, 2-wrong
    if (isFixed()) {
      return status;
    }
    top++;
    changeStack.removeRange(top, changeStack.length);
    changeStack.add([
      selectedCellRow,
      selectedCellColumn,
      sudokuList[selectedCellRow][selectedCellColumn],
      value
    ]);

    sudokuList[selectedCellRow][selectedCellColumn] = value;
    if (isSolver) {
      status = 2;
    } else {
      if (checkCorrect(value)) {
        status = 2;
        toBeCorrected -= 1;
      } else {
        status = 1;
      }
      if (toBeCorrected == 0) {
        status = 3;
      }
    }

    update();

    return status;
  }

  undo() {
    if (top >= 0) {
      List<int> lastUpdated = changeStack[top];
      --top < 0 ? top = 0 : top = top;

      List<int> previousUpdate = changeStack[top];
      sudokuList[lastUpdated[0]][lastUpdated[1]] = lastUpdated[2];
      selectedCellRow = previousUpdate[0];
      selectedCellColumn = previousUpdate[1];
      updateSelectedCell(selectedCellRow, selectedCellColumn);
    }

    update();
  }

  redo() {
    if (top >= 0) {
      ++top >= changeStack.length ? top = changeStack.length - 1 : top = top;
      List<int> recentRedo = changeStack[top];
      sudokuList[recentRedo[0]][recentRedo[1]] = recentRedo[3];
      selectedCellRow = recentRedo[0];
      selectedCellColumn = recentRedo[1];
      updateSelectedCell(selectedCellRow, selectedCellColumn);
    }

    update();
  }

  bool pencilSelected = false;
  pencilWrite(int n) {
    List<int> pencilListOfCell =
        pencilList[selectedCellRow][selectedCellColumn];
    pencilListOfCell.addIf(!pencilListOfCell.contains(n), n);

    update();
  }

  bool eraserSelected = false;

  eraserWrite(int n) {
    if (isSolver) {
      sudokuList[selectedCellRow][selectedCellColumn] = 0;
      top++;
      changeStack.removeRange(top, changeStack.length);
      changeStack.add([
        selectedCellRow,
        selectedCellColumn,
        sudokuList[selectedCellRow][selectedCellColumn],
        0
      ]);
    } else {
      pencilList[selectedCellRow][selectedCellColumn].remove(n);
    }
    update();
  }

  blockDefiner() {
    if (selectedCellRow < 3) {
      blockBaseX = 0;
      blockLimitX = 2;
    } else if (selectedCellRow < 6) {
      blockBaseX = 3;
      blockLimitX = 5;
    } else if (selectedCellRow < 9) {
      blockBaseX = 6;
      blockLimitX = 8;
    }
    if (selectedCellColumn < 3) {
      blockBaseY = 0;
      blockLimitY = 2;
    } else if (selectedCellColumn < 6) {
      blockBaseY = 3;
      blockLimitY = 5;
    } else if (selectedCellColumn < 9) {
      blockBaseY = 6;
      blockLimitY = 8;
    }
  }

  solve() {
    sudokuList = mainSection(sudokuList);
    update();
  }
}
