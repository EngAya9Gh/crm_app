import '../core/common/helpers/helper_functions.dart';
import 'agent_state_model.dart';

import '../core/utils/end_points.dart';

class AgentDistributorModel {
  String idAgent;
  String nameAgent;
  String typeAgent;
  String emailAgent;
  String mobileAgent;
  String? fkCountry;
  String description;
  String imageAgent;
  String? cityId;
  String? addDate;
  String? updateDate;
  String? fkUserAdd;
  String? fkUserUpdate;
  String? nameCity;
  String? nameUserAdd;
  String? nameUserUpdate;
  String? fkuser_training;
  bool? is_training;
  String? date_training;
  String? nameusertraining;
  AgentStateModel? lastState;
  List<AgentStateModel>? allStates;
  final String? agentEnterprise;
  final String? source;

  AgentDistributorModel({
    required this.idAgent,
    required this.nameAgent,
    required this.typeAgent,
    required this.emailAgent,
    required this.mobileAgent,
    this.fkCountry,
    this.cityId,
    required this.description,
    required this.imageAgent,
    this.nameCity,
    this.addDate,
    this.updateDate,
    this.fkUserAdd,
    this.fkUserUpdate,
    this.nameUserAdd,
    this.nameUserUpdate,
    this.fkuser_training,
    this.is_training,
    this.date_training,
    this.nameusertraining,
    this.lastState,
    this.allStates,
    this.agentEnterprise,
    this.source,
  });

  factory AgentDistributorModel.fromJson(dynamic json) {
    return AgentDistributorModel(
      idAgent: json["id_agent"].toString(),
      nameAgent: json["name_agent"],
      typeAgent: json["type_agent"].toString(),
      emailAgent: json["email_egent"] ?? '',
      mobileAgent: json["mobile_agent"] ?? '',
      fkCountry: HelperFunctions.JsonStringNullHandler(json["fk_country"]),
      description: json["description"] ?? '',
      imageAgent: json["image_agent"].toString().trim().isEmpty ||
              json["image_agent"] == null
          ? ""
          : EndPoints.baseUrls.laravelFilesUrl + json['image_agent'],
      cityId: HelperFunctions.JsonStringNullHandler(json["cityId"]),
      addDate: json['add_date'],
      updateDate: json['update_date'],
      fkUserAdd: HelperFunctions.JsonStringNullHandler(json['fk_user_add']),
      fkUserUpdate:
          HelperFunctions.JsonStringNullHandler(json['fk_user_update']),
      nameUserAdd: json['nameUserAdd'],
      nameUserUpdate: json['nameUserUpdate'],
      nameCity: json['name_city'],
      fkuser_training:
          HelperFunctions.JsonStringNullHandler(json['fkuser_training']),
      is_training: json['is_training'].toString() == "1",
      date_training: json['date_training'],
      nameusertraining: json['nameusertraining'],
      lastState: json['last_state'] != null
          ? AgentStateModel.fromJson(json['last_state'])
          : null,
      allStates: json['states'] != null
          ? List<AgentStateModel>.from(
              json['states'].map((x) => AgentStateModel.fromJson(x)))
          : null,
      agentEnterprise: json['agent_enterprise'],
      source: json['source'],
    );
  }

  // toString
  String toString() {
    return 'AgentDistributorModel(idAgent: $idAgent, nameAgent: $nameAgent, typeAgent: $typeAgent, emailAgent: $emailAgent, mobileAgent: $mobileAgent, fkCountry: $fkCountry, description: $description, imageAgent: $imageAgent, cityId: $cityId, addDate: $addDate, updateDate: $updateDate, fkUserAdd: $fkUserAdd, fkUserUpdate: $fkUserUpdate, nameCity: $nameCity, nameUserAdd: $nameUserAdd, nameUserUpdate: $nameUserUpdate, fkuser_training: $fkuser_training, is_training: $is_training, date_training: $date_training, nameusertraining: $nameusertraining, lastState: $lastState, allStates: $allStates, agentEnterprise: $agentEnterprise, source: $source)';
  }
}
