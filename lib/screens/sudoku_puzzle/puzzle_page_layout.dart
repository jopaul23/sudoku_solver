import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sudoku/constants/constants.dart';

class PuzzlePageLayout extends StatefulWidget {
  const PuzzlePageLayout({Key? key}) : super(key: key);

  @override
  _PuzzlePageLayoutState createState() => _PuzzlePageLayoutState();
}

class _PuzzlePageLayoutState extends State<PuzzlePageLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: CommonPageColors.bgColor,
        child: SvgPicture.asset(
          "assets/svg/exit.svg",
          color: Colors.black,
          height: 100,
        ));
  }
}
