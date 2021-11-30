import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/sudoku_cell.dart';

class SudokuTable extends StatelessWidget {
  const SudokuTable({
    Key? key,
    // required this.sudokuController,
  }) : super(key: key);
  // final SudokuController sudokuController;
  @override
  Widget build(BuildContext context) {
    SudokuController sudokuController = Get.find<SudokuController>();
    return Container(
      width: MediaQuery.of(context).size.width - defaultPadding * 2,
      height: MediaQuery.of(context).size.width - defaultPadding * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding),
        border: Border.all(width: 1, color: SudokuPageColors.sudokuLineColor),
      ),
      child: Column(
        children: [
          for (int i = 0; i < 9; i++)
            Row(
              children: [
                for (int j = 0; j < 9; j++)
                  GetBuilder<SudokuController>(builder: (context) {
                    return SudokuCell(
                      // sudokuController: sudokuController,
                      rowNumber: i,
                      columNumber: j,
                    );
                  })
              ],
            )
        ],
      ),
    );
  }
}
