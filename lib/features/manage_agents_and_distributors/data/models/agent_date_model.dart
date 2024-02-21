import 'package:equatable/equatable.dart';

import '../../../../common/enums/enums.dart';

class AgentDateModel extends Equatable {
  final String? id;
  final String dateClientVisit;
  final String fkUser;
  final String isDone;
  final String fkAgent;
  final InstallationTypeEnum typeDate;

  AgentDateModel({
    this.id,
    required this.dateClientVisit,
    required this.fkUser,
    required this.isDone,
    required this.fkAgent,
    required this.typeDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'idclients_date': id,
      'date_client_visit': dateClientVisit,
      'fk_user': fkUser,
      'is_done': isDone,
      "fk_agent": fkAgent,
      "type_date": typeDate.name,
    };
  }

  factory AgentDateModel.fromMap(Map<String, dynamic> map) {
    return AgentDateModel(
      id: map['idclients_date'].toString(),
      dateClientVisit: map['date_client_visit'],
      fkUser: map['fk_user'].toString(),
      isDone: map['is_done'].toString(),
      fkAgent: map['fk_agent'].toString(),
      typeDate: map['type_date'] == InstallationTypeEnum.field.name
          ? InstallationTypeEnum.field
          : InstallationTypeEnum.online,
    );
  }

  AgentDateModel copyWith({
    String? id,
    String? dateClientVisit,
    String? fkUser,
    String? isDone,
    String? fkAgent,
    InstallationTypeEnum? typeDate,
  }) {
    return AgentDateModel(
      id: id ?? this.id,
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
