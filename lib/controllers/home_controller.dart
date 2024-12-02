import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;
  void changeLoadingValue(bool v) {
    isLoading = v;
    notifyListeners();
  }
}
