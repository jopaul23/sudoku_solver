import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

class SudokuCell extends StatefulWidget {
  const SudokuCell({
    Key? key,
    required this.rowNumber,
    required this.columNumber,
    //  required this.sudokuController,
  }) : super(key: key);
  final int rowNumber;
  final int columNumber;

  @override
  State<SudokuCell> createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  @override
  double topLeft = 0, bottomLeft = 0, topRight = 0, bottomRight = 0;
  SudokuController sudokuController = Get.find<SudokuController>();
  Color cellColor = Colors.transparent;

  Widget build(BuildContext context) {
    double cellHeight =
        (MediaQuery.of(context).size.width - defaultPadding * 2 - 4.4) / 9;
    double cellWidth =
        (MediaQuery.of(context).size.width - defaultPadding * 2 - 4.4) / 9;
    int number =
        sudokuController.sudokuList[widget.rowNumber][widget.columNumber];
    _defineBorderRadius();
    _opacityDefiner();
    double borderWidth = 0.4;
    Color borderColor = SudokuPageColors.sudokuLineColor;
    return GestureDetector(
      onTap: () {
        setState(() {
          Get.put(SudokuController())
              .updateSelectedCell(widget.rowNumber, widget.columNumber);
          print(
              "slected cell (${Get.put(sudokuController).selectedCellRow} , ${Get.put(sudokuController).selectedCellColumn})");
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: cellHeight,
          width: cellWidth,
          decoration: BoxDecoration(
              color: cellColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight),
              ),
              border: Border.all(
                width: widget.rowNumber == sudokuController.selectedCellRow &&
                        widget.columNumber ==
                            sudokuController.selectedCellColumn
                    ? 2
                    : borderWidth,
                color: widget.rowNumber == sudokuController.selectedCellRow &&
                        widget.columNumber ==
                            sudokuController.selectedCellColumn
                    ? sudokuController.isMistake
                        ? SudokuPageColors.red
                        : ToastColors.toastYellow.withOpacity(.8)
                    : SudokuPageColors.sudokuLineColor,
              )),
          child: sudokuController.sudokuList[widget.rowNumber]
                      [widget.columNumber] !=
                  0
              ? Text(
                  number.toString(),
                  style: TextStyle(
                      color: widget.rowNumber ==
                                  sudokuController.selectedCellRow &&
                              widget.columNumber ==
                                  sudokuController.selectedCellColumn
                          ? CommonPageColors.primaryBlue
                          : SudokuPageColors.sudokuLineColor,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0; j < 3; j++)
                            Container(
                              height: cellHeight / 3 - 3,
                              width: cellWidth / 3 - 3,
                              alignment: Alignment.center,
                              child: Text(
                                sudokuController.pencilList[widget.rowNumber]
                                            [widget.columNumber]
                                        .contains(i * 3 + j + 1)
                                    ? (i * 3 + j + 1).toString()
                                    : "",
                                style: TextStyle(
                                    fontSize: 8,
                                    decoration: TextDecoration.none,
                                    color: SudokuPageColors.sudokuLineColor),
                              ),
                            )
                        ],
                      )
                  ],
                )),
    );
  }

  _defineBorderRadius() {
    if (widget.rowNumber == 0 && widget.columNumber == 0) {
      topLeft = 5;
    }
    if (widget.rowNumber == 8 && widget.columNumber == 0) {
      bottomLeft = 5;
    }
    if (widget.rowNumber == 0 && widget.columNumber == 8) {
      topRight = 5;
    }
    if (widget.rowNumber == 8 && widget.columNumber == 8) {
      bottomRight = 5;
    }
  }

  _opacityDefiner() {
    int conditionCount = 0;
    if (widget.rowNumber == sudokuController.selectedCellRow ||
        widget.columNumber == sudokuController.selectedCellColumn) {
      conditionCount++;
    }

    if (sudokuController.blockBaseX <= widget.rowNumber &&
        sudokuController.blockLimitX >= widget.rowNumber &&
        sudokuController.blockBaseY <= widget.columNumber &&
        sudokuController.blockLimitY >= widget.columNumber) {
      conditionCount++;
    }
    if (sudokuController.selectedCellRow == widget.rowNumber &&
        sudokuController.selectedCellColumn == widget.columNumber) {
      conditionCount++;
    }
    if (conditionCount == 0) {
      cellColor = Colors.transparent;
    } else if (conditionCount == 1) {
      cellColor = CommonPageColors.primaryBlue.withOpacity(0.15);
    } else if (conditionCount == 2) {
      cellColor = CommonPageColors.primaryBlue.withOpacity(0.25);
    } else if (conditionCount == 3) {
      if (sudokuController.isMistake) {
        cellColor = SudokuPageColors.red.withOpacity(0.25);
      } else {
        cellColor = Colors.yellow.withOpacity(0.25);
      }
    }
  }
}
