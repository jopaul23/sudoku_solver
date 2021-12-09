import 'package:flutter/material.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/home_page/new_game_button.dart';
import 'package:sudoku/screens/home_page/solver_button.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 75, top: 25),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          color: HomePageColors.cardColor,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(height: 30, width: 20),
                Solver(),
                SizedBox(height: 30, width: 20),
                NewGame(),
                SizedBox(height: 35, width: 20),
              ],
            ),
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     CircleAvatar(
          //       backgroundImage: AssetImage(
          //           'assets/images/62358452-avatar-man-smiling-cartoon-male-person-user-vector-illustration.jpg'),
          //     ),
          //     Text(user,
          //         style: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.bold,
          //         ))
          //   ],
          // ),
        ),
      ),
    );
  }
}
