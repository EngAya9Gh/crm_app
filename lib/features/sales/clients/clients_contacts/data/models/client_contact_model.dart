import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:equatable/equatable.dart';

class ClientContactModel extends Equatable{
  final int id;
  final ClientModel client;
  final dynamic userAdd;
  final String name;
  final String? description;
  final String contactType;
  final String contactValue;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClientContactModel({
    required this.id,
    required this.client,
    this.userAdd,
    required this.name,
    this.description,
    required this.contactType,
    required this.contactValue,
    required this.createdAt,
    required this.updatedAt,
  });

  ClientContactModel copyWith({
    int? id,
    ClientModel? client,
    dynamic userAdd,
    String? name,
    String? description,
    String? contactType,
    String? contactValue,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ClientContactModel(
      id: id ?? this.id,
      client: client ?? this.client,
      userAdd: userAdd ?? this.userAdd,
      name: name ?? this.name,
      description: description ?? this.description,
      contactType: contactType ?? this.contactType,
      contactValue: contactValue ?? this.contactValue,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  factory ClientContactModel.fromJson(Map<String, dynamic> json) {
    return ClientContactModel(
      id: json['id'],
      client: ClientModel.fromJson(json['client']),
      userAdd: json['userAdd'],
      name: json['name'],
      description: json['description'],
      contactType: json['contact_type'],
      contactValue: json['contact_value'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    client,
    userAdd,
    name,
    description,
    contactType,
    contactValue,
    createdAt,
    updatedAt,
  ];

}

