import 'package:crm_smart/core/common/models/location/city_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:flutter/material.dart';

import '../../data/models/violation_type_model.dart';

class FilterViolationsEntity {
  FilterViolationsEntity();

  TextEditingController searchController = TextEditingController();
  ValueNotifier<String?> userId = ValueNotifier<String?>(null);
  ValueNotifier<ManagementModel?> management = ValueNotifier<ManagementModel?>(null);
  ValueNotifier<ViolationType?> violationType = ValueNotifier<ViolationType?>(null);

  void clearFilters() {
    userId.value = null;
    management.value = null;
    violationType.value = null;
    searchController = TextEditingController();
  }

  Iterable<Listenable?> listenables() {
    return [
      userId,
      violationType,
      management,
    ];
  }
  bool checkIfFilterIsNotEmpty() {
    return management.value != null || violationType.value != null|| userId.value != null;
  }
}
