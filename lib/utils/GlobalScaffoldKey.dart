import 'package:flutter/material.dart';

class GlobalScaffoldKey {
  static final instance = GlobalScaffoldKey();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void showGlobalSnackbar(Widget widget) {
    this.scaffoldKey.currentState.showSnackBar(widget);
  }
}