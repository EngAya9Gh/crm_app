import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_config.freezed.dart';

part 'update_config.g.dart';

enum PlatformUpdateVersion { android, ios }

@freezed
class UpdateConfig with _$UpdateConfig {
  const factory UpdateConfig({
    @JsonKey(name: "id_version") String? idVersion,
    @JsonKey(name: "name_version") String? nameVersion,
    @JsonKey(name: "link_version") String? linkVersion,
    @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson) PlatformUpdateVersion? typeVersion,
    @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson) bool? isRequired,
  }) = _UpdateConfig;

  factory UpdateConfig.fromJson(Map<String, dynamic> json) => _$UpdateConfigFromJson(json);

  const UpdateConfig._();

  static bool isRequiredFromJson(String? json) {
    return json == '1';
  }

  static PlatformUpdateVersion? typeVersionFromJson(String? json) {
    return PlatformUpdateVersion.values.firstWhereOrNull((element) => element.name == json?.toLowerCase());
  }
}
