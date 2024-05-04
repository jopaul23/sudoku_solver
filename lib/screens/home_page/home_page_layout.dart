import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudoku/screens/home_page/bottom_card.dart';
import 'package:sudoku/screens/home_page/user_card.dart';

class HomePageLayout extends StatelessWidget {
  String user = "Player";
  final Widget svg = SvgPicture.asset(
    "assets/svg/homeBg.svg",
  );
  HomePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/homeBg.svg',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            BottomCard()
          ],
        ),
      ),
    );
  }
}
