import 'package:flutter/material.dart';
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
          if (sudokuController.pencilSelected) {
            sudokuController.pencilWrite(i);
          } else if (sudokuController.eraserSelected) {
            sudokuController.eraserWrite(i);
          } else {
            int status = sudokuController.changeCellValue(i);
            late OverlayEntry toastOverlay;
            if (status == 0) {
              toastOverlay = OverlayEntry(
                builder: (context) => Toast(
                    title: "Invalid operation",
                    description: "can't update this cell",
                    icon: "assets/svg/warning.svg",
                    overlayEntry: toastOverlay),
              );
              Overlay.of(context).insert(toastOverlay);
            } else if (status == 1) {
              if (sudokuController.mistakes < 5) {
                toastOverlay = OverlayEntry(
                  builder: (context) => Toast(
                    title: "Wrong value",
                    description: "1 more mistake",
                    icon: "assets/svg/warning.svg",
                    overlayEntry: toastOverlay,
                    color: SudokuPageColors.red,
                  ),
                );
                Overlay.of(context).insert(toastOverlay);
              } else if (sudokuController.mistakes == 5) {
                late OverlayEntry gameoverOverlay;
                gameoverOverlay = OverlayEntry(
                    builder: (context) =>
                        GameOverPage(gameoverOverlay: gameoverOverlay));
                Overlay.of(context).insert(gameoverOverlay);
              }
            }
          }
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
              fontSize: 14,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
