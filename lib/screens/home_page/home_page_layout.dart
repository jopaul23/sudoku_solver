import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/home_page/bottom_card.dart';
import 'package:sudoku/screens/home_page/user_card.dart';

class HomePageLayout extends StatelessWidget {
  String user = "Player";
  final Widget svg = new SvgPicture.asset(
    "assets/svg/homeBg.svg",
  );
  HomePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              'assets/svg/homeBg.svg',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 7),
              child: Column(
                children: [
                  UserCard(user: 'Player'),
                  BottomCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
