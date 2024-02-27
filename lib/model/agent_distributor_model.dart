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
  });

  factory AgentDistributorModel.fromJson(Map<String, dynamic> json) {
    print("json is => $json");
    return AgentDistributorModel(
      idAgent: json["id_agent"],
      nameAgent: json["name_agent"],
      typeAgent: json["type_agent"].toString(),
      emailAgent: json["email_egent"],
      mobileAgent: json["mobile_agent"],
      fkCountry: json["fk_country"],
      description: json["description"],
      imageAgent: json["image_agent"].toString().trim().isEmpty ||
              json["image_agent"] == null
          ? json["image_agent"]
          : urlfileAgent + json['image_agent'],
      cityId: json["cityId"],
      addDate: json['add_date'],
      updateDate: json['update_date'],
      fkUserAdd: json['fk_user_add'],
      fkUserUpdate: json['fk_user_update'],
      nameUserAdd: json['nameUserAdd'],
      nameUserUpdate: json['nameUserUpdate'],
      nameCity: json['name_city'],
      fkuser_training: json['fkuser_training'],
      is_training: json['is_training'].toString() == "1",
      date_training: json['date_training'],
      nameusertraining: json['nameusertraining'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_agent": idAgent,
        "name_agent": nameAgent,
        "type_agent": typeAgent,
        "email_egent": emailAgent,
        "mobile_agent": mobileAgent,
        "fk_country": fkCountry,
        "description": description,
        "image_agent": imageAgent,
        "cityId": cityId,
        "add_date": addDate,
        "update_date": updateDate,
        "fk_user_add": fkUserAdd,
        "fk_user_update": fkUserUpdate,
        "nameUserAdd": nameUserAdd,
        "nameUserUpdate": nameUserUpdate,
        "fkuser_training": fkuser_training,
        "is_training": is_training == true ? "1" : "0",
        "date_training": date_training,
        "nameusertraining": nameusertraining,
      };

  @override
  String toString() {
    return 'AgentDistributorModel{idAgent: $idAgent, nameAgent: $nameAgent, typeAgent: $typeAgent, emailEgent: $emailAgent, mobileAgent: $mobileAgent, fkCountry: $fkCountry,cityId: $cityId, description: $description, imageAgent: $imageAgent, cityName: $nameCity, addDate: $addDate, updateDate: $updateDate, fkUserAdd: $fkUserAdd, fkUserUpdate: $fkUserUpdate, nameUserAdd: $nameUserAdd, nameUserUpdate: $nameUserUpdate, fkuser_training: $fkuser_training, is_training: $is_training, date_training: $date_training, nameusertraining: $nameusertraining}';
  }
}
