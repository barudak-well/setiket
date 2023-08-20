import 'package:equatable/equatable.dart';

class JailbreakStatus extends Equatable {
  final bool isJailbroken;

  const JailbreakStatus(this.isJailbroken);

  @override
  List<Object?> get props => [isJailbroken];
}
