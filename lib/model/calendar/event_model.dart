import 'package:flutter/material.dart';

import '../agent_distributor_model.dart';

class EventModel {
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
  });

  @override
  String toString() {
    return 'Event{title: $title, description: $description, from: $from, to: $to, backgroundColor: $backgroundColor, isAllDay: $isAllDay, fkIdClient: $fkIdClient, idinvoice: $idinvoice ,isDone: $isDone, idClientsDate: $idClientsDate, agentName: $agentName, agent: ${agent.toString()}, comment: $comment, typedate: $typedate, fkUser: $fkUser}';
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
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          from == other.from &&
          to == other.to &&
          typedate == other.typedate &&
          backgroundColor == other.backgroundColor &&
          isAllDay == other.isAllDay &&
          fkIdClient == other.fkIdClient &&
          idinvoice == other.idinvoice &&
          isDone == other.isDone &&
          idClientsDate == other.idClientsDate &&
          agentName == other.agentName &&
          agent == other.agent &&
          comment == other.comment &&
          fkUser == other.fkUser;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      from.hashCode ^
      to.hashCode ^
      typedate.hashCode ^
      backgroundColor.hashCode ^
      isAllDay.hashCode ^
      fkIdClient.hashCode ^
      idinvoice.hashCode ^
      isDone.hashCode ^
      idClientsDate.hashCode ^
      agentName.hashCode ^
      agent.hashCode ^
      comment.hashCode ^
      fkUser.hashCode;
}
