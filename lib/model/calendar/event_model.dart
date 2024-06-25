import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';

class EventModel extends Equatable {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final String typedate;
  final Color backgroundColor;
  final bool isAllDay;
  final String? fkIdClient;
  final String? idinvoice;
  final String? isDone;
  final String? idClientsDate;
  final String? agentName;
  final AgentDistributorModel? agent;
  final String? comment;
  final String? fkUser;
  final String? isDoneInstall;
  final String? nameCityClient;

  const EventModel({
    required this.fkIdClient,
    required this.idinvoice,
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    required this.typedate,
    this.backgroundColor = Colors.red,
    this.isAllDay = false,
    this.idClientsDate,
    this.isDone,
    this.agentName,
    this.agent,
    this.comment,
    this.fkUser,
    this.isDoneInstall,
    this.nameCityClient,
  });

  @override
  String toString() {
    return 'Event{title: $title, description: $description, from: $from, to: $to, backgroundColor: $backgroundColor, isAllDay: $isAllDay, fkIdClient: $fkIdClient, idinvoice: $idinvoice ,isDone: $isDone, idClientsDate: $idClientsDate, agentName: $agentName, agent: ${agent.toString()}, comment: $comment, typedate: $typedate, fkUser: $fkUser, isDoneInstall: $isDoneInstall, nameCityClient: $nameCityClient}';
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
  }) {
    return EventModel(
      title: title ?? this.title,
      description: description ?? this.description,
      from: from ?? this.from,
      to: to ?? this.to,
      typedate: typedate ?? this.typedate,
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
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        from,
        to,
        typedate,
        backgroundColor,
        isAllDay,
        fkIdClient,
        idinvoice,
        isDone,
        idClientsDate,
        agentName,
        agent,
        comment,
        fkUser,
        isDoneInstall,
        nameCityClient,
      ];
}
