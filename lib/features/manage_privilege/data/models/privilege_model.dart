import 'package:freezed_annotation/freezed_annotation.dart';

part 'privilege_model.freezed.dart';

part 'privilege_model.g.dart';

@freezed
class PrivilegeModel with _$PrivilegeModel {
  const factory PrivilegeModel({
    @JsonKey(name: "id_privg_user") String? idPrivilegeUser,
    @JsonKey(name: "fk_level") String? fkLevel,
    @JsonKey(name: "fk_privileg") String? fkPrivilege,
    @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson) bool? isCheck,
    @JsonKey(name: "name_privilege") String? namePrivilege,
    @JsonKey(name: "type_prv") String? typePrv,
    @JsonKey(name: "periorty") String? priority,
  }) = _PrivilegeModel;

  factory PrivilegeModel.fromJson(Map<String, dynamic> json) => _$PrivilegeModelFromJson(json);

  const PrivilegeModel._();

  static bool isCheckFromJson(String isCheck) {
    return isCheck == '1';
  }
}
