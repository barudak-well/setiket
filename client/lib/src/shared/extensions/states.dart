import 'package:flutter/material.dart';

extension XState on State {
  void safeRebuild(Function() fn) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fn();
    });
  }
}
