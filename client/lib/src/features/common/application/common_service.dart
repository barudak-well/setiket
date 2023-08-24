import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
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

  Future<Result<EventResponse>> getEventById(int id) async {
    final result = await _commonRepository.fetchDetail(id);
    return result;
  }

  Future<Result<List<EventResponse>>> getEventList() async {
    final result = await _commonRepository.fetchEvents();
    return result;
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);
  return CommonService(commonRepository);
});
