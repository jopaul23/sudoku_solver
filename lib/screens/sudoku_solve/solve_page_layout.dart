import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_solve/function_btns.dart';
import 'package:sudoku/screens/sudoku_solve/number_btn.dart';
import 'package:sudoku/screens/sudoku_solve/top_bar.dart';
import 'package:sudoku/widgets/table/sudoku_table.dart';

class SolvePageLayout extends StatefulWidget {
  const SolvePageLayout({Key? key}) : super(key: key);

  @override
  _SolvePageLayoutState createState() => _SolvePageLayoutState();
}

class _SolvePageLayoutState extends State<SolvePageLayout> {
  SudokuController sudokuController = Get.put(SudokuController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CommonPageColors.bgColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBar(),
              const SizedBox(
                height: 10,
              ),
              const SudokuTable(),
              const SizedBox(
                height: 10,
              ),
              CellOptions(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for (int i = 1; i <= 9; i++)
                  NumberButton(
                    i: i,
                    sudokuController: sudokuController,
                  ),
              ]),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  sudokuController.solve();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: CommonPageColors.primaryBlue,
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  child: Text(
                    "solve",
                    style: TextStyle(
                        color: CommonPageColors.bgColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
