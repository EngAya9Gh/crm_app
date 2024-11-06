import 'package:equatable/equatable.dart';

class ActivityTypeModel extends Equatable {
  final int id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ActivityTypeModel({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityTypeModel.fromJson(Map<String, dynamic> json) {
    return ActivityTypeModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    createdAt,
    updatedAt,
  ];
}