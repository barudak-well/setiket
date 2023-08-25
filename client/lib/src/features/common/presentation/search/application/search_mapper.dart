import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

class SearchMapper {
  static Result<List<Event>> mapToEvent(
    Result<List<EventResponse>> result,
  ) {
    return result.when(
      success: (data) {
        List<Event> event = [...data.map((e) => Event.fromResponse(e))];
        return Result.success(
          event,
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}
