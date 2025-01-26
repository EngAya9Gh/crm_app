import 'package:flutter/material.dart';

import '../../../../../core/common/enums/client/client_debt_type_enum.dart';
import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/user_entity.dart';

class InvoicesSectionFilterEntity {
  InvoicesSectionFilterEntity();

  final ValueNotifier<SellerTypeEnum?> filterInvoicesSellerType = ValueNotifier(null);
  final ValueNotifier<UserEntity?> filterSelectedUser = ValueNotifier(null);
  final ValueNotifier<BranchModel?> filterSelectedRegion = ValueNotifier(null);
  final TextEditingController dateFromController = TextEditingController();
  final TextEditingController dateToController = TextEditingController();
  final ValueNotifier<ClientStatusEnum?> filterClientStatus = ValueNotifier(null);
  final ValueNotifier<List<TypeOfInvoice>> filterInvoiceType = ValueNotifier([]);
  final ValueNotifier<StatusOfInvoice?> filterInvoiceStatus = ValueNotifier(null);
  final ValueNotifier<DevicesStateFilterEnum?> filterDeviceState = ValueNotifier<DevicesStateFilterEnum?>(null);

  void clearFilters() {
    filterInvoicesSellerType.value = null;
    filterSelectedUser.value = null;
    filterSelectedRegion.value = null;
    dateFromController.clear();
    dateToController.clear();
    filterClientStatus.value = null;
    filterInvoiceType.value = [];
    filterInvoiceStatus.value = null;
    filterDeviceState.value = null;
  }

  InvoicesSectionFilterEntity? _previousState;

  void savePreviousState() {
    _previousState = InvoicesSectionFilterEntity()
      ..filterInvoicesSellerType.value = this.filterInvoicesSellerType.value
      ..filterSelectedUser.value = this.filterSelectedUser.value
      ..filterSelectedRegion.value = this.filterSelectedRegion.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text
      ..filterClientStatus.value = this.filterClientStatus.value
      ..filterInvoiceType.value = this.filterInvoiceType.value
      ..filterInvoiceStatus.value = this.filterInvoiceStatus.value
      ..filterDeviceState.value = this.filterDeviceState.value;
  }

  InvoicesSectionFilterEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!;
  }

  Iterable<Listenable?> listenables() {
    return [
      filterInvoicesSellerType,
      filterSelectedUser,
      filterSelectedRegion,
      dateFromController,
      dateToController,
      filterClientStatus,
      filterInvoiceType,
      filterInvoiceStatus,
      filterDeviceState,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty ||
        filterInvoicesSellerType.value != null ||
        filterSelectedUser.value != null ||
        filterSelectedRegion.value != null ||
        filterClientStatus.value != null ||
        filterInvoiceType.value != [] ||
        filterInvoiceStatus.value != null ||
        filterDeviceState.value != null;
  }
}
