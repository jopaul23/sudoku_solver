import 'package:flutter/material.dart';

class CommonFunctions {
  static defineBorderRadius(int i, int j) {
    if (i == 0 && j == 0) {
      return const BorderRadius.only(topLeft: Radius.circular(5));
    } else if (i == 2 && j == 2) {
      return const BorderRadius.only(bottomLeft: Radius.circular(5));
    } else if (i == 0 && j == 2) {
      return const BorderRadius.only(topRight: Radius.circular(5));
    } else if (i == 2 && j == 0) {
      return const BorderRadius.only(bottomRight: Radius.circular(5));
    } else {
      return BorderRadius.zero;
    }
  }
}
