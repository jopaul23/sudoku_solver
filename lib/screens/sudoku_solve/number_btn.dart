import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/overlays/gameover_overlay.dart';
import 'package:sudoku/widgets/toast.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    Key? key,
    required this.i,
    required this.sudokuController,
  }) : super(key: key);
  final SudokuController sudokuController;
  final int i;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          int status = sudokuController.changeCellValue(i);
          print(
              "selected cell from numberBtn ${sudokuController.selectedCellRow},${sudokuController.selectedCellColumn}");
        },
        child: Container(
          height: 50,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: SudokuPageColors.numberContainerColor,
          ),
          alignment: Alignment.center,
          child: Text(
            i.toString(),
            style: TextStyle(
              color: CommonPageColors.primaryBlue,
              fontSize: 14.sp,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
