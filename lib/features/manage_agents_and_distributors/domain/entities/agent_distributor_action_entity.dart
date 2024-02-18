import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../common/enums/enums.dart';

class AgentDistributorActionEntity extends Equatable {
  final String? name;
  final ADType? type;
  final String? countryId;
  final String? cityId;
  final String? email;
  final String? phoneNumber;
  final String? description;
  final File? filelogo;

  AgentDistributorActionEntity({
    this.name,
    this.type,
    this.countryId,
    this.cityId,
    this.email,
    this.phoneNumber,
    this.description,
    this.filelogo,
  });

  AgentDistributorActionEntity copyWith({
    String? name,
    ADType? type,
    String? countryId,
    String? cityId,
    String? email,
    String? phoneNumber,
    String? description,
    File? filelogo,
  }) {
    return AgentDistributorActionEntity(
      name: name ?? this.name,
      type: type ?? this.type,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      filelogo: filelogo ?? this.filelogo,
    );
  }

  Map<String, dynamic> toMap() => {
        'name_agent': name,
        'type_agent': type?.index.toString(),
        'fk_country': countryId,
        'cityId': cityId,
        'email_egent': email,
        'mobile_agent': phoneNumber,
        'description': description,
      }..removeWhere((key, value) => value == null);

  factory AgentDistributorActionEntity.fromMap(Map<String, dynamic> map) {
    return AgentDistributorActionEntity(
      name: map['name_agent'],
      type: map['type_agent'] != null
          ? ADType.values[int.parse(map['type_agent'])]
          : null,
      countryId: map['fk_country'],
      cityId: map['cityId'],
      email: map['email_egent'],
      phoneNumber: map['mobile_agent'],
      description: map['description'],
    );
  }

  AgentDistributorActionEntity resetType() {
    return AgentDistributorActionEntity(
      name: name,
      type: null,
      countryId: countryId,
      cityId: cityId,
      phoneNumber: phoneNumber,
      description: description,
      email: email,
      filelogo: null,
    );
  }

  @override
  List<Object?> get props => [
        name,
        type,
        countryId,
        cityId,
        email,
        phoneNumber,
        description,
        filelogo,
      ];
}
