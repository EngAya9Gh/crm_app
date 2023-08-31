import 'package:intl/intl.dart';

String formatNumber(dynamic number) {
  var formatter = NumberFormat('#,###,###,###,###,###.##');

  return formatter.format(number);
}
