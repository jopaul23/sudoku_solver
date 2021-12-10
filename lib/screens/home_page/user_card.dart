import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku/constants/constants.dart';

class UserCard extends StatelessWidget {
  String user;
  int complete = 0;
  UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: HomePageColors.cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 40.sp,
              backgroundImage: const AssetImage("assets/jpeg/new.png"),
              backgroundColor: HomePageColors.profileNameColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "$complete Completed",
                  style: TextStyle(color: CommonPageColors.primaryBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
