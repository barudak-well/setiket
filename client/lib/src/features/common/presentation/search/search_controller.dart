import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/presentation/search/application/search_service.dart';
import 'package:setiket/src/features/common/presentation/search/search_state.dart';

class SearchController extends StateNotifier<SearchState> {
  final SearchService _searchService;
  SearchController(this._searchService) : super(const SearchState()) {
    getSearch('');
  }

  void setSearch(String query) {
    state = state.copyWith(query: query);
  }

  void getEvent() async {
    state = state.copyWith(
      eventValue: const AsyncLoading(),
    );
    final result = await _searchService.getEvents();
    result.when(
      success: (data) {
        state = state.copyWith(
          event: data,
          eventValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(eventValue: AsyncError(error, stackTrace));
      },
    );
  }

  void getSearch(String query) async {
    state = state.copyWith(
      eventValue: const AsyncLoading(),
    );
    final result = await _searchService.getSearch(query);
    result.when(
      success: (data) {
        state = state.copyWith(
          event: data,
          eventValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(eventValue: AsyncError(error, stackTrace));
      },
    );
  }
}

final searchControllerProvider = StateNotifierProvider<SearchController, SearchState>((ref) {
  final searchService = ref.read(searchServiceProvider);
  return SearchController(searchService);
});
