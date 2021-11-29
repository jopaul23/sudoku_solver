import 'package:flutter/material.dart';
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
        alignment: Alignment.center,
        child: Text(
          "hii",
        ));
  }
}
