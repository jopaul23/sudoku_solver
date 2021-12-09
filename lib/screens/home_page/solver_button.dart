import 'package:flutter/material.dart';

class Solver extends StatelessWidget {
  const Solver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          //Sudoku solver
          
        },
        child: Text("Solver"),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            
          )
        )
            ),
      ),
    );
  }
}
