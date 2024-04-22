import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/participate_enum.dart';
import '../../../../../../model/calendar/event_model.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../domain/use_cases/add_date_install_usecase.dart';
import '../../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../../domain/use_cases/set_date_done_usecase.dart';
import '../../../domain/use_cases/set_ready_install_usecase.dart';

part 'support_tab_state.dart';

@injectable
class SupportTabCubit extends Cubit<SupportTabState> {
  final GetInvoiceByClientUsecase _getInvoiceByClientUsecase;
  final AddDateInstallUsecase _addDateInstallUsecase;
  final SetDateDoneUsecase _setDateDoneUsecase;
  final SetReadyInstallUsecase _setReadyInstallUsecase;

  SupportTabCubit(
    this._getInvoiceByClientUsecase,
    this._addDateInstallUsecase,
    this._setDateDoneUsecase,
    this._setReadyInstallUsecase,
  ) : super(SupportTabInitial());

  List<InvoiceModel> listinvoiceClientSupport = [];
  List<InvoiceModel> listinvoiceClient = [];
  final listinvoices = [];

  /* Methods */

  Future<void> getClientInvoice({
    required GetInvoiceByClientParams getInvoiceByClientParams,
    required ParticipateEnum type,
  }) async {
    emit(SupportTabLoading());

    bool isParticipate = type == ParticipateEnum.participate;
    listinvoiceClientSupport = [];
    if (!isParticipate) {
      emit(SupportTabLoaded());
      return;
    }
    try {
      final result = await _getInvoiceByClientUsecase(getInvoiceByClientParams);
      result.fold((l) {
        emit(SupportTabError(l));
      }, (r) {
        listinvoiceClientSupport = r.where((element) {
          return element.fkIdClient == getInvoiceByClientParams.idClient &&
              element.isApprove != null;
        }).toList();
        emit(SupportTabLoaded());
      });
    } catch (e) {
      emit(SupportTabError(e.toString()));
    }
  }

  Future<void> addDateInstall(AddDateInstallParams addDateInstallParams) async {
    emit(SupportTabLoading());

    final result = await _addDateInstallUsecase(addDateInstallParams);

    result.fold((l) {
      emit(SupportTabError(l));
    }, (r) {
      emit(SupportTabLoaded());
    });

    emit(SupportTabLoaded());
  }

  updateListInvoiceAfterMarkEventIsDone(EventModel event) {
    emit(SupportTabLoading());
    final invoice = listinvoiceClientSupport.firstWhereOrNull((element) {
      return element.idInvoice == event.idinvoice;
    });

    if (invoice == null) {
      emit(SupportTabError('Invoice not found'));
      return;
    }

    List<DateInstallationClient> list = invoice.datesInstallationClient ?? [];
    list
        .map((date) => date.idClientsDate == event.idClientsDate
            ? date.copyWith(isDone: IsDoneDateEnum.done.index.toString())
            : date)
        .toList();

    invoice.datesInstallationClient = list;
    listinvoiceClientSupport = listinvoiceClientSupport
        .map((e) => e.idInvoice == invoice.idInvoice ? invoice : e)
        .toList();

    emit(SupportTabLoaded());
  }

  Future<bool> setDateDoneVm(
    SetDateDoneParams setDateDoneParams,
  ) async {
    try {
      emit(SupportTabLoading());

      int index = listinvoices.indexWhere(
          (element) => element.idInvoice == setDateDoneParams.id_invoice);
      int index1 = listinvoiceClientSupport.indexWhere(
          (element) => element.idInvoice == setDateDoneParams.id_invoice);
      InvoiceModel inv = await setDateDone(setDateDoneParams);
      if (index != -1) listinvoices[index] = inv;
      if (index1 != -1) listinvoiceClientSupport[index1] = inv;
      emit(SupportTabLoaded());
      return true;
    } catch (e) {
      emit(SupportTabError(e.toString()));
      return false;
    }
  }

  Future<void> set_ready_install(
      SetReadyInstallParams setReadyInstallParams) async {
    emit(SupportTabLoading());
    int index = listinvoices.indexWhere(
        (element) => element.idInvoice == setReadyInstallParams.id_invoice);
    int index1 = listinvoiceClientSupport.indexWhere(
        (element) => element.idInvoice == setReadyInstallParams.id_invoice);

    InvoiceModel inv = await setReady_install(setReadyInstallParams);
    if (index != -1) listinvoices[index] = inv;
    if (index1 != -1) listinvoiceClientSupport[index1] = inv;
    emit(SupportTabLoaded());
  }

  Future<List<InvoiceModel>> getinvoicebyclient(
    GetInvoiceByClientParams getInvoiceByClientParams,
  ) async {
    final result = await _getInvoiceByClientUsecase(getInvoiceByClientParams);
    return result.fold((l) {
      throw l;
    }, (r) {
      return r;
    });
  }

  Future<InvoiceModel> setDateDone(
    SetDateDoneParams setDateDoneParams,
  ) async {
    final result = await _setDateDoneUsecase(setDateDoneParams);
    return result.fold((l) {
      throw l;
    }, (r) {
      return r;
    });
  }

  Future<InvoiceModel> setReady_install(
    SetReadyInstallParams setReadyInstallParams,
  ) async {
    final result = await _setReadyInstallUsecase(setReadyInstallParams);
    return result.fold((l) {
      throw l;
    }, (r) {
      return r;
    });
  }
}
