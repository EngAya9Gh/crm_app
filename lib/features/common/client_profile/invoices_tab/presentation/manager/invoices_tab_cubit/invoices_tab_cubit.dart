import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../model/invoiceModel.dart';
import '../../../domain/use_cases/get_invoices_by_privileges_usecase.dart';

part 'invoices_tab_state.dart';

@injectable
class InvoicesTabCubit extends Cubit<InvoicesTabState> {
  final GetInvoicesByPrivilegesUsecase _getInvoicesByPrivilegesUsecase;

  InvoicesTabCubit(
    this._getInvoicesByPrivilegesUsecase,
  ) : super(InvoicesTabState());

  final TextEditingController searchController = TextEditingController();
  DateTime dateFrom = DateTime(1, 1, 1);
  DateTime dateTo = DateTime(1, 1, 1);

  GetInvoicesByPrivilegesParams getInvoicesParams =
      GetInvoicesByPrivilegesParams();
  final List<InvoiceModel> invoicesList = [];

  bool hasReachedEnd = false;

  Future<void> getInvoicesByPrivileges({
    bool isNewFilter = true,
  }) async {
    if (isNewFilter) {
      invoicesList.clear();
      hasReachedEnd = false;
    }
    if (hasReachedEnd) return;
    emit(state.copyWith(getInvoicesStatus: StateStatus.loading));

    final result =
        await _getInvoicesByPrivilegesUsecase(getInvoicesParams.copyWith(
      skip: invoicesList.length,
      searchQuery: searchController.text,
    ));
    result.fold((l) {
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.failure,
        getInvoicesMessage: l,
      ));
    }, (r) {
      if (r.isEmpty) {
        hasReachedEnd = true;
      }
      invoicesList.addAll(r);
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.success,
      ));
    });
  }
}
