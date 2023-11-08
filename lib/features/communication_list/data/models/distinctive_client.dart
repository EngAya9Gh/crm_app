import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'distinctive_client.freezed.dart';
part 'distinctive_client.g.dart';

DistinctiveClient distinctiveClientFromJson(String str) => DistinctiveClient.fromJson(json.decode(str));

String distinctiveClientToJson(DistinctiveClient data) => json.encode(data.toJson());

@freezed
class DistinctiveClient with _$DistinctiveClient {
  const factory DistinctiveClient({
    @JsonKey(name: "date_create")
    DateTime? dateCreate,
    @JsonKey(name: "fk_client")
    String? fkClient,
    @JsonKey(name: "name_enterprise")
    String? nameEnterprise,
    @JsonKey(name: "nameUser")
    String? nameUser,
    @JsonKey(name: "mobile")
    String? mobile,
    @JsonKey(name: "fk_regoin")
    String? fkRegoin,
    @JsonKey(name: "name_regoin")
    String? nameRegoin,
    @JsonKey(name: "name_client")
    String? nameClient,
  }) = _DistinctiveClient;

  factory DistinctiveClient.fromJson(Map<String, dynamic> json) => _$DistinctiveClientFromJson(json);
}
