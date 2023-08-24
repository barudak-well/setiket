import 'package:setiket/src/features/common/data/responses/event_response.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/services/services.dart';

class CommonMapper {
  static Result<Home> mapToHome(
    Result<List<EventResponse>> result,
  ) {
    return result.when(
      success: (data) {
        List<Event> event = [...data.map((e) => Event.fromResponse(e))];
        return Result.success(
          Home(
            eventListItems: event,
          ),
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}
