import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HiveService {
  /// [TODO]
  /// all business logic in hive
  final userBox = Hive.box<String>(HiveKey.userBox);
  final bookmarkEventsBox = Hive.box<String>(HiveKey.bookmarkEventsBox);

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

  Future<void> saveBookmarkEvent(Event event) async {
    debugPrint(event.id.toString());
    final eventJson = event.toJson();
    return await bookmarkEventsBox.put(event.id, eventJson);
  }

  Future deleteBookmarkEvent(int eventId) async {
    debugPrint(eventId.toString());
    await bookmarkEventsBox.delete(eventId);
  }

  bool isEventBookmark(int eventId) {
    debugPrint(eventId.toString());
    return bookmarkEventsBox.containsKey(eventId);
  }

  Result<List<Event>> getAllBookmarkEvents() {
    try {
      return Result.success(
        (bookmarkEventsBox.values).map<Event>((item) {
          return Event.fromJson(item);
        }).toList(),
      );
    } catch (e, st) {
      debugPrint(e.toString());
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
