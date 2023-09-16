import 'package:intl/intl.dart';

extension StringExtension on String {
  // DateFormat get monthFormatter => DateFormat.MMMd();
  bool get isNullOrEmpty => isEmpty;
  static DateFormat formatter = DateFormat.yMMMd();



  static String? asTime(String? input) => input == null ? null : DateFormat('hh:mm a').format(DateTime.parse(input));
  static String? asDate(String? input) => input == null ? null : DateFormat.yMMMd().format(DateTime.parse(input));
}

extension StringExtension2 on String? {
  // DateFormat get monthFormatter => DateFormat.MMMd();
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  static DateFormat formatter = DateFormat.yMMMd();

  static String? asDate(String? input) => input == null ? null : DateFormat.yMMMd().format(DateTime.parse(input));
}
