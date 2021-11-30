import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku/constants/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "level",
              style: TextStyle(
                  color: SudokuPageColors.sudokuLineColor, fontSize: 14.sp),
            ),
            Text(
              "hard",
              style: TextStyle(
                  color: CommonPageColors.primaryBlue, fontSize: 14.sp),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "mistakes",
              style: TextStyle(
                  color: SudokuPageColors.sudokuLineColor, fontSize: 14.sp),
            ),
            Text(
              "2/5",
              style: TextStyle(
                  color: CommonPageColors.primaryBlue, fontSize: 14.sp),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "time",
              style: TextStyle(
                  color: SudokuPageColors.sudokuLineColor, fontSize: 14.sp),
            ),
            Text(
              "2:00",
              style: TextStyle(
                  color: CommonPageColors.primaryBlue, fontSize: 14.sp),
            ),
          ],
        )
      ],
    );
  }
}
