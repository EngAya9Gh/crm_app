import 'package:flutter/material.dart';

import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../model/usermodel.dart';
import '../../data/models/ticket_category_model.dart';

class FilterTicketsEntity {
  FilterTicketsEntity();

  ValueNotifier<TicketTypesEnum> ticketTypeNotifier =
      ValueNotifier(TicketTypesEnum.open);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier<UserModel?>(null);
  ValueNotifier<TicketSourceEnum?> ticketSourceListNotifier =
      ValueNotifier<TicketSourceEnum?>(null);
  ValueNotifier<List<TicketCategoryModel>> ticketCategoryNotifier =
      ValueNotifier<List<TicketCategoryModel>>([]);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    dateFromController.clear();
    dateToController.clear();
  }

  FilterTicketsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterTicketsEntity()
      ..ticketTypeNotifier.value = this.ticketTypeNotifier.value
      ..userNotifier.value = this.userNotifier.value
      ..ticketSourceListNotifier.value = this.ticketSourceListNotifier.value
      ..ticketCategoryNotifier.value = this.ticketCategoryNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterTicketsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      ticketTypeNotifier,
      userNotifier,
      ticketSourceListNotifier,
      ticketCategoryNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return ticketTypeNotifier.value != TicketTypesEnum.open ||
        userNotifier.value != null ||
        ticketSourceListNotifier.value != null ||
        ticketCategoryNotifier.value.isNotEmpty ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
