// To parse this JSON data, do
//
//     final agentDistributorResponse = agentDistributorResponseFromJson(jsonString);

import 'dart:convert';

import '../constants.dart';

AgentDistributorResponse agentDistributorResponseFromJson(String str) =>
    AgentDistributorResponse.fromJson(json.decode(str));

String agentDistributorResponseToJson(AgentDistributorResponse data) =>
    json.encode(data.toJson());

class AgentDistributorResponse {
  //region Variables
  String result;
  String code;
  List<AgentDistributorModel> message;

  //endregion

  //region Constructor
  AgentDistributorResponse({
    required this.result,
    required this.code,
    required this.message,
  });

  //endregion

  //region Json methods converting
  factory AgentDistributorResponse.fromJson(Map<String, dynamic> json) =>
      AgentDistributorResponse(
        result: json["result"],
        code: json["code"],
        message: List<AgentDistributorModel>.from(
            json["message"].map((x) => AgentDistributorModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "code": code,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
//endregion
}

class AgentDistributorModel {
  //region Variables
  String idAgent;
  String nameAgent;
  String typeAgent;
  String emailAgent;
  String mobileAgent;
  String? fkCountry;
  String? cityId;
  String description;
  String imageAgent;
  String? cityName;

  //endregion

  //region C
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
    required this.cityName,
  });

  factory AgentDistributorModel.fromJson(Map<String, dynamic> json) =>
      AgentDistributorModel(
        idAgent: json["id_agent"],
        nameAgent: json["name_agent"],
        typeAgent: json["type_agent"],
        emailAgent: json["email_egent"],
        mobileAgent: json["mobile_agent"],
        fkCountry: json["fk_country"],
        cityId: json["cityId"],
        description: json["description"],
        imageAgent: json["image_agent"].toString().trim().isEmpty ||
                json["image_agent"] == null
            ? json["image_agent"]
            : urlfileAgent + json['image_agent'],
        cityName: json['name_city'],
      );

  Map<String, dynamic> toJson() => {
        "id_agent": idAgent,
        "name_agent": nameAgent,
        "type_agent": typeAgent,
        "email_egent": emailAgent,
        "mobile_agent": mobileAgent,
        "fk_country": fkCountry,
        "cityId": cityId,
        "description": description,
        "image_agent": imageAgent,
        "name_city": cityName,
      };

  @override
  String toString() {
    return 'AgentDistributorModel{idAgent: $idAgent, nameAgent: $nameAgent, typeAgent: $typeAgent, emailEgent: $emailAgent, mobileAgent: $mobileAgent, fkCountry: $fkCountry,cityId: $cityId, description: $description, imageAgent: $imageAgent, cityName: $cityName}';
  }
}
