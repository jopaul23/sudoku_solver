import 'package:flutter/material.dart';
import 'package:sudoku/constants/constants.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      color: CommonPageColors.bgColor,
    );
  }
}
