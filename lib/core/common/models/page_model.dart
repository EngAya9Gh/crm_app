import 'package:flutter/material.dart';

class PageModel {
  final Widget page;
  final String title;
  final String? image;

  const PageModel({
    required this.page,
    required this.title,
    this.image,
  });
}
