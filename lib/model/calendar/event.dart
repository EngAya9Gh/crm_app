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
  const Event(
      {
      required this.fkIdClient,
      required this.idinvoice,
      required this.title,
      required this.description,
      required this.from,
      required this.to,
      this.backgroundColor = Colors.red,
      this.isAllDay = false});
}
