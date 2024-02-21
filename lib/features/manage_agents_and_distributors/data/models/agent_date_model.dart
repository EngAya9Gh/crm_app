import 'package:equatable/equatable.dart';

import '../../../../common/enums/enums.dart';

class AgentDateModel extends Equatable {
  final String dateClientVisit;
  final String fkUser;
  final bool isDone;
  final String fkAgent;
  final InstallationTypeEnum typeDate;

  AgentDateModel({
    required this.dateClientVisit,
    required this.fkUser,
    required this.isDone,
    required this.fkAgent,
    required this.typeDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'date_client_visit': dateClientVisit,
      'fk_user': fkUser,
      'is_done': isDone ? "1" : "0",
      "fk_agent": fkAgent,
      "type_date": typeDate.name,
    };
  }

  factory AgentDateModel.fromMap(Map<String, dynamic> map) {
    return AgentDateModel(
      dateClientVisit: map['date_client_visit'],
      fkUser: map['fk_user'],
      isDone: map['is_done'] == "1",
      fkAgent: map['fk_agent'],
      typeDate: map['type_date'] == InstallationTypeEnum.field.name
          ? InstallationTypeEnum.field
          : InstallationTypeEnum.online,
    );
  }

  AgentDateModel copyWith({
    String? dateClientVisit,
    String? fkUser,
    bool? isDone,
    String? fkAgent,
    InstallationTypeEnum? typeDate,
  }) {
    return AgentDateModel(
      dateClientVisit: dateClientVisit ?? this.dateClientVisit,
      fkUser: fkUser ?? this.fkUser,
      isDone: isDone ?? this.isDone,
      fkAgent: fkAgent ?? this.fkAgent,
      typeDate: typeDate ?? this.typeDate,
    );
  }

  @override
  List<Object> get props {
    return [
      dateClientVisit,
      fkUser,
      isDone,
      fkAgent,
      typeDate,
    ];
  }
}
