import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Widget build(BuildContext context) {
    SudokuController sudokuController = Get.find<SudokuController>();
    int number =
        sudokuController.sudokuList[widget.rowNumber][widget.columNumber];
    double topLeft = 0, bottomLeft = 0, topRight = 0, bottomRight = 0;
    if (widget.rowNumber == 0 && widget.columNumber == 0) {
      topLeft = defaultPadding;
    }
    if (widget.rowNumber == 8 && widget.columNumber == 0) {
      bottomLeft = defaultPadding;
    }
    if (widget.rowNumber == 0 && widget.columNumber == 8) {
      topRight = defaultPadding;
    }
    if (widget.rowNumber == 8 && widget.columNumber == 8) {
      bottomRight = defaultPadding;
    }
    double borderWidth = 0.4;
    Color borderColor = SudokuPageColors.sudokuLineColor;
    return GestureDetector(
      onTap: () {
        Get.put(SudokuController())
            .updateSelectedCell(widget.rowNumber, widget.columNumber);
        print(
            "slected cell (${Get.put(sudokuController).selectedCellRow} , ${Get.put(sudokuController).selectedCellColumn})");
        setState(() {
          borderColor = CommonPageColors.primaryBlue;
          borderWidth = 1;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height:
            (MediaQuery.of(context).size.width - defaultPadding * 2 - 2) / 9,
        width: (MediaQuery.of(context).size.width - defaultPadding * 2 - 2) / 9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            ),
            border: Border.all(width: borderWidth)),
        child: Text(
          number == 0 ? "0" : number.toString(),
          style: TextStyle(
              color: borderColor,
              fontSize: 14.sp,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
