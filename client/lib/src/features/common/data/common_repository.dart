import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/auth/data/responses/responses.dart';
import 'package:setiket/src/features/common/data/responses/responses.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/response/api_response.dart';

class CommonRepository {
  final DioClient _dioClientTmdb;
  CommonRepository(this._dioClientTmdb);

  Future<Result<List<EventResponse>>> fetchEvents() async {
    try {
      final result = await _dioClientTmdb.get(Endpoint.event);
      final resultBody = result['body']['body'];
      final eventList = resultBody
          .map<EventResponse>((e) => EventResponse.fromJson(e))
          .toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<EventResponse>> fetchDetail(int id) async {
    try {
      final result = await _dioClientTmdb.get('${Endpoint.event}/$id');
      final resultBody = result['body']['body'];
      final event = EventResponse.fromJson(resultBody);
      return Result.success(event);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<ApiResponse>> postTicket(RequestTicket data) async {
    try {
      final response =
          await _dioClientTmdb.post(Endpoint.ticket, data: data.toJson());

      return Result.success(ApiResponse.fromJson(response['body']));
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<UserResponse>> fetchProfile(String token) async {
    try {
      final result = await _dioClientTmdb.get(
        Endpoint.profile,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final resultBody = result['body']['body'];
      final user = UserResponse.fromJson(resultBody);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<MyEventResponse>> fetchMyEvents(String token) async {
    try {
      final result = await _dioClientTmdb.get(
        Endpoint.myEvents,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final resultBody = result['body']['body'];
      final user = MyEventResponse.fromJson(resultBody);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository(ref.read(dioClientProvider));
});
