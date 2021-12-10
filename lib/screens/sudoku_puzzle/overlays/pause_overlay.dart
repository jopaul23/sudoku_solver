import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

class PauseOveerlay extends StatefulWidget {
  const PauseOveerlay({Key? key, required this.pauseOverlay}) : super(key: key);
  final OverlayEntry pauseOverlay;

  @override
  State<PauseOveerlay> createState() => _PauseOveerlayState();
}

class _PauseOveerlayState extends State<PauseOveerlay>
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
            widget.pauseOverlay.remove();
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
              child: GestureDetector(
                onTap: () {
                  _sudokuContoller.isPaused = false;
                  widget.pauseOverlay.remove();
                },
                child: Material(
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                        color: CommonPageColors.primaryBlue,
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    child: Text(
                      "Resume",
                      style: TextStyle(
                          color: CommonPageColors.bgColor, fontSize: 18.sp),
                    ),
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
