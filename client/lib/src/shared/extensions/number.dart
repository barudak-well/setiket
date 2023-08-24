import 'package:intl/intl.dart';

extension XNum on num {
  String get currency => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: 0,
      ).format(this);
}
