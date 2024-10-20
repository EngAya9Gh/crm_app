import 'package:equatable/equatable.dart';

class DateTimelineModel extends Equatable {
  final DateTime? startTime;
  final DateTime? endTime;
  final String? time;

  DateTimelineModel({
    this.startTime,
    this.endTime,
    this.time,
  });

  factory DateTimelineModel.fromJson(Map<String, dynamic> json) {
    return DateTimelineModel(
      startTime: json['start_time'] != null ? DateTime.parse(json['start_time']) : null,
      endTime: json['end_time'] != null ? DateTime.parse(json['end_time']) : null,
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime?.toIso8601String(),
      'end_time': endTime?.toIso8601String(),
      'time': time,
    };
  }

  @override
  List<Object?> get props => [startTime, endTime, time];

  DateTimelineModel copyWith({
    DateTime? startTime,
    DateTime? endTime,
    String? time,
  }) {
    return DateTimelineModel(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      time: time ?? this.time,
    );
  }
}