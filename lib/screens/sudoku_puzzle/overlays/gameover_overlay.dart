import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/home_page/home_page_layout.dart';

class GameOverPage extends StatefulWidget {
  const GameOverPage({Key? key, required this.gameoverOverlay})
      : super(key: key);
  final OverlayEntry gameoverOverlay;
  @override
  _GameOverPageState createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.black.withOpacity(.3),
        ),
        Container(
          height: size.width / 1.3,
          width: size.width / 1.3,
          decoration: BoxDecoration(
            color: CommonPageColors.bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Material(
              child: GestureDetector(
                onTap: () {
                  widget.gameoverOverlay.remove();
                  Get.delete<SudokuController>();
                  Get.to(HomePageLayout());
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
                    "new game",
                    style: TextStyle(
                        color: CommonPageColors.bgColor, fontSize: 18.sp),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
