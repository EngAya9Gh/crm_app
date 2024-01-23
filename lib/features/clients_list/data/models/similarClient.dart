import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';



SimilarClient similarClientFromJson(String str) => SimilarClient.fromJson(json.decode(str));

String similarClientToJson(SimilarClient data) =>
    json.encode(data.toJson());

@freezed
class SimilarClient with _$SimilarClient{
  const factory SimilarClient({
    @JsonKey(name: "phone")
    String? phone,
    @JsonKey(name: "date_create")
    String? date_create,
    @JsonKey(name: "id_clients")
    String? id_clients,
    @JsonKey(name: "name_client")
    String? name_client,
    @JsonKey(name: "name_enterprise")
    String? nameEnterprise,
  }) = _SimilarClient;

  factory SimilarClient.fromJson(Map<String, dynamic> json) => _$SimilarClientFromJson(json);
}
