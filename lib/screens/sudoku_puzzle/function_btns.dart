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
    sudokuController.pencilSelected = isActive;
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
    sudokuController.eraserSelected = isActive;
    if (isActive) {
      sudokuController.pencilSelected = false;
    }
    sudokuController.update();
    print("eraser ${sudokuController.eraserSelected}");
  }
}

class OptionsContainer extends StatefulWidget {
  const OptionsContainer({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontapFunc,
    required this.type,
    required this.id,
  }) : super(key: key);
  final String icon;
  final int id;
  final String text;
  final Function(bool) ontapFunc;
  final int type;
  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  SudokuController sudokuController = Get.find<SudokuController>();
  @override
  Widget build(BuildContext context) {
    bool isActive = false;

    return GetBuilder<SudokuController>(builder: (context) {
      isActive = widget.id == 0 && sudokuController.pencilSelected ||
          widget.id == 1 && sudokuController.eraserSelected;

      return GestureDetector(
        onTap: () {
          setState(() {
            isActive = !isActive;
            widget.ontapFunc(isActive);
            print("isActive $isActive");
          });
        },
        child: Container(
          height: 65,
          width: 70,
          decoration: BoxDecoration(
              border: Border.all(
                  width: isActive && widget.type == 0 ? 3 : 2,
                  color: isActive && widget.type == 0
                      ? CommonPageColors.primaryBlue
                      : SudokuPageColors.optionsContainerColor),
              borderRadius: BorderRadius.circular(defaultPadding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                widget.icon,
                height: 26.sp,
                color: isActive && widget.type == 0
                    ? CommonPageColors.primaryBlue
                    : SudokuPageColors.optionsContainerColor,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 10.sp,
                    color: isActive && widget.type == 0
                        ? CommonPageColors.primaryBlue
                        : SudokuPageColors.optionsContainerColor),
              )
            ],
          ),
        ),
      );
    });
  }
}
