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
  late ApiResponse apiResponse;
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
    requestLogin = RequestLogin(
      email: 'user@gmail.com',
      password: 'user12345678',
    );
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

    mockAuthRepository = MockAuthRepository();
    mockHiveService = MockHiveService();

    authService = AuthService(mockAuthRepository, mockHiveService);
  });

  group('login()', () {
    test('returns String when success', () async {
      Result<String?> expectedResult = const Result.success('Login Success!');

      when(
        () => mockAuthRepository.login(requestLogin),
      ).thenAnswer((_) => Future.value(Result.success(apiResponse)));

      final actualResult = await authService.login(requestLogin);

      expect(actualResult, expectedResult);
    });
  });
  group('register()', () {
    test('returns String when success', () async {
      Result<String?> expectedResult = const Result.success('Register Success!');

      when(
        () => mockAuthRepository.register(requestRegister),
      ).thenAnswer((_) => Future.value(Result.success(apiResponse)));

      final actualResult = await authService.register(requestRegister);

      expect(actualResult, expectedResult);
    });
  });
}
