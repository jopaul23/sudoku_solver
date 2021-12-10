import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/screens/home_page/home_page_layout.dart';

class CloseOverlay extends StatefulWidget {
  const CloseOverlay({Key? key, required this.closeOverlay}) : super(key: key);
  final OverlayEntry closeOverlay;

  @override
  State<CloseOverlay> createState() => _CloseOverlayState();
}

class _CloseOverlayState extends State<CloseOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    setState(() {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

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
            widget.closeOverlay.remove();
          },
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(.3),
          ),
        ),
        ScaleTransition(
          scale: _animation,
          child: Container(
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
                      "are you sure to exit?",
                      style: TextStyle(
                        color: CommonPageColors.primaryBlue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // const SizedBox(height: ,)
                  Material(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            widget.closeOverlay.remove();
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
                              "yes",
                              style: TextStyle(
                                  color: CommonPageColors.bgColor,
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            widget.closeOverlay.remove();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: CommonPageColors.primaryBlue,
                                    width: 2),
                                borderRadius: BorderRadius.circular(
                                  20,
                                )),
                            child: Text(
                              "no",
                              style: TextStyle(
                                  color: CommonPageColors.primaryBlue,
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
