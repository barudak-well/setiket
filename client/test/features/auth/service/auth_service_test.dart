import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

import '../../../services/local/hive_service_mock.dart';
import '../../data_mocks.dart';

void main() {
  late RequestLogin requestLogin;

  late MockAuthRepository mockAuthRepository;
  late MockHiveService mockHiveService;

  late AuthService authService;

  setUp(() {
    requestLogin = RequestLogin(
      email: 'admin@gmail.com',
      password: 'admin123',
    );

    mockAuthRepository = MockAuthRepository();
    mockHiveService = MockHiveService();

    authService = AuthService(mockAuthRepository, mockHiveService);
  });

  group('login()', () {
    test('returns String when success', () async {
      const expectedResult = Result.success('Login Success!');
      when(
        () async {
          final result = await mockAuthRepository.login(requestLogin);
          return result.when(
            success: (data) {
              return const Result.success('Login Success!');
            },
            failure: (error, stackTrace) {
              return Result.failure(error, stackTrace);
            },
          );
        },
      ).thenAnswer(
        (invocation) => Future.value(
          const Result.success('Login Success!'),
        ),
      );

      final actualResult = await authService.login(requestLogin);

      expect(actualResult, expectedResult);
    });
  });
}
