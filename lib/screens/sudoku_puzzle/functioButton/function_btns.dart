import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/functioButton/options_container.dart';
import 'package:sudoku/widgets/toast.dart';

class CellOptions extends StatelessWidget {
  CellOptions({Key? key}) : super(key: key);

  @override
  SudokuController sudokuController = Get.find<SudokuController>();
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionsContainer(
            id: 0,
            type: 0,
            icon: "assets/svg/pencil.svg",
            text: "pencil",
            ontapFunc: _onPenciTap,
          ),
          OptionsContainer(
            id: 1,
            type: 0,
            icon: "assets/svg/eraser.svg",
            text: "eraser",
            ontapFunc: _onEraserTap,
          ),
          OptionsContainer(
            id: 2,
            type: 1,
            icon: "assets/svg/undo.svg",
            text: "undo",
            ontapFunc: _onUndoTap,
          ),
          OptionsContainer(
            id: 3,
            type: 1,
            icon: "assets/svg/redo.svg",
            text: "redo",
            ontapFunc: _onRedoTap,
          ),
        ],
      ),
    );
  }

  _onPenciTap(bool isActive) {
    print("pencil tapped");
    if (!sudokuController.isFixed()) sudokuController.pencilSelected = isActive;
    if (isActive) {
      sudokuController.eraserSelected = false;
    }
    sudokuController.update();

    print("pencilSelected ${sudokuController.pencilSelected}");
  }

  _onUndoTap(bool isActive) {
    print("undo tapped");
    sudokuController.undo();
  }

  _onRedoTap(bool isActive) {
    print("redo tapped");
    sudokuController.redo();
  }

  _onEraserTap(bool isActive) {
    print("eraser tapped");
    if (sudokuController.isFixed()) {
      return 0;
    } else {
      sudokuController.eraserSelected = isActive;
    }
    if (isActive) {
      sudokuController.pencilSelected = false;
    }
    sudokuController.update();
    print("eraser ${sudokuController.eraserSelected}");
  }
}
