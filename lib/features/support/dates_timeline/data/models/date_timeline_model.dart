import 'package:equatable/equatable.dart';

class DateTimelineModel extends Equatable {
  final String? startTime;
  final String? endTime;
  final String? time;

  DateTimelineModel({
    this.startTime,
    this.endTime,
    this.time,
  });

  factory DateTimelineModel.fromJson(Map<String, dynamic> json) {
    return DateTimelineModel(
      startTime: json['start_time'],
      endTime: json['end_time'],
      time: json['time'],
    );
  }

  @override
  List<Object?> get props {
    return [
      startTime,
      endTime,
      time,

    ];
  }
}