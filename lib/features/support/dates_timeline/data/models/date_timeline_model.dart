import 'package:equatable/equatable.dart';

class DateTimelineModel extends Equatable {
  final DateTime? startTime;
  final DateTime? endTime;
  final String? time;
  final String? nameEnterprise;  // Added field

  DateTimelineModel({
    this.startTime,
    this.endTime,
    this.time,
    this.nameEnterprise,  // Added parameter
  });

  factory DateTimelineModel.fromJson(Map<String, dynamic> json) {
    return DateTimelineModel(
      startTime: json['start_time'] != null ? DateTime.parse(json['start_time']) : null,
      endTime: json['end_time'] != null ? DateTime.parse(json['end_time']) : null,
      time: json['time'],
      nameEnterprise: json['name_enterprise'],  // Added field parsing
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime?.toIso8601String(),
      'end_time': endTime?.toIso8601String(),
      'time': time,
      'name_enterprise': nameEnterprise,  // Added field serialization
    };
  }

  @override
  List<Object?> get props => [startTime, endTime, time, nameEnterprise];  // Updated props

  DateTimelineModel copyWith({
    DateTime? startTime,
    DateTime? endTime,
    String? time,
    String? nameEnterprise,  // Added parameter
  }) {
    return DateTimelineModel(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      time: time ?? this.time,
      nameEnterprise: nameEnterprise ?? this.nameEnterprise,  // Added field
    );
  }
}