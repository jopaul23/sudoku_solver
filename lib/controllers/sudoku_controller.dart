import 'package:tuple/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SudokuController extends GetxController {
  int selectedCellRow = -1;
  int selectedCellColumn = -1;
  int blockBaseX = -1, blockBaseY = -1, blockLimitX = -1, blockLimitY = -1;

  List<List<int>> sudokuList = [
    [0, 0, 1, 0, 0, 0, 5, 0, 0],
    [0, 2, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 4, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 6],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 7, 0, 0, 0, 0, 0, 0],
    [8, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  //  List<List<int>> sudokuSolutionList = [
  //   [8, 7, 1, 9, 4, 5, 5, 0, 0],
  //   [0, 2, 0, 0, 0, 0, 6, 0, 0],
  //   [0, 0, 0, 4, 0, 0, 0, 0, 0],
  //   [0, 0, 0, 0, 0, 0, 0, 0, 0],
  //   [0, 0, 0, 0, 0, 0, 0, 0, 0],
  //   [0, 0, 0, 0, 0, 0, 0, 0, 6],
  //   [0, 0, 0, 0, 0, 0, 0, 0, 0],
  //   [0, 0, 7, 0, 0, 0, 0, 0, 0],
  //   [8, 0, 0, 0, 0, 0, 0, 0, 0]
  // ];
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
    if (isFixed()) {
      return 0;
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
    update();
    return 1;
    // print(sudokuList);
  }

  undo() {
    if (top >= 0) {
      List<int> lastUpdated = changeStack[top];
      --top < 0 ? top = 0 : top = top;
      print("top $top");
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
    print("pencilList $pencilList");
    update();
  }

  bool eraserSelected = false;
  eraserWrite(int n) {
    pencilList[selectedCellRow][selectedCellColumn].remove(n);
    update();
  }

  // swapActiveButton() {
  //   if (pencilSelected) {
  //     pencilSelected = false;
  //     eraserSelected = true;
  //   } else if (eraserSelected) {
  //     eraserSelected = false;
  //     pencilSelected = true;
  //   }
  //   update();
  // }

  defineBorderRadius(int i, int j) {
    if (i == 0 && j == 0) {
      return const BorderRadius.only(topLeft: Radius.circular(5));
    } else if (i == 2 && j == 2) {
      return const BorderRadius.only(bottomLeft: Radius.circular(5));
    } else if (i == 0 && j == 2) {
      return const BorderRadius.only(topRight: Radius.circular(5));
    } else if (i == 2 && j == 0) {
      return const BorderRadius.only(bottomRight: Radius.circular(5));
    } else {
      return BorderRadius.zero;
    }
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

  SudokuController() {
    mapToFixedCells();
  }
}
