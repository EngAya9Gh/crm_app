import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FavoriteScreenModel extends Equatable {
  final String id;
  final String title;
  final String iconKey;
  final String routeName;
  final String? privilegeId;
  final Map<String, dynamic>? extraParams;
  final Widget? page;

  FavoriteScreenModel({
    required this.id,
    required this.title,
    required this.iconKey,
    required this.routeName,
    this.privilegeId,
    this.extraParams,
    this.page,
  });

  FavoriteScreenModel copyWith({
    String? id,
    String? title,
    String? iconKey,
    String? routeName,
    String? privilegeId,
    Map<String, dynamic>? extraParams,
    Widget? page,
  }) {
    return FavoriteScreenModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iconKey: iconKey ?? this.iconKey,
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
      'iconKey': iconKey,
      'routeName': routeName,
      'privilegeId': privilegeId,
      'extraParams': extraParams,
      // page is ignored in toJson
    };
  }

  factory FavoriteScreenModel.fromJson(Map<String, dynamic> json) {
    return FavoriteScreenModel(
      id: json['id'] as String,
      title: json['title'] as String,
      iconKey: json['iconKey'] as String,
      routeName: json['routeName'] as String,
      privilegeId: json['privilegeId'] as String?,
      extraParams: json['extraParams'] as Map<String, dynamic>?,
      // page is ignored in fromJson
    );
  }

  IconData get icon => iconKeyToIconData(iconKey);

  static IconData iconKeyToIconData(String key) {
    switch (key) {
      case 'people':
        return Icons.people;
      case 'trending_up':
        return Icons.trending_up;
      case 'swap_horiz':
        return Icons.swap_horiz;
      case 'pending_actions':
        return Icons.pending_actions;
      case 'receipt_long':
        return Icons.receipt_long;
      case 'delete_sweep':
        return Icons.delete_sweep;
      case 'group_work':
        return Icons.group_work;
      case 'admin_panel_settings':
        return Icons.admin_panel_settings;
      case 'bar_chart':
        return Icons.bar_chart;
      case 'pie_chart':
        return Icons.pie_chart;
      case 'task_alt':
        return Icons.task_alt;
      case 'local_offer':
        return Icons.local_offer;
      case 'notifications':
        return Icons.notifications;
      case 'update':
        return Icons.update;
      case 'contacts':
        return Icons.contacts;
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'attach_money':
        return Icons.attach_money;
      case 'transfer_within_a_station':
        return Icons.transfer_within_a_station;
      case 'calendar_today':
        return Icons.calendar_today;
      case 'exit_to_app':
        return Icons.exit_to_app;
      case 'cancel':
        return Icons.cancel;
      case 'business':
        return Icons.business;
      case 'link':
        return Icons.link;
      case 'person_outline':
        return Icons.person_outline;
      case 'shopping_cart':
        return Icons.shopping_cart;
      case 'account_balance':
        return Icons.account_balance;
      case 'assessment':
        return Icons.assessment;
      case 'emoji_events':
        return Icons.emoji_events;
      case 'military_tech':
        return Icons.military_tech;
      case 'add_task':
        return Icons.add_task;
      case 'summarize':
        return Icons.summarize;
      case 'support_agent':
        return Icons.support_agent;
      case 'report':
        return Icons.report;
      case 'settings':
        return Icons.settings;
      default:
        return Icons.help;
    }
  }

  @override
  List<Object?> get props =>
      [id, title, iconKey, routeName, privilegeId, extraParams, page];
}
