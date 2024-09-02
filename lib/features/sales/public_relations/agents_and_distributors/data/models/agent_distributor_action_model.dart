import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/common/enums/enums.dart';

class AgentDistributorActionModel extends Equatable {
  final String? name;
  final String? currentUser;
  final ADType? type;
  final String? countryId;
  final String? cityId;
  final String? email;
  final String? phoneNumber;
  final String? description;
  final XFile? imageAgent;
  final String? agentEnterprise;
  final String? source;

  AgentDistributorActionModel({
    this.name,
    this.currentUser,
    this.type,
    this.countryId,
    this.cityId,
    this.email,
    this.phoneNumber,
    this.description,
    this.imageAgent,
    this.agentEnterprise,
    this.source,
  });

  AgentDistributorActionModel copyWith({
    String? name,
    ADType? type,
    String? countryId,
    String? currentUser,
    String? cityId,
    String? email,
    String? phoneNumber,
    String? description,
    XFile? filelogo,
    String? agentEnterprise,
    String? source,
  }) {
    return AgentDistributorActionModel(
      name: name ?? this.name,
      currentUser: currentUser ?? this.currentUser,
      type: type ?? this.type,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      imageAgent: filelogo ?? this.imageAgent,
      agentEnterprise: agentEnterprise ?? this.agentEnterprise,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() => {
        'name_agent': name,
        'currentUser': currentUser,
        'type_agent': type?.index.toString(),
        'fk_country': countryId,
        'cityId': cityId,
        'email_egent': email,
        'mobile_agent': phoneNumber,
        'description': description,
        'agent_enterprise': agentEnterprise,
        'source': source,
      }..removeWhere((key, value) => value == null);

  factory AgentDistributorActionModel.fromMap(Map<String, dynamic> map) {
    return AgentDistributorActionModel(
      name: map['name_agent'],
      type: map['type_agent'] != null
          ? ADType.values[int.parse(map['type_agent'])]
          : null,
      countryId: map['fk_country'],
      cityId: map['cityId'],
      email: map['email_egent'],
      phoneNumber: map['mobile_agent'],
      description: map['description'],
      agentEnterprise: map['agent_enterprise'],
      source: map['source'],
    );
  }

  AgentDistributorActionModel resetType() {
    return AgentDistributorActionModel(
      name: name,
      type: null,
      countryId: countryId,
      cityId: cityId,
      phoneNumber: phoneNumber,
      description: description,
      email: email,
      imageAgent: null,
      agentEnterprise: agentEnterprise,
      source: source,
    );
  }

  @override
  List<Object?> get props => [
        name,
        currentUser,
        type,
        countryId,
        cityId,
        email,
        phoneNumber,
        description,
        imageAgent,
        agentEnterprise,
        source,
      ];
}
