import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku/constants/constants.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.maxFinite,
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          text,
          style:
              TextStyle(color: CommonPageColors.primaryBlue, fontSize: 14.sp),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(HomePageColors.buttonWhite),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
