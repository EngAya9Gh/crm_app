import 'package:intl/intl.dart';

bool IsStartAfterEnd(String startTime, String endTime) {
  // Get today's date
  final now = DateTime.now();

  try {
    // Parse the time strings
    final format = DateFormat('h:mm a');

    // Convert strings to DateTime objects by combining with today's date
    final start = format.parse(startTime);
    final end = format.parse(endTime);

    // Create full DateTime objects with today's date
    final startDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      start.hour,
      start.minute,
    );

    final endDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      end.hour,
      end.minute,
    );

    // Compare the times
    return startDateTime.isAfter(endDateTime);
  } catch (e) {
    print('Error parsing time: $e');
    return false;
  }
}