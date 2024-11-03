import 'package:equatable/equatable.dart';

class ViolationType extends Equatable {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  ViolationType({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ViolationType.fromJson(Map<String, dynamic> json) {
    return ViolationType(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
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