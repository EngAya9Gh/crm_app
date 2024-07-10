import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';

class EventModel extends Equatable {
  final String? idClientsDate;
  final DateTime from;
  final DateTime to;
  final String? fkUser;
  final String? isDone;
  final String? fkClient;
  final String? fkInvoice;
  final String typeDate;
  final String? processReason;
  final String? userIdProcess;
  final String? fkAgent;
  final String? type_agent;
  final String? nameEnterprise;
  final String? nameAgent;
  final String? nameCity;
  final String? nameUserAdd;
  final String? nameUserUpdate;
  final String? nameUserClose;
  final AgentDistributorModel? agent;
  final String? isDoneInstall;
  final String? nameCityClient;
  final String title;
  final String description;
  final Color backgroundColor;
  final bool isAllDay;
  final String? fkIdClient;
  final String? idinvoice;
  final String? agentName;
  final String? comment;

  const EventModel({
    this.idClientsDate,
    required this.from,
    required this.to,
    this.fkUser,
    this.isDone,
    this.fkClient,
    this.fkInvoice,
    required this.typeDate,
    this.processReason,
    this.userIdProcess,
    this.fkAgent,
    this.type_agent,
    this.nameEnterprise,
    this.nameAgent,
    this.nameCity,
    this.nameUserAdd,
    this.nameUserUpdate,
    this.nameUserClose,
    this.agent,
    this.isDoneInstall,
    this.nameCityClient,
    required this.title,
    required this.description,
    this.backgroundColor = Colors.red,
    this.isAllDay = false,
    this.fkIdClient,
    this.idinvoice,
    this.agentName,
    this.comment,
  });

  factory EventModel.fromJson(Map<String, dynamic> map) {
    final AgentDistributorModel? agent = map['agent'] == null
        ? null
        : AgentDistributorModel.fromJson(map['agent']);
    final first = DateTime.parse(map['date_client_visit']);
    return EventModel(
      idClientsDate: map['idclients_date'],
      from: first,
      to: map['date_end'] != null
          ? DateTime.parse(map['date_end'])
          : first.add(Duration(hours: 2)),
      fkUser: map['fk_user'].toString(),
      isDone: map['is_done'].toString(),
      fkClient: map['fk_client'],
      fkInvoice: map['fk_invoice'],
      typeDate: map['type_date'].toString(),
      processReason: map['processReason'],
      userIdProcess: map['user_id_process'].toString(),
      fkAgent: map['fk_agent'].toString(),
      type_agent: map['type_agent'].toString(),
      nameEnterprise: map['name_enterprise'],
      nameAgent: map['name_agent'],
      nameCity: map['name_city'],
      nameUserAdd: map['nameUserAdd'],
      nameUserUpdate: map['nameUserUpdate'],
      nameUserClose: map['nameUserClose'],
      isDoneInstall: map['isdoneinstall'],
      agent: agent,
      nameCityClient: map['name_city_client'],
      title: map['name_enterprise'] == null
          ? (map['name_agent'].toString() +
              (map['type_agent'].toString() == '1' ? ' وكيل ' : ' موزع '))
          : map['name_enterprise'].toString(),
      description: 'description',
    );
  }

  @override
  String toString() {
    return 'Event{title: $title, description: $description, from: $from, to: $to, backgroundColor: $backgroundColor, isAllDay: $isAllDay, fkIdClient: $fkIdClient, idinvoice: $idinvoice, isDone: $isDone, idClientsDate: $idClientsDate, agentName: $agentName, agent: ${agent.toString()}, comment: $comment, typedate: $typeDate, fkUser: $fkUser, isDoneInstall: $isDoneInstall, nameCityClient: $nameCityClient, nameUserAdd: $nameUserAdd, nameUserUpdate: $nameUserUpdate, nameUserClose: $nameUserClose}';
  }

  EventModel copyWith({
    String? title,
    String? description,
    DateTime? from,
    DateTime? to,
    Color? backgroundColor,
    bool? isAllDay,
    String? fkIdClient,
    String? idinvoice,
    String? isDone,
    String? idClientsDate,
    String? agentName,
    AgentDistributorModel? agent,
    String? typedate,
    String? comment,
    String? fkUser,
    String? isDoneInstall,
    String? nameCityClient,
    String? nameUserAdd,
    String? nameUserUpdate,
    String? nameUserClose,
  }) {
    return EventModel(
      title: title ?? this.title,
      description: description ?? this.description,
      from: from ?? this.from,
      to: to ?? this.to,
      typeDate: typedate ?? this.typeDate,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isAllDay: isAllDay ?? this.isAllDay,
      fkIdClient: fkIdClient ?? this.fkIdClient,
      idinvoice: idinvoice ?? this.idinvoice,
      isDone: isDone ?? this.isDone,
      idClientsDate: idClientsDate ?? this.idClientsDate,
      agentName: agentName ?? this.agentName,
      agent: agent ?? this.agent,
      comment: comment ?? this.comment,
      fkUser: fkUser ?? this.fkUser,
      isDoneInstall: isDoneInstall ?? this.isDoneInstall,
      nameCityClient: nameCityClient ?? this.nameCityClient,
      nameUserAdd: nameUserAdd ?? this.nameUserAdd,
      nameUserUpdate: nameUserUpdate ?? this.nameUserUpdate,
      nameUserClose: nameUserClose ?? this.nameUserClose,
    );
  }

  @override
  List<Object?> get props => [
        idClientsDate,
        from,
        to,
        fkUser,
        isDone,
        fkClient,
        fkInvoice,
        typeDate,
        processReason,
        userIdProcess,
        fkAgent,
        type_agent,
        nameEnterprise,
        nameAgent,
        nameCity,
        nameUserAdd,
        nameUserUpdate,
        nameUserClose,
        agent,
        isDoneInstall,
        nameCityClient,
        title,
        description,
        backgroundColor,
        isAllDay,
        fkIdClient,
        idinvoice,
        agentName,
        comment,
      ];
}
