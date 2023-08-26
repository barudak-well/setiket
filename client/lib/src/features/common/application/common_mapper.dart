import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/data.dart';
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

  static Result<Event> mapToEventDetail(Result<EventResponse> result) {
    return result.when(
      success: (item) {
        return Result.success(Event.fromResponse(item));
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<User> mapToProfile(Result<UserResponse> result) {
    return result.when(
      success: (item) {
        return Result.success(User.fromResponse(item));
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<MyEvents> mapToMyEvents(
    Result<MyEventResponse> result,
  ) {
    return result.when(
      success: (data) {
        List<Ticket> upcomingEvents = [
          ...data.upcomingEvents.map((e) => Ticket.fromResponse(e))
        ];
        List<Ticket> pastEvents = [
          ...data.pastEvents.map((e) => Ticket.fromResponse(e))
        ];

        return Result.success(
          MyEvents(
            upcomingEvents: upcomingEvents,
            pastEvents: pastEvents,
          ),
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}
