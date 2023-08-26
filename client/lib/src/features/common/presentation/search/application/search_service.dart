import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/presentation/search/application/search_mapper.dart';
import 'package:setiket/src/features/common/presentation/search/data/search_repository.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

class SearchService {
  final SearchRepository _searchRepository;

  SearchService(this._searchRepository);

  Future<Result<List<Event>>> getSearch(String query) async {
    final resultEvents = await _searchRepository.getSearch(query);
    return SearchMapper.mapToEvent(resultEvents);
  }

  Future<Result<List<Event>>> getEvents() async {
    final resultEvents = await _searchRepository.getEvents();
    return SearchMapper.mapToEvent(resultEvents);
  }

  Future<Result<List<Event>>> getSearchByFilter({
    String? category,
    String? location,
    String? startDate,
    String? endDate,
  }) async {
    final resultEvents = await _searchRepository.getSearchByFilter(category, location, startDate, endDate);
    return SearchMapper.mapToEvent(resultEvents);
  }
}

final searchServiceProvider = Provider<SearchService>((ref) {
  final searchRepository = ref.read(searchRepositoryProvider);
  return SearchService(searchRepository);
});
