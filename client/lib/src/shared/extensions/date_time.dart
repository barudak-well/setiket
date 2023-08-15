import 'package:intl/intl.dart';

extension XDateTime on DateTime {
  String get toYyyyMMDd => DateFormat('yyyy-MM-dd').format(this);
}