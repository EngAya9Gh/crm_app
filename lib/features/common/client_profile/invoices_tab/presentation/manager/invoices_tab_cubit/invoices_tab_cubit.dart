import 'package:bloc/bloc.dart';
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
  ) : super(InvoicesTabInitial());

  final TextEditingController searchController = TextEditingController();
  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();

  GetInvoicesByPrivilegesParams getInvoicesParams =
      GetInvoicesByPrivilegesParams();
  final List<InvoiceModel> invoicesList = [];

  Future<void> getInvoicesByPrivileges({
    bool? isNewFilter = false,
  }) async {
    emit(InvoicesTabLoading());
    if (isNewFilter!) {
      invoicesList.clear();
    }

    final result = await _getInvoicesByPrivilegesUsecase(getInvoicesParams);
    result.fold((l) {
      emit(InvoicesTabError(l));
    }, (r) {
      invoicesList.addAll(r);
      emit(InvoicesTabLoaded());
    });
  }
}
