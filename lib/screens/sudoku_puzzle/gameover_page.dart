import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';

class GameOverPage extends StatefulWidget {
  const GameOverPage({Key? key}) : super(key: key);

  @override
  _GameOverPageState createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: CommonPageColors.bgColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Game over",
            style: TextStyle(
                color: SudokuPageColors.red,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: 70,
              width: 150,
              decoration: BoxDecoration(
                  color: CommonPageColors.primaryBlue,
                  borderRadius: BorderRadius.circular(
                    20,
                  )),
              child: Text(
                "retry",
                style:
                    TextStyle(color: CommonPageColors.bgColor, fontSize: 18.sp),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
