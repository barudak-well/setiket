import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/services/services.dart';

class SearchRepository {
  final DioClient _dioClientTmdb;
  SearchRepository(this._dioClientTmdb);

  Future<Result<List<EventResponse>>> getSearch(String query) async {
    try {
      final result = await _dioClientTmdb.get(Endpoint.event, queryParameters: {
        'search': query,
      });
      final resultBody = result['body']['body'];
      final eventList = resultBody.map<EventResponse>((e) => EventResponse.fromJson(e)).toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<List<EventResponse>>> getEvents() async {
    try {
      final result = await _dioClientTmdb.get(Endpoint.event);
      final resultBody = result['body']['body'];
      final eventList = resultBody.map<EventResponse>((e) => EventResponse.fromJson(e)).toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }

  Future<Result<List<EventResponse>>> getSearchByFilter(
    String? category,
    String? location,
    String? startDate,
    String? endDate,
  ) async {
    try {
      Map<String, dynamic> queryParameters = {};
      if (category != null && category != '') queryParameters['category'] = category;
      if (location != null && location != '') queryParameters['location'] = location;
      if (startDate != null && startDate != '') queryParameters['date_gte'] = startDate;
      if (endDate != null && endDate != '') queryParameters['date_lte'] = endDate;
      final result = await _dioClientTmdb.get(Endpoint.event, queryParameters: queryParameters);
      final resultBody = result['body']['body'];
      final eventList = resultBody.map<EventResponse>((e) => EventResponse.fromJson(e)).toList();
      return Result.success(eventList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(ref.read(dioClientProvider));
});
