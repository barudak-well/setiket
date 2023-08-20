import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/domain.dart';

class JailbreakRepository {
  Future<JailbreakStatus> checkJailbreakStatus() async {
    bool jailbrokenOrRooted = true;
    try {
      if (Platform.isAndroid) {
        jailbrokenOrRooted = await FlutterJailbreakDetection.developerMode;
      } else if (Platform.isIOS) {
        jailbrokenOrRooted = await FlutterJailbreakDetection.jailbroken;
      } else {
        jailbrokenOrRooted = true;
      }
    } on PlatformException {
      jailbrokenOrRooted = true;
    }

    return JailbreakStatus(jailbrokenOrRooted);
  }
}

final jailbreakRepositoryProvider = Provider<JailbreakRepository>((ref) {
  return JailbreakRepository();
});
