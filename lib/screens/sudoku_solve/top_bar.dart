import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sudoku/constants/constants.dart';
import 'package:sudoku/screens/sudoku_puzzle/overlays/close_overlay.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                late OverlayEntry closeOverlay;
                closeOverlay = OverlayEntry(
                    builder: (context) =>
                        CloseOverlay(closeOverlay: closeOverlay));
                Overlay.of(context)?.insert(closeOverlay);
              },
              child: SvgPicture.asset(
                "assets/svg/exit.svg",
                height: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Enter the sudoku puzzle to be solved",
          style: TextStyle(color: CommonPageColors.primaryBlue, fontSize: 16),
        ),
        Text(
          "tap on each cells to enter the valus",
          style: TextStyle(color: CommonPageColors.primaryBlue, fontSize: 14),
        ),
      ],
    );
  }
}
