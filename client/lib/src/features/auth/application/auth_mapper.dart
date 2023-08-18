import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';

class AuthMapper {
  static User mapToUser(AuthResponse data) {
    return User(
      token: data.token ?? '',
      id: data.user?.id ?? -1,
      email: data.user?.email ?? '-',
      fullname: data.user?.fullname ?? '-',
      status: data.user?.status ?? StatusUser.pending,
      role: data.user?.role ?? RoleUser.user,
    );
  }
}
