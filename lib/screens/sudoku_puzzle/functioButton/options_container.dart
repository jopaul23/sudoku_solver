import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/widgets/toast.dart';

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
    overlayInsert() {
      late OverlayEntry toastOverlay;

      toastOverlay = OverlayEntry(
          builder: (context) => Toast(
              title: "invalid operation",
              description: "can't select ${widget.text}",
              icon: "assets/svg/warning.svg",
              overlayEntry: toastOverlay));
      Overlay.of(context)?.insert(toastOverlay);
    }

    return GetBuilder<SudokuController>(builder: (context) {
      isActive = widget.id == 0 && sudokuController.pencilSelected ||
          widget.id == 1 && sudokuController.eraserSelected;

      return GestureDetector(
        onTap: () {
          if (sudokuController.isFixed() && widget.type == 0) {
            overlayInsert();
          }
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
