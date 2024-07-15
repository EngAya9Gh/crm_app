import 'package:equatable/equatable.dart';

class ConfigModel extends Equatable {
  const ConfigModel({
    required this.idConfig,
    required this.nameConfig,
    required this.valueConfig,
    required this.fkCountry,
    this.fkUserAdd,
    this.dateAdd,
    this.configType,
    this.configLevel,
    this.management,
  });

  final String idConfig;
  final String nameConfig;
  final String valueConfig;
  final String fkCountry;
  final String? fkUserAdd;
  final String? dateAdd;
  final String? configType;
  final String? configLevel;
  final String? management;

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      idConfig: json['id_config'].toString(),
      nameConfig: json['name_config'],
      valueConfig: json['value_config'],
      fkCountry: json['fk_country'].toString(),
      fkUserAdd:
          json['fk_user_add'] == null ? null : json['fk_user_add'].toString(),
      dateAdd: json['date_add'],
      configType: json['config_type'],
      configLevel:
          json['config_level'] == null ? null : json['config_level'].toString(),
      management: json['management'],
    );
  }

  ConfigModel copyWith({
    String? idConfig,
    String? nameConfig,
    String? valueConfig,
    String? fkCountry,
    String? fkUserAdd,
    String? dateAdd,
    String? configType,
    String? configLevel,
    String? management,
  }) {
    return ConfigModel(
      idConfig: idConfig ?? this.idConfig,
      nameConfig: nameConfig ?? this.nameConfig,
      valueConfig: valueConfig ?? this.valueConfig,
      fkCountry: fkCountry ?? this.fkCountry,
      fkUserAdd: fkUserAdd ?? this.fkUserAdd,
      dateAdd: dateAdd ?? this.dateAdd,
      configType: configType ?? this.configType,
      configLevel: configLevel ?? this.configLevel,
      management: management ?? this.management,
    );
  }

  @override
  List<Object?> get props {
    return [
      idConfig,
      nameConfig,
      valueConfig,
      fkCountry,
      fkUserAdd,
      dateAdd,
      configType,
      configLevel,
      management,
    ];
  }
}
