import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/function_btns.dart';
import 'package:sudoku/screens/sudoku_puzzle/number_btn.dart';
import 'package:sudoku/screens/sudoku_puzzle/sudoku_table.dart';
import 'package:sudoku/screens/sudoku_puzzle/top_bar.dart';

class PuzzlePageLayout extends StatefulWidget {
  const PuzzlePageLayout({Key? key}) : super(key: key);

  @override
  _PuzzlePageLayoutState createState() => _PuzzlePageLayoutState();
}

class _PuzzlePageLayoutState extends State<PuzzlePageLayout> {
  @override
  Widget build(BuildContext context) {
    SudokuController sudokuController = Get.put(SudokuController());
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      color: CommonPageColors.bgColor,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg/exit.svg",
                height: 30.sp,
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/svg/pause.svg",
                height: 30.sp,
                color: SudokuPageColors.sudokuLineColor,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const TopBar(),
          const SizedBox(
            height: 30,
          ),
          const SudokuTable(),
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
    );
  }
}
