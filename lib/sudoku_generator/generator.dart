import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

enum Level { easy, medium, hard }

class SudokuGenerator {
  final url = "https://sugoku.herokuapp.com/board?difficulty=";
  final bool useCache;
  String error = "";
  late Box<List<List<int>>> _cacheBox;
  SudokuGenerator._({this.useCache = true});

  static Future<SudokuGenerator> init({useCache = true}) async {
    final sudokku = SudokuGenerator._(useCache: useCache);
    sudokku._cacheBox = await Hive.openBox('sudoku_cache');
    return sudokku;
  }

  Future<List<List<int>>> generate(Level type) async {
    late String level;
    List<List<int>>? board;
    if (type == Level.easy) {
      level = "easy";
    } else if (type == Level.medium) {
      level = "medium";
    } else {
      level = "hard";
    }
    try {
      final response = await _request(url + level);
      if (response != null && response.statusCode == 200) {
        debugPrint(jsonDecode(response.body)["board"]);
        board = jsonDecode(response.body)["board"];
      } else {
        error = "status code is ${response?.statusCode}";
      }
    } catch (e) {
      debugPrint("$e");
      error = e.toString();
    }

    if (board == null) {
      if (useCache) {
        board = await _lookInCache();
      } else {
        board = [[]];
      }
    } else {
      _saveBoard(board);
    }
    return board;
  }

  Future<http.Response?> _request(String url) async {
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<List<List<int>>> _lookInCache() async {
    List<List<int>>? board;
    if (_cacheBox.length > 5) {
      int random = Random().nextInt(_cacheBox.length);
      board = _cacheBox.getAt(random);
    }
    board ??= [];
    return board;
  }

  void _saveBoard(List<List<int>> board) {
    _cacheBox.add(board);
  }
}
