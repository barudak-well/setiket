import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/response/api_response.dart';

class AuthRepository {
  final DioClient _dioClient;

  AuthRepository(this._dioClient);

  Future<Result<AuthResponse>> login(RequestLogin requestLogin) async {
    try {
      final response = await _dioClient.post(
        Endpoint.login,
        data: requestLogin.toJson(),
      );

      return Result.success(AuthResponse.fromJson(response['data']));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }

  Future<Result<ApiResponse>> register(RequestRegister requestRegister) async {
    try {
      final response = await _dioClient.post(
        Endpoint.register,
        data: requestRegister.toJson(),
      );

      return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioClientProvider);
  return AuthRepository(dio);
});
