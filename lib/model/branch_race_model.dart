import 'dart:convert';

BranchRaceModel branchRaceModelFromJson(String str) =>
    BranchRaceModel.fromJson(json.decode(str));

String branchRaceModelToJson(BranchRaceModel data) =>
    json.encode(data.toJson());

class BranchRaceModel {
  String? idTarget;
  String? typeTarget;
  String? nameTarget;
  String? yearTarget;
  String? valueTarget;
  String? fkRegion;
  String? name_regoin;
  String? imgRegoin;
  String? x;
  String? y;

  BranchRaceModel({
    this.idTarget,
    this.typeTarget,
    this.nameTarget,
    this.yearTarget,
    this.valueTarget,
    this.fkRegion,
    this.name_regoin,
    this.imgRegoin,
    this.x,
    this.y,
  });

  factory BranchRaceModel.fromJson(Map<String, dynamic> json) =>
      BranchRaceModel(
        idTarget:json["id_target"]==null?null: json["id_target"].toString(),
        typeTarget:json["type_target"]==null?null: json["type_target"].toString(),
        nameTarget: json["name_target"],
        yearTarget: json["year_target"],
        valueTarget: json["value_target"],
        fkRegion:json["fk_region"]==null?null: json["fk_region"].toString(),
        imgRegoin: json["img_regoin"],
        name_regoin: json["name_regoin"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "id_target": idTarget,
        "type_target": typeTarget,
        "name_target": nameTarget,
        "year_target": yearTarget,
        "value_target": valueTarget,
        "fk_region": fkRegion,
        "img_regoin": imgRegoin,
      };
}
