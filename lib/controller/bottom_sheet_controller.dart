import 'package:flutter/material.dart';

class BottomSheetController with ChangeNotifier {
  BottomSheetController();

  double _height = 500;
  double get height => _height;

  void incrementHeight() => _incrementHeight();

  void decreaseHeight() => _decreaseHeight();

  // void incrementHeightSlowly() => _incrementHeightSlowly();

  // void decreaseHeightSlowly() => _decreaseHeightSlowly();

  void _incrementHeight() {
    _height += 500;
    print("Incrementing height$_height");
    notifyListeners();
  }

  void _decreaseHeight() {
    _height -= 500;
    notifyListeners();
  }

  // void _incrementHeightSlowly() {
  //   _height += 100;
  //   print("Incrementing height$_height");
  //   notifyListeners();
  // }

  // void _decreaseHeightSlowly() {
  //   _height -= 500;
  //   notifyListeners();
  // }
}
