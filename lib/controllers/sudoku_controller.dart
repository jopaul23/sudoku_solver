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

  updateSelectedCell(int rowNum, int columnNum) {
    selectedCellRow = rowNum;
    selectedCellColumn = columnNum;
    blockDefiner();
    update();
  }

  changeCellValue(int value) {
    sudokuList[selectedCellRow][selectedCellColumn] = value;
    update();
    // print(sudokuList);
  }

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
}
