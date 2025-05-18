import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FavoriteScreenModel extends Equatable {
  final String id;
  final String title;
  final IconData icon;
  final String routeName;
  final String? privilegeId;
  final Map<String, dynamic>? extraParams;
  final Widget? page;

  const FavoriteScreenModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.routeName,
    this.privilegeId,
    this.extraParams,
    this.page,
  });

  FavoriteScreenModel copyWith({
    String? id,
    String? title,
    IconData? icon,
    String? routeName,
    String? privilegeId,
    Map<String, dynamic>? extraParams,
    Widget? page,
  }) {
    return FavoriteScreenModel(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      routeName: routeName ?? this.routeName,
      privilegeId: privilegeId ?? this.privilegeId,
      extraParams: extraParams ?? this.extraParams,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'iconCode': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
      'routeName': routeName,
      'privilegeId': privilegeId,
      'extraParams': extraParams,
      // Note: we can't serialize Widget in JSON, so page is ignored in toJson
    };
  }

  factory FavoriteScreenModel.fromJson(Map<String, dynamic> json) {
    return FavoriteScreenModel(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: IconData(
        json['iconCode'] as int,
        fontFamily: json['iconFontFamily'] as String?,
      ),
      routeName: json['routeName'] as String,
      privilegeId: json['privilegeId'] as String?,
      extraParams: json['extraParams'] as Map<String, dynamic>?,
      // Note: page can't be serialized, so it's null when deserializing from JSON
    );
  }

  @override
  List<Object?> get props =>
      [id, title, icon, routeName, privilegeId, extraParams, page];
}
