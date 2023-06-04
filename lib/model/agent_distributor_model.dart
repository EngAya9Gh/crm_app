// To parse this JSON data, do
//
//     final agentDistributorResponse = agentDistributorResponseFromJson(jsonString);

import 'dart:convert';

import '../constants.dart';

AgentDistributorResponse agentDistributorResponseFromJson(String str) => AgentDistributorResponse.fromJson(json.decode(str));

String agentDistributorResponseToJson(AgentDistributorResponse data) => json.encode(data.toJson());

class AgentDistributorResponse {
  String result;
  String code;
  List<AgentDistributorModel> message;

  AgentDistributorResponse({
    required this.result,
    required this.code,
    required this.message,
  });

  factory AgentDistributorResponse.fromJson(Map<String, dynamic> json) => AgentDistributorResponse(
    result: json["result"],
    code: json["code"],
    message: List<AgentDistributorModel>.from(json["message"].map((x) => AgentDistributorModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "code": code,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class AgentDistributorModel {
  String idAgent;
  String nameAgent;
  String typeAgent;
  String emailEgent;
  String mobileAgent;
  String fkCountry;
  String description;
  String imageAgent;

  AgentDistributorModel({
    required this.idAgent,
    required this.nameAgent,
    required this.typeAgent,
    required this.emailEgent,
    required this.mobileAgent,
    required this.fkCountry,
    required this.description,
    required this.imageAgent,
  });

  factory AgentDistributorModel.fromJson(Map<String, dynamic> json) => AgentDistributorModel(
    idAgent: json["id_agent"],
    nameAgent: json["name_agent"],
    typeAgent: json["type_agent"],
    emailEgent: json["email_egent"],
    mobileAgent: json["mobile_agent"],
    fkCountry: json["fk_country"],
    description: json["description"],
    imageAgent: json["image_agent"].toString().trim().isEmpty
      ||json["image_agent"]==null
      ? json["image_agent"]
      : urlfileAgent+ json['image_agent'] ,
  );

  Map<String, dynamic> toJson() => {
    "id_agent": idAgent,
    "name_agent": nameAgent,
    "type_agent": typeAgent,
    "email_egent": emailEgent,
    "mobile_agent": mobileAgent,
    "fk_country": fkCountry,
    "description": description,
    "image_agent": imageAgent,
  };
}
