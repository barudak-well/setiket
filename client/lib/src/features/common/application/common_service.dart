import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

class CommonService {
  final CommonRepository _commonRepository;
  final HiveService _hiveService;

  CommonService(
    this._commonRepository,
    this._hiveService,
  );

  Future<Result<Home>> fetchHome() async {
    final resultEvents = await _commonRepository.fetchEvents();
    return CommonMapper.mapToHome(resultEvents);
  }

  Future<Result<Event>> getEventById(int id) async {
    final result = await _commonRepository.fetchDetail(id);
    return CommonMapper.mapToEventDetail(result);
  }

  Future<Result<List<EventResponse>>> getEventList() async {
    final result = await _commonRepository.fetchEvents();
    return result;
  }

  Future<Result<String?>> createTicket(RequestTicket ticket) async {
    final result = await _commonRepository.postTicket(ticket);
    return result.when(
      success: (data) {
        return Result.success(data.message);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<User>> getProfile() async {
    String? token = _hiveService.getToken();
    log('token: $token');

    if (token == null) {
      return Result.failure(
        const NetworkExceptions.notFound('Token is null'),
        StackTrace.current,
      );
    }

    final result = await _commonRepository.fetchProfile(token);
    return CommonMapper.mapToProfile(result);
  }

  void logout() {
    _hiveService.logout();
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);
  final hiveService = ref.read(hiveServiceProvider);
  return CommonService(commonRepository, hiveService);
});
