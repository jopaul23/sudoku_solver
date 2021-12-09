import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/sudoku_puzzle/pause_page.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int _now = 0;
  Timer? everySecond;
  late SudokuController sudokuController;
  @override
  void initState() {
    sudokuController = Get.find<SudokuController>();

    super.initState();
    everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        _now += sudokuController.isPaused ? 0 : 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int pausedTime = _now;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/svg/exit.svg",
                  height: 30.sp,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    sudokuController.isPaused = !sudokuController.isPaused;
                    sudokuController.isPaused
                        ? pausedTime = _now
                        : _now = pausedTime;
                    Get.to(PauseOveerlay());
                  });
                },
                child: SvgPicture.asset(
                  "assets/svg/pause.svg",
                  height: 30.sp,
                  color: SudokuPageColors.sudokuLineColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "level",
                    style: TextStyle(
                        color: SudokuPageColors.sudokuLineColor,
                        fontSize: 14.sp),
                  ),
                  Text(
                    sudokuController.level,
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
                        color: SudokuPageColors.sudokuLineColor,
                        fontSize: 14.sp),
                  ),
                  Text(
                    "${sudokuController.mistakes}/5",
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
                        color: SudokuPageColors.sudokuLineColor,
                        fontSize: 14.sp),
                  ),
                  Text(
                    secondsToClock(_now),
                    style: TextStyle(
                        color: CommonPageColors.primaryBlue, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String secondsToClock(int seconds) {
    int sec = seconds % 60;
    int min = ((seconds / 60).floor()) % 60;
    int hr = (seconds / 3600).floor();
    // ss.toString().Format("{0:00}",1);
    String addLeadingZero(int number) {
      if (number < 10) {
        return "0$number";
      }
      return "$number";
    }

    return "${addLeadingZero(hr)}:${addLeadingZero(min)}:${addLeadingZero(sec)}";
  }
}
