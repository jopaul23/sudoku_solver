import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

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
            icon: "assets/svg/pencil.svg",
            text: "pencil",
            ontapFunc: _onPenciTap,
          ),
          OptionsContainer(
            icon: "assets/svg/eraser.svg",
            text: "eraser",
            ontapFunc: _onEraserTap,
          ),
          OptionsContainer(
            icon: "assets/svg/undo.svg",
            text: "undo",
            ontapFunc: _onUndoTap,
          ),
          OptionsContainer(
            icon: "assets/svg/redo.svg",
            text: "redo",
            ontapFunc: _onRedoTap,
          ),
        ],
      ),
    );
  }

  _onPenciTap() {
    print("pencil tapped");
    int c = 1 + 1;
  }

  _onUndoTap() {
    print("undo tapped");
    sudokuController.undo();
    int c = 1 + 1;
  }

  _onRedoTap() {
    print("redo tapped");
    sudokuController.redo();
    int c = 1 + 1;
  }

  _onEraserTap() {
    print("eraser tapped");
    int c = 1 + 1;
  }
}

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontapFunc,
  }) : super(key: key);
  final String icon;
  final String text;
  final VoidCallback ontapFunc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapFunc,
      child: Container(
        height: 65,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: SudokuPageColors.optionsContainerColor),
            borderRadius: BorderRadius.circular(defaultPadding)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              icon,
              height: 28.sp,
              color: SudokuPageColors.optionsContainerColor,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: SudokuPageColors.optionsContainerColor),
            )
          ],
        ),
      ),
    );
  }
}
