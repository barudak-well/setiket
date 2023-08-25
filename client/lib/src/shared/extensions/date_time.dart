import 'package:intl/intl.dart';

extension XDateTime on DateTime {
  String get toYyyyMMDd => DateFormat('yyyy-MM-dd').format(this);
  String get dateMonthTime => '$dateMonth • $time';
  String get dateMonthYear => DateFormat('yMMMMd').format(this);
  String get dateMonth => DateFormat('MMMEd').format(this);
  String get dayName => DateFormat('EEEE').format(this);
  String get monthName => DateFormat('MMMM').format(this);
  String get time => DateFormat('jm').format(this);
}
