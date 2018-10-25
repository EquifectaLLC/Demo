import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  var _vendorColor = Color(0xFF115740);
  get vendorColor => _vendorColor;

  int _selectedScreenIndex = 0;
  int get selectedScreenIndex => _selectedScreenIndex;

  void selectScreen(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }
}
