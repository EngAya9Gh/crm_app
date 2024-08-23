import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/invoice_status_enum.dart';
import '../../../../../../core/common/models/location/branch_model.dart';

class FilterClientsTransferApprovalsEntity {
  FilterClientsTransferApprovalsEntity();

  ValueNotifier<BranchModel?> regionNotifier =
      ValueNotifier<BranchModel?>(null);
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

  FilterClientsTransferApprovalsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsTransferApprovalsEntity()
      ..regionNotifier.value = this.regionNotifier.value
      ..invoiceStateNotifier.value = this.invoiceStateNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterClientsTransferApprovalsEntity get returnToPreviousState {
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
