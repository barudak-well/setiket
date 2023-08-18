import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/response/api_response.dart';

import '../../../services/remote/dio_clients_mock.dart';

// Create a mock implementation of DioClient
void main() {
  late ApiResponse apiResponse;
  late UserResponse userResponse;
  late RequestRegister requestRegister;
  late MockDioClient mockDioClient;
  late AuthRepository authRepository;

  setUp(() {
    userResponse = const UserResponse(
      id: 1,
      email: 'admin@gmail.com',
      fullname: 'admin',
      role: RoleUser.user,
    );
    apiResponse = ApiResponse(
      status: true,
      message: "string",
      body: userResponse,
    );
    requestRegister = RequestRegister(
      email: 'user@gmail.com',
      fullname: 'user',
      password: 'user12345678',
      role: 'USER',
    );

    mockDioClient = MockDioClient();
    authRepository = AuthRepository(mockDioClient);
  });

  group('register', () {
    test('returns ApiResponse when response success', () async {
      // Expected result
      final expectedResult = Result.success(apiResponse);

      // Stubbing the mockDioClient.post method
      when(
        () => mockDioClient.post(Endpoint.register,
            data: requestRegister.toJson()),
      ).thenAnswer((_) => Future.value(apiResponse.toJson()));

      // Actual result
      final actualResult = await authRepository.register(requestRegister);
      debugPrint(actualResult.toString());

      // Test
      expect(actualResult, expectedResult);
    });

    test('returns failure when response failed', () async {
      // Expected result
      Result<ApiResponse> expectedResult = const Result.failure(
        NetworkExceptions.badRequest(),
        StackTrace.empty,
      );

      // Stubbing the mockDioClient.post method
      when(
        () => mockDioClient.post(Endpoint.register,
            data: requestRegister.toJson()),
      ).thenAnswer((_) => Future.value(expectedResult));

      // Actual result
      final actualResult = await authRepository.register(requestRegister);

      // Test
      expect(actualResult, isA<Result<ApiResponse>>());
    });
  });
}
