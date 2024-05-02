import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'recommended_client.freezed.dart';
part 'recommended_client.g.dart';

RecommendedClient recommendedClientFromJson(String str) => RecommendedClient.fromJson(json.decode(str));

String recommendedClientToJson(RecommendedClient data) => json.encode(data.toJson());

@freezed
class RecommendedClient with _$RecommendedClient {
  const factory RecommendedClient({
    @JsonKey(name: "fk_client")
    String? fkClient,
    @JsonKey(name: "name_enterprise")
    String? nameEnterprise,
  }) = _RecommendedClient;

  factory RecommendedClient.fromJson(Map<String, dynamic> json) => _$RecommendedClientFromJson(json);
}
