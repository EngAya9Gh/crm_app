import 'package:flutter/material.dart';

class SectionModel {
  final String title;
  final Widget page;
  final String path;
  final String? privilegeId;
  final IconData? icon;
  final List<SectionModel> subSections;

  const SectionModel({
    required this.title,
    required this.page,
    required this.path,
    this.privilegeId,
    this.icon,
    this.subSections = const [],
  });
}
