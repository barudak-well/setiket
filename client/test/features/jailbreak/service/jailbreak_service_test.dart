import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/domain.dart';

import '../../data_mocks.dart';

// Create a mock implementation of DioClient
void main() {
  late MockJailbreakRepository mockJailbreakRepository;
  late JailbreakService jailbreakService;

  setUp(() {
    mockJailbreakRepository = MockJailbreakRepository();
    jailbreakService = JailbreakService(mockJailbreakRepository);
  });

  group('checkJailbreakStatus()', () {
    test('should return JailbreakStatus false from repository', () async {
      when(
        () => mockJailbreakRepository.checkJailbreakStatus(),
      ).thenAnswer((_) => Future.value(const JailbreakStatus(false)));

      final actualResult = await jailbreakService.checkJailbreakStatus();

      expect(actualResult, false);
    });
  });
}
