import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';

class AuthMapper {
  static User mapToUser(AuthResponse data) {
    return User(
      token: data.token ?? '',
      id: data.user?.id ?? -1,
      username: data.user?.username ?? '-',
      email: data.user?.email ?? '-',
      birthdate: data.user?.birthdate ?? '',
      gender: data.user?.gender ?? -1,
    );
  }
}
