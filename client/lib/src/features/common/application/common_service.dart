import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/common/domain/request_ticket.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

class CommonService {
  final CommonRepository _commonRepository;

  CommonService(this._commonRepository);

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
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);
  return CommonService(commonRepository);
});
