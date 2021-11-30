import 'package:get/get.dart';

class SudokuController extends GetxController {
  int selectedCellRow = -1;
  int selectedCellColumn = -1;
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
    update();
  }

  changeCellValue(int value) {
    sudokuList[selectedCellRow][selectedCellColumn] = value;
    update();
    // print(sudokuList);
  }
}
