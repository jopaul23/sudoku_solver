import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/function_btns.dart';
import 'package:sudoku/screens/sudoku_puzzle/number_btn.dart';
import 'package:sudoku/screens/sudoku_puzzle/top_bar.dart';
import 'package:sudoku/widgets/table/sudoku_table.dart';

class PuzzlePageLayout extends StatefulWidget {
  const PuzzlePageLayout({Key? key, required this.level}) : super(key: key);
  final int level;
  @override
  _PuzzlePageLayoutState createState() => _PuzzlePageLayoutState();
}

class _PuzzlePageLayoutState extends State<PuzzlePageLayout> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    SudokuController sudokuController = Get.put(SudokuController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          color: CommonPageColors.bgColor,
          child: Column(
            children: [
              const TopBar(),
              const SizedBox(
                height: 30,
              ),
              SudokuTable(
                level: widget.level,
              ),
              const SizedBox(
                height: 20,
              ),
              CellOptions(),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for (int i = 1; i <= 9; i++)
                  NumberButton(
                    i: i,
                    sudokuController: sudokuController,
                  ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
