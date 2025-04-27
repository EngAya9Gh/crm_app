import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/client/client_debt_type_enum.dart';
import '../../../../../../core/common/enums/invoice_status_enum.dart';
import '../../../../../../core/common/models/location/branch_model.dart';

class FilterClientsDebtsEntity {
  FilterClientsDebtsEntity();

  ValueNotifier<BranchModel?> regionNotifier =
      ValueNotifier<BranchModel?>(null);
  ValueNotifier<InvoiceStatusEnum?> invoiceStateNotifier =
      ValueNotifier<InvoiceStatusEnum?>(null);
  ValueNotifier<List<TypeOfInvoice?>> filterInvoiceType =
  ValueNotifier<List<TypeOfInvoice?>>([]);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    regionNotifier.value = null;
    invoiceStateNotifier.value = null;
    dateFromController.clear();
    dateToController.clear();
    filterInvoiceType.value = <TypeOfInvoice>[];
  }

  FilterClientsDebtsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsDebtsEntity()
      ..regionNotifier.value = this.regionNotifier.value
      ..invoiceStateNotifier.value = this.invoiceStateNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text
      ..filterInvoiceType.value = this.filterInvoiceType.value;
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
      filterInvoiceType
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return regionNotifier.value != null ||
        invoiceStateNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        filterInvoiceType.value.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
