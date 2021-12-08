import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

class PauseOveerlay extends StatelessWidget {
  const PauseOveerlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuController _sudokuContoller = Get.find<SudokuController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: CommonPageColors.bgColor,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            _sudokuContoller.isPaused = false;
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 150,
            decoration: BoxDecoration(
                color: CommonPageColors.primaryBlue,
                borderRadius: BorderRadius.circular(
                  20,
                )),
            child: Text(
              "Resume",
              style:
                  TextStyle(color: CommonPageColors.bgColor, fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}
