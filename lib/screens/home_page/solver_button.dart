import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/sudoku_solve/solve_page_layout.dart';

class Solver extends StatelessWidget {
  const Solver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.maxFinite,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            Get.to(SolvePageLayout());
          },
          child: Text(
            "Solver",
            style: TextStyle(color: CommonPageColors.bgColor, fontSize: 16.sp),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  CommonPageColors.primaryBlue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
        ),
      ),
    );
  }
}
