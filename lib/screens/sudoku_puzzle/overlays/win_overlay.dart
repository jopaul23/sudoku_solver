import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/home_page/home_page_layout.dart';

class WinOverlay extends StatelessWidget {
  const WinOverlay({Key? key, required this.closeOverlay}) : super(key: key);
  final OverlayEntry closeOverlay;

  @override
  Widget build(BuildContext context) {
    SudokuController _sudokuContoller = Get.find<SudokuController>();
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: 0,
      child: Stack(alignment: Alignment.center, children: [
        GestureDetector(
          onTap: () {
            _sudokuContoller.isPaused = false;
            closeOverlay.remove();
          },
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(.3),
          ),
        ),
        Container(
          height: size.width / 1.3,
          width: size.width / 1.3,
          decoration: BoxDecoration(
            color: CommonPageColors.bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  child: Text(
                    "Congrats! you have solved",
                    style: TextStyle(
                      color: CommonPageColors.primaryBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // const SizedBox(height: ,)
                Material(
                  child: InkWell(
                    onTap: () {
                      closeOverlay.remove();
                      Get.delete<SudokuController>();
                      Get.to(HomePageLayout());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: CommonPageColors.primaryBlue,
                          borderRadius: BorderRadius.circular(
                            20,
                          )),
                      child: Text(
                        "new game",
                        style: TextStyle(
                            color: CommonPageColors.bgColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
