import 'package:intl/intl.dart';

bool IsStartAfterEnd(String startTime, String endTime, {bool isDate = false}) {
  final now = DateTime.now();

  try {
    DateTime startDateTime;
    DateTime endDateTime;

    if (isDate) {
      final format = DateFormat('yyyy-MM-dd h:mm a'); // Updated to match input format
      final start = format.parse(startTime);
      final end = format.parse(endTime);

      startDateTime = DateTime(start.year, start.month, start.day, start.hour, start.minute);
      endDateTime = DateTime(end.year, end.month, end.day, end.hour, end.minute);
    } else {
      final format = DateFormat('h:mm a'); // Time-only format
      final start = format.parse(startTime);
      final end = format.parse(endTime);

      startDateTime = DateTime(now.year, now.month, now.day, start.hour, start.minute);
      endDateTime = DateTime(now.year, now.month, now.day, end.hour, end.minute);
    }

    return startDateTime.isAfter(endDateTime);
  } catch (e) {
    print('Error parsing time: $e');
    return false;
  }
}
