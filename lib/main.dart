import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku/screens/sudoku_puzzle/puzzle_page_layout.dart';
import 'package:sudoku/screens/welcome_page/welcome_page_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: GoogleFonts.rubik(fontSize: 14.sp).fontFamily,
            ),
            home: WelcomePage()));
  }
}
