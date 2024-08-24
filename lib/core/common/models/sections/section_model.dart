import 'package:flutter/material.dart';

class SectionModel {
  final String title;
  final Widget page;
  final String? privilegeId;
  final IconData? icon;

  const SectionModel({
    required this.title,
    required this.page,
    this.privilegeId,
    this.icon,
  });
}
