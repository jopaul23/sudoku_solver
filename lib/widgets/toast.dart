import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudoku/constants/constants.dart';

class Toast extends StatefulWidget {
  const Toast(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      required this.overlayEntry})
      : super(key: key);
  final String icon;
  final String title, description;
  final OverlayEntry overlayEntry;
  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      animationController
          .reverse()
          .whenComplete(() => widget.overlayEntry.remove());
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height - 50,
      child: FadeTransition(
        opacity: animation,
        child: Material(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: ToastColors.toastYellow,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.icon,
                  color: Colors.white,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.description,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
