import 'dart:developer';

import 'package:flutter/material.dart';

class CurrentPage extends ChangeNotifier {
  int currentPage = 0;

  int get getCurrentPage {
    log("$currentPage");
    return currentPage;
  }

  void setCurrentPage(int page) {
    log("$currentPage old");
    log("$page new");
    currentPage = page;
    notifyListeners();
  }
}
