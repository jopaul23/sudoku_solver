import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/home_page/home_page_layout.dart';
import 'package:sudoku/screens/sudoku_puzzle/puzzle_page_layout.dart';
import 'package:sudoku/widgets/toast.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonPageColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              "Please Enter Your Beautiful Name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: HomePageColors.profileNameColor,
                  fontSize: 18.sp),
            ),
            const SizedBox(height: defaultPadding * 3),
            TextField(
              controller: _textEditingController,
              maxLength: 15,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: SudokuPageColors.sudokuLineColor),
              decoration: InputDecoration(
                  counterStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: SudokuPageColors.sudokuLineColor,
                  ),
                  hintText: "Nickname",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: SudokuPageColors.sudokuLineColor,
                  ),
                  border: _border(),
                  focusedBorder: _border(),
                  enabledBorder: _border()),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _onContinue(context),
              child: Container(
                height: 60,
                width: 170,
                decoration: BoxDecoration(
                    color: CommonPageColors.primaryBlue,
                    borderRadius: BorderRadius.circular(40)),
                alignment: Alignment.center,
                child: const Text(
                  "continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: SudokuPageColors.sudokuLineColor,
      ));
  void _onContinue(BuildContext context) async {
    if (_textEditingController.text.isNotEmpty) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("name", _textEditingController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PuzzlePageLayout()));
    } else {
      late OverlayEntry toastOverlay;
      toastOverlay = OverlayEntry(
          builder: (context) => Toast(
              title: "Incomplete field",
              description: "enter name to continue",
              icon: "assets/svg/warning.svg",
              overlayEntry: toastOverlay));
      Overlay.of(context)?.insert(toastOverlay);
    }
  }
}
