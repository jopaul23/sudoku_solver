import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/home_page/newGame/level_btn.dart';
import 'package:sudoku/screens/sudoku_puzzle/puzzle_page_layout.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CommonPageColors.primaryBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 10,
                )
              ]),
          child: Container(
            padding: EdgeInsets.only(left: 60, right: 60),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "New Game",
                  style: TextStyle(
                      color: HomePageColors.cardColor, fontSize: 16.sp),
                ),
                const SizedBox(
                  height: 30,
                ),
                LevelButton(
                  text: "easy",
                  onpressed: () {
                    print("easy leevl");
                    Get.to(const PuzzlePageLayout(level: 0));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                LevelButton(
                  text: "hard",
                  onpressed: () {
                    print("hard leevl");

                    Get.to(const PuzzlePageLayout(level: 1));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                LevelButton(
                  text: "evil",
                  onpressed: () {
                    print("evil leevl");
                    Get.to(const PuzzlePageLayout(level: 2));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
