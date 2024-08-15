import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/invoice_status_enum.dart';
import '../../../../../../core/common/models/region_model.dart';

class FilterClientsDebtsEntity {
  FilterClientsDebtsEntity();

  ValueNotifier<RegionModel?> regionNotifier =
      ValueNotifier<RegionModel?>(null);
  ValueNotifier<InvoiceStatusEnum?> invoiceStateNotifier =
      ValueNotifier<InvoiceStatusEnum?>(null);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    regionNotifier.value = null;
    invoiceStateNotifier.value = null;
    dateFromController.clear();
    dateToController.clear();
  }

  FilterClientsDebtsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsDebtsEntity()
      ..regionNotifier.value = this.regionNotifier.value
      ..invoiceStateNotifier.value = this.invoiceStateNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterClientsDebtsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      regionNotifier,
      invoiceStateNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return regionNotifier.value != null ||
        invoiceStateNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
