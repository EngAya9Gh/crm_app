import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../helpers/api_helper.dart';

class EventModel extends Equatable {
  final String? idClientsDate;
  final DateTime from;
  final DateTime to;
  final String? fkUser;
  final String? isDone;
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
  final String? dateCreate;
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
    this.dateCreate,
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
    final first = _handleDateFrom(map);

    return EventModel(
      idClientsDate: ApiHelper.handleString(map['idclients_date']),
      from: first,
      to: _handleDateTo(map, first),
      fkUser: ApiHelper.handleString(map['fk_user']),
      isDone: ApiHelper.handleString(map['is_done']),
      fkIdClient: ApiHelper.handleString(map['fk_client']),
      fkInvoice: ApiHelper.handleString(map['fk_invoice']),
      typeDate: ApiHelper.handleString(map['type_date']) ?? '',
      processReason: ApiHelper.handleString(map['processReason']),
      userIdProcess: ApiHelper.handleString(map['user_id_process']),
      fkAgent: ApiHelper.handleString(map['fk_agent']),
      type_agent: ApiHelper.handleString(map['type_agent']),
      nameEnterprise: ApiHelper.handleString(map['name_enterprise']),
      nameAgent: ApiHelper.handleString(map['name_agent']),
      nameCity: ApiHelper.handleString(map['name_city']),
      nameUserAdd: ApiHelper.handleString(map['nameUserAdd']),
      dateCreate: ApiHelper.handleString(map['date_create']),
      nameUserUpdate: ApiHelper.handleString(map['nameUserUpdate']),
      nameUserClose: ApiHelper.handleString(map['nameUserClose']),
      isDoneInstall: ApiHelper.handleString(map['isdoneinstall']),
      agent: _handleAgentModel(map),
      nameCityClient: ApiHelper.handleString(map['name_city_client']),
      title: ApiHelper.handleString(map['name_enterprise']) ??
          "${ApiHelper.handleString(map['name_agent'])} ${ApiHelper.handleString(map['type_agent']) == '1' ? 'وكيل' : 'موزع'}",
      description: 'description',
    );
  }

  static AgentDistributorModel? _handleAgentModel(Map<String, dynamic> map) {
    return map['agent'] == null
        ? null
        : AgentDistributorModel.fromJson(map['agent']);
  }

  static DateTime _handleDateFrom(Map<String, dynamic> map) {
    return DateTime.tryParse(
            ApiHelper.handleString(map['date_client_visit']) ?? '') ??
        DateTime.now();
  }

  static DateTime _handleDateTo(Map<String, dynamic> map, DateTime first) {
    return map['date_end'] != null
        ? DateTime.tryParse(ApiHelper.handleString(map['date_end']) ?? '') ??
            first.add(Duration(hours: 2))
        : first.add(Duration(hours: 2));
  }

  bool searchString(String query) {
    String searchIn = "$title $description";
    if (nameEnterprise != null) searchIn += " $nameEnterprise";
    if (nameAgent != null) searchIn += " $nameAgent";

    return searchIn.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return 'Event{title: $title, description: $description, from: $from, to: $to, backgroundColor: $backgroundColor, isAllDay: $isAllDay, fkIdClient: $fkIdClient, idinvoice: $idinvoice, isDone: $isDone, idClientsDate: $idClientsDate, agentName: $agentName, agent: ${agent.toString()}, comment: $comment, typedate: $typeDate, fkUser: $fkUser, isDoneInstall: $isDoneInstall, nameCityClient: $nameCityClient, nameUserAdd: $nameUserAdd, nameUserUpdate: $nameUserUpdate, nameUserClose: $nameUserClose, fkClient: $fkIdClient, fkInvoice: $fkInvoice, typeDate: $typeDate, processReason: $processReason, userIdProcess: $userIdProcess, fkAgent: $fkAgent, type_agent: $type_agent, nameEnterprise: $nameEnterprise, nameAgent: $nameAgent, nameCity: $nameCity}';
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
    String? dateCreate,
    String? nameUserUpdate,
    String? nameUserClose,
    String? fkClient,
    String? fkInvoice,
    String? typeDate,
    String? processReason,
    String? userIdProcess,
    String? fkAgent,
    String? type_agent,
    String? nameEnterprise,
    String? nameAgent,
    String? nameCity,
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
      dateCreate: dateCreate ?? this.dateCreate,
      nameUserUpdate: nameUserUpdate ?? this.nameUserUpdate,
      nameUserClose: nameUserClose ?? this.nameUserClose,
      fkInvoice: fkInvoice ?? this.fkInvoice,
      processReason: processReason ?? this.processReason,
      userIdProcess: userIdProcess ?? this.userIdProcess,
      fkAgent: fkAgent ?? this.fkAgent,
      type_agent: type_agent ?? this.type_agent,
      nameEnterprise: nameEnterprise ?? this.nameEnterprise,
      nameAgent: nameAgent ?? this.nameAgent,
      nameCity: nameCity ?? this.nameCity,
    );
  }

  @override
  List<Object?> get props {
    return [
      idClientsDate,
      from,
      to,
      fkUser,
      isDone,
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
      dateCreate,
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
}
