import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;
  final String? fkIdClient;
  final String? idinvoice;
  final String? isDone;
  final String? idClientsDate;

  const Event({
    required this.fkIdClient,
    required this.idinvoice,
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = Colors.red,
    this.isAllDay = false,
    this.idClientsDate,
    this.isDone,
  });

  @override
  String toString() {
    return 'Event{title: $title, description: $description, from: $from, to: $to, backgroundColor: $backgroundColor, isAllDay: $isAllDay, fkIdClient: $fkIdClient, idinvoice: $idinvoice ,isDone: $isDone}';
  }

  Event copyWith({
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
  }) {
    return Event(
      title: title ?? this.title,
      description: description ?? this.description,
      from: from ?? this.from,
      to: to ?? this.to,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isAllDay: isAllDay ?? this.isAllDay,
      fkIdClient: fkIdClient ?? this.fkIdClient,
      idinvoice: idinvoice ?? this.idinvoice,
      isDone: isDone ?? this.isDone,
      idClientsDate: idClientsDate ?? this.idClientsDate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Event &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          from == other.from &&
          to == other.to &&
          backgroundColor == other.backgroundColor &&
          isAllDay == other.isAllDay &&
          fkIdClient == other.fkIdClient &&
          idinvoice == other.idinvoice &&
          isDone == other.isDone &&
          idClientsDate == other.idClientsDate;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      from.hashCode ^
      to.hashCode ^
      backgroundColor.hashCode ^
      isAllDay.hashCode ^
      fkIdClient.hashCode ^
      idinvoice.hashCode ^
      isDone.hashCode ^
      idClientsDate.hashCode;
}
