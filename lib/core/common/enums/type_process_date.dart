enum TypeProcessDate { reschedule, cancel }

extension TypeProcessDateExtension on TypeProcessDate {
  String get value {
    switch (this) {
      case TypeProcessDate.reschedule:
        return 'reschedule';
      case TypeProcessDate.cancel:
        return 'cancel';
    }
  }
}
