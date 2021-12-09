import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/table/sudoku_cell.dart';

class SudokuTable extends StatefulWidget {
  const SudokuTable({
    Key? key,
    // required this.sudokuController,
  }) : super(key: key);

  @override
  State<SudokuTable> createState() => _SudokuTableState();
}

class _SudokuTableState extends State<SudokuTable> {
  SudokuController sudokuController = Get.find<SudokuController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sudokuController.getSudoku(0);
  }

  @override
  Widget build(BuildContext context) {
    double topLeft = 0, bottomLeft = 0, topRight = 0, bottomRight = 0;

    return Container(
      width: MediaQuery.of(context).size.width - defaultPadding * 2,
      height: MediaQuery.of(context).size.width - defaultPadding * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: SudokuPageColors.sudokuLineColor),
      ),
      child: Column(
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              children: [
                for (int j = 0; j < 3; j++)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: .4),
                      borderRadius: sudokuController.defineBorderRadius(i, j),
                    ),
                    child: Column(
                      children: [
                        for (int k = 0; k < 3; k++)
                          Row(
                            children: [
                              for (int l = 0; l < 3; l++)
                                GetBuilder<SudokuController>(
                                    builder: (context) {
                                  return SudokuCell(
                                    rowNumber: i * 3 + k,
                                    columNumber: j * 3 + l,
                                  );
                                })
                            ],
                          )
                      ],
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
