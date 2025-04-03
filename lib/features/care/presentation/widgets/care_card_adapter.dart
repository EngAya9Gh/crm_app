import 'package:flutter/material.dart';
import 'package:crm_smart/features/care/presentation/widgets/care_card_new.dart';

class CareCardAdapter {
  static CareCardNew fromCommunicationData({
    required Map<String, dynamic> data,
    required bool isExpanded,
    required VoidCallback? onTap,
    required VoidCallback? onEdit,
    required VoidCallback? onDelete,
    required Widget? actionButtons,
    bool showActions = true,
  }) {
    return CareCardNew(
      title: data['name_enterprise'],
      description: data['description'],
      type: data['type_communication'],
      status: data['statecustomer'],
      date: DateTime.tryParse(data['date_communication'] ?? ''),
      userName: data['nameUser'],
      userRole: data['name_city'],
      onTap: onTap,
      onEdit: onEdit,
      onDelete: onDelete,
      isExpanded: isExpanded,
      actionButtons: actionButtons,
      showActions: showActions,
    );
  }
}
