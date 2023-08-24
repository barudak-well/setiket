import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/data/responses/event_response.dart';
import 'package:setiket/src/services/services.dart';

class CommonRepository {
  final DioClient _dioClientTmdb;
  CommonRepository(this._dioClientTmdb);

  Future<Result<List<EventResponse>>> fetchEvents() async {
    try {
      final result = await _dioClientTmdb.get(Endpoint.event);
      final resultBody = result['body']['body'];
      final eventList = resultBody.map<EventResponse>((e) => EventResponse.fromJson(e)).toList();
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
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository(ref.read(dioClientProvider));
});
