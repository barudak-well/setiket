import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';

// Create a mock implementation of DioClient
void main() {
  late JailbreakRepository jailbreakRepository;

  setUp(() {
    jailbreakRepository = JailbreakRepository();
  });

  group('checkJailbreakStatus', () {
    test('should return JailbreakStatus', () async {
      // Actual result
      final actualResult = await jailbreakRepository.checkJailbreakStatus();
      debugPrint(actualResult.toString());

      // Test
      expect(actualResult, isA<JailbreakStatus>());
    });
  });
}
