import 'package:flutter/material.dart';
import 'package:sudoku/constants/constants.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          color: Colors.blue,
          child: Container(
            padding: EdgeInsets.only(left: 60, right: 60),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "New Game",
                  style: TextStyle(color: HomePageColors.cardColor),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Easy"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(HomePageColors.buttonWhite),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Medium"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(HomePageColors.buttonWhite),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Hard"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(HomePageColors.buttonWhite),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
