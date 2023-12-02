import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_model.freezed.dart';
part 'level_model.g.dart';


@freezed
class LevelModel with _$LevelModel {
  const factory LevelModel({
    @JsonKey(name: "id_level")
    String? idLevel,
    @JsonKey(name: "name_level")
    String? nameLevel,
    @JsonKey(name: "periorty")
    String? periorty,
  }) = _LevelModel;

  factory LevelModel.fromJson(Map<String, dynamic> json) => _$LevelModelFromJson(json);
}
