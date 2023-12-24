// To parse this JSON data, do
//
//     final userRegionDepartment = userRegionDepartmentFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_region_department.freezed.dart';
part 'user_region_department.g.dart';

UserRegionDepartment userRegionDepartmentFromJson(String str) => UserRegionDepartment.fromJson(json.decode(str));

String userRegionDepartmentToJson(UserRegionDepartment data) => json.encode(data.toJson());

@freezed
class UserRegionDepartment with _$UserRegionDepartment {
  const factory UserRegionDepartment({
    @JsonKey(name: "id_user")
    int? idUser,
    @JsonKey(name: "type_administration")
    String? typeAdministration,
    @JsonKey(name: "fk_regoin")
    int? fkRegoin,
    @JsonKey(name: "nameUser")
    String? nameUser,
    @JsonKey(name: "managements")
    Managements? managements,
    @JsonKey(name: "regions")
    Regions? regions,
  }) = _UserRegionDepartment;

  factory UserRegionDepartment.fromJson(Map<String, dynamic> json) => _$UserRegionDepartmentFromJson(json);
}

@freezed
class Managements with _$Managements {
  const factory Managements({
    @JsonKey(name: "idmange")
    int? idmange,
    @JsonKey(name: "name_mange")
    String? nameMange,
  }) = _Managements;

  factory Managements.fromJson(Map<String, dynamic> json) => _$ManagementsFromJson(json);
}

@freezed
class Regions with _$Regions {
  const factory Regions({
    @JsonKey(name: "name_regoin")
    String? nameRegoin,
    @JsonKey(name: "id_regoin")
    int? idRegoin,
  }) = _Regions;

  factory Regions.fromJson(Map<String, dynamic> json) => _$RegionsFromJson(json);
}
