import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/domain.dart';

class JailbreakRepository {
  Future<JailbreakStatus> checkJailbreakStatus() async {
    bool jailbrokenOrRooted = false;
    try {
      jailbrokenOrRooted = await FlutterJailbreakDetection.jailbroken;
    } catch (e) {
      jailbrokenOrRooted = true;
    }

    return JailbreakStatus(jailbrokenOrRooted);
  }
}

final jailbreakRepositoryProvider = Provider<JailbreakRepository>((ref) {
  return JailbreakRepository();
});
