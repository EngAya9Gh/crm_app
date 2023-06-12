import 'dart:convert';

BranchRaceModel branchRaceModelFromJson(String str) => BranchRaceModel.fromJson(json.decode(str));

String branchRaceModelToJson(BranchRaceModel data) => json.encode(data.toJson());

class BranchRaceModel {
  String? idTarget;
  String? typeTarget;
  String? nameTarget;
  String? yearTarget;
  String? valueTarget;
  String? fkRegion;

  BranchRaceModel({
    this.idTarget,
    this.typeTarget,
    this.nameTarget,
    this.yearTarget,
    this.valueTarget,
    this.fkRegion,
  });

  factory BranchRaceModel.fromJson(Map<String, dynamic> json) => BranchRaceModel(
    idTarget: json["id_target"],
    typeTarget: json["type_target"],
    nameTarget: json["name_target"],
    yearTarget: json["year_target"],
    valueTarget: json["value_target"],
    fkRegion: json["fk_region"],
  );

  Map<String, dynamic> toJson() => {
    "id_target": idTarget,
    "type_target": typeTarget,
    "name_target": nameTarget,
    "year_target": yearTarget,
    "value_target": valueTarget,
    "fk_region": fkRegion,
  };
}
