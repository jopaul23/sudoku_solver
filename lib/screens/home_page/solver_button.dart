import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku/constants/constants.dart';

class Solver extends StatelessWidget {
  const Solver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          //Sudoku solver
        },
        child: Text(
          "Solver",
          style: TextStyle(color: CommonPageColors.bgColor, fontSize: 16.sp),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(CommonPageColors.primaryBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
      ),
    );
  }
}
