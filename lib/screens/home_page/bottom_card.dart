import 'package:flutter/material.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/home_page/newGame/new_game_card.dart';

import 'package:sudoku/screens/home_page/solver_button.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HomePageColors.cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
            )
          ]),
      child: Column(
        children: const [
          SizedBox(height: 30, width: 20),
          Solver(),
          SizedBox(height: 30, width: 20),
          NewGame(),
          SizedBox(height: 35, width: 20),
        ],
      ),
    );
  }
}
