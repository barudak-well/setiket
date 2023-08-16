import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

import '../../../services/local/hive_service_mock.dart';
import '../../data_mocks.dart';

void main() {
  late RequestRegister requestRegister;

  late MockAuthRepository mockAuthRepository;
  late MockHiveService mockHiveService;

  late AuthService authService;

  setUp(() {
    requestRegister = RequestRegister(
      email: 'user@gmail.com',
      fullname: 'user',
      password: 'user12345678',
      role: 'USER',
    );

    mockAuthRepository = MockAuthRepository();
    mockHiveService = MockHiveService();

    authService = AuthService(mockAuthRepository, mockHiveService);
  });

  group('register()', () {
    test('returns String when success', () async {
      const expectedResult = Result.success('Register Success!');
      when(
        () async {
          final result = await mockAuthRepository.register(requestRegister);
          return result.when(
            success: (data) {
              return const Result.success('Register Success!');
            },
            failure: (error, stackTrace) {
              return Result.failure(error, stackTrace);
            },
          );
        },
      ).thenAnswer(
        (invocation) => Future.value(
          const Result.success('Register Success!'),
        ),
      );

      final actualResult = await authService.register(requestRegister);

      expect(actualResult, expectedResult);
    });
  });
}
