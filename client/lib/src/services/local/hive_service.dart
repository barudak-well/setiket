import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HiveService {
  /// [TODO]
  /// all business logic in hive
  final userBox = Hive.box<String>(HiveKey.userBox);

  String? getToken() {
    try {
      final hiveToken = userBox.get(HiveKey.token);
      if (hiveToken.isNullOrEmpty()) return null;

      return hiveToken;
    } catch (error, st) {
      log(error.toString(), error: error, stackTrace: st);
      return null;
    }
  }

  void saveToken(String token) {
    userBox.put(HiveKey.token, token);
  }

  void logout() {
    userBox.delete(HiveKey.token);
  }
}

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
