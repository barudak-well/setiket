import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/auth/data/responses/responses.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/response/api_response.dart';

import '../../../services/local/hive_service_mock.dart';
import '../../data_mocks.dart';

void main() {
  late ApiResponse apiResponseRegister;
  late ApiResponse apiResponseLogin;
  late UserResponse userResponse;
  late RequestRegister requestRegister;
  late RequestLogin requestLogin;
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
    userResponse = const UserResponse(
      id: 1,
      email: 'admin@gmail.com',
      fullname: 'admin',
      role: RoleUser.user,
    );
    apiResponseRegister = ApiResponse(
      status: true,
      message: "string",
      body: userResponse,
    );

    requestLogin = RequestLogin(
      email: 'user@gmail.com',
      password: 'user12345678',
    );
    apiResponseLogin = const ApiResponse(
      status: true,
      message: "string",
      body: {"accessToken": "token"},
    );

    mockAuthRepository = MockAuthRepository();
    mockHiveService = MockHiveService();

    authService = AuthService(mockAuthRepository, mockHiveService);
  });

  group('login()', () {
    test('returns String when success', () async {
      Result<String?> expectedResult = const Result.success('Login Success!');

      when(
        () => mockAuthRepository.login(requestLogin),
      ).thenAnswer((_) => Future.value(Result.success(apiResponseLogin)));

      final actualResult = await authService.login(requestLogin);

      expect(actualResult, expectedResult);
    });
  });
  group('register()', () {
    test('returns String when success', () async {
      Result<String?> expectedResult =
          const Result.success('Register Success!');

      when(
        () => mockAuthRepository.register(requestRegister),
      ).thenAnswer((_) => Future.value(Result.success(apiResponseRegister)));

      final actualResult = await authService.register(requestRegister);

      expect(actualResult, expectedResult);
    });
  });
}
