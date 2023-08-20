import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/data.dart';

class JailbreakService {
  final JailbreakRepository _jailbreakRepository;

  JailbreakService(
    this._jailbreakRepository,
  );

  Future<bool> checkJailbreakStatus() async {
    final result = await _jailbreakRepository.checkJailbreakStatus();
    return result.isJailbroken;
  }
}

final jailbreakServiceProvider = Provider<JailbreakService>((ref) {
  final jailbreakRepository = ref.read(jailbreakRepositoryProvider);
  return JailbreakService(jailbreakRepository);
});
