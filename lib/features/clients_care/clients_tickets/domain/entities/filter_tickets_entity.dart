import 'package:crm_smart/core/common/models/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/ticket_source_enum.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/enums/ticket_destination_enum.dart';
import '../../data/models/ticket_category_model.dart';

class FilterTicketsEntity {
  FilterTicketsEntity();

  ValueNotifier<TicketTypesEnum> ticketTypeNotifier =
      ValueNotifier(TicketTypesEnum.open);
  ValueNotifier<UserEntity?> userNotifier = ValueNotifier<UserEntity?>(null);
  ValueNotifier<List<TicketSourceEnum>> ticketSourceListNotifier =
      ValueNotifier<List<TicketSourceEnum>>([]);
  ValueNotifier<List<TicketCategoryModel>> ticketCategoryNotifier =
      ValueNotifier<List<TicketCategoryModel>>([]);
  ValueNotifier<TicketDestinationEnum?> ticketDestinationNotifier =
      ValueNotifier<TicketDestinationEnum?>(null);
  ValueNotifier<double> rateNotifier = ValueNotifier<double>(0);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    ticketTypeNotifier.value = TicketTypesEnum.open;
    userNotifier.value = null;
    ticketSourceListNotifier.value = [];
    ticketCategoryNotifier.value = [];
    ticketDestinationNotifier.value = null;
    rateNotifier.value = 0;
    dateFromController.text = '';
    dateToController.text = '';
  }

  FilterTicketsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterTicketsEntity()
      ..ticketTypeNotifier.value = this.ticketTypeNotifier.value
      ..userNotifier.value = this.userNotifier.value
      ..ticketSourceListNotifier.value = this.ticketSourceListNotifier.value
      ..ticketCategoryNotifier.value = this.ticketCategoryNotifier.value
      ..ticketDestinationNotifier.value = this.ticketDestinationNotifier.value
      ..rateNotifier.value = this.rateNotifier.value
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
      ticketDestinationNotifier,
      rateNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return ticketTypeNotifier.value != TicketTypesEnum.open ||
        userNotifier.value != null ||
        ticketSourceListNotifier.value.isNotEmpty ||
        ticketCategoryNotifier.value.isNotEmpty ||
        ticketDestinationNotifier.value != null ||
        rateNotifier.value != 0 ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }

  Map<String, dynamic> toJson() {
    return {
      'ticketType': ticketTypeNotifier.value.name,
      'userId': userNotifier.value?.id,
      'ticketSourceList':
          ticketSourceListNotifier.value.map((e) => e.name).toList(),
      'ticketCategoryList':
          ticketCategoryNotifier.value.map((e) => e.id).toList(),
      'ticketDestination': ticketDestinationNotifier.value,
      'rate': rateNotifier.value,
      'dateFrom': dateFromController.text,
      'dateTo': dateToController.text,
    };
  }
}
