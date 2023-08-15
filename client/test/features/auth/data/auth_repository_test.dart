import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

import '../../../services/remote/dio_clients_mock.dart';

// Create a mock implementation of DioClient
void main() {
  late AuthResponse authResponse;
  late UserResponse userResponse;
  late RequestLogin requestLogin;
  late MockDioClient mockDioClient;
  late AuthRepository authRepository;

  setUp(() {
    userResponse = UserResponse(
      id: 1,
      username: 'admin',
      email: 'admin@gmail.com',
      gender: 1,
      birthdate: '13-06-2004',
    );
    authResponse = AuthResponse(user: userResponse);
    requestLogin = RequestLogin(
      email: 'admin@gmail.com',
      password: 'admin123',
    );

    mockDioClient = MockDioClient();
    authRepository = AuthRepository(mockDioClient);
  });

  group('login', () {
    test('returns AuthResponse when response success', () async {
      // Expected result
      final expectedResult = Result.success(authResponse);

      // Stubbing the mockDioClient.post method
      when(
        () => mockDioClient.post(Endpoint.login, data: requestLogin.toJson()),
      ).thenAnswer((_) => Future.value(Result.success(authResponse)));

      // Actual result
      final actualResult = await authRepository.login(requestLogin);
      debugPrint(actualResult.toString());

      // Test
      expect(actualResult, expectedResult);
    });

    test('returns failure when response failed', () async {
      // Expected result
      const expectedResult = Result.failure(
        NetworkExceptions.badRequest(),
        StackTrace.empty,
      );

      // Stubbing the mockDioClient.post method
      when(
        () => mockDioClient.post(Endpoint.login, data: requestLogin.toJson()),
      ).thenAnswer((_) => Future.value(expectedResult));

      // Actual result
      final actualResult = await authRepository.login(requestLogin);

      // Test
      expect(actualResult, expectedResult);
    });
  });
}
