import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku/constants/constants.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  Stopwatch stopwatch = Stopwatch();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch.start();
    setState(() {
      stopwatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    int timeCovered = 0;
    String time() {
      setState(() {
        timeCovered = (stopwatch.elapsedMilliseconds / 1000).floor();
      });
      return timeCovered.toString();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
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
                time(),
                style: TextStyle(
                    color: CommonPageColors.primaryBlue, fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
