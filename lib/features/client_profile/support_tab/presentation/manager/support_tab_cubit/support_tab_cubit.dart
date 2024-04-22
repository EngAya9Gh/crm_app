import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

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
  ) : super(SupportTabState());

  List<InvoiceModel> listinvoiceClientSupport = [];
  List<InvoiceModel> listinvoiceClient = [];
  List<InvoiceModel> listinvoices = [];

  /* Methods */

  Future<void> getClientInvoice({
    required GetInvoiceByClientParams getInvoiceByClientParams,
    required ParticipateEnum type,
  }) async {
    emit(state.copyWith(getInvoiceByClientStatus: StateStatus.loading));

    bool isParticipate = type == ParticipateEnum.participate;
    listinvoiceClientSupport = [];
    if (!isParticipate) {
      emit(state.copyWith(getInvoiceByClientStatus: StateStatus.success));
      return;
    }
    try {
      final result = await _getInvoiceByClientUsecase(getInvoiceByClientParams);
      result.fold((l) {
        emit(state.copyWith(
          getInvoiceByClientStatus: StateStatus.failure,
          getInvoiceByClientMessage: l,
        ));
      }, (r) {
        listinvoiceClientSupport = r.where((element) {
          return element.fkIdClient == getInvoiceByClientParams.idClient &&
              element.isApprove != null;
        }).toList();
        emit(state.copyWith(getInvoiceByClientStatus: StateStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(
        getInvoiceByClientStatus: StateStatus.failure,
        getInvoiceByClientMessage: e.toString(),
      ));
    }
  }

  Future<void> addDateInstall(AddDateInstallParams addDateInstallParams) async {
    emit(state.copyWith(addDateInstallStatus: StateStatus.loading));

    final result = await _addDateInstallUsecase(addDateInstallParams);

    result.fold((l) {
      emit(state.copyWith(
        addDateInstallStatus: StateStatus.failure,
        addDateInstallMessage: l,
      ));
    }, (r) {
      emit(state.copyWith(addDateInstallStatus: StateStatus.success));
    });
  }

  updateListInvoiceAfterMarkEventIsDone(EventModel event) {
    emit(state.copyWith(setDateDoneStatus: StateStatus.loading));
    final invoice = listinvoiceClientSupport.firstWhereOrNull((element) {
      return element.idInvoice == event.idinvoice;
    });

    if (invoice == null) {
      emit(state.copyWith(
        setDateDoneStatus: StateStatus.failure,
        setDateDoneMessage: 'Invoice not found',
      ));
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

    emit(state.copyWith(setDateDoneStatus: StateStatus.success));
  }

  Future<bool> setDateDone(
    SetDateDoneParams setDateDoneParams,
  ) async {
    final result = await _setDateDoneUsecase(setDateDoneParams);
    return result.fold((l) {
      emit(state.copyWith(
        setDateDoneStatus: StateStatus.failure,
        setDateDoneMessage: l,
      ));
      return false;
    }, (r) {
      listinvoiceClientSupport = listinvoiceClientSupport
          .map((e) => e.idInvoice == r.idInvoice ? r : e)
          .toList();
      emit(state.copyWith(setDateDoneStatus: StateStatus.success));
      return true;
    });
  }

  Future<void> set_ready_install(
      SetReadyInstallParams setReadyInstallParams) async {
    emit(state.copyWith(setDateDoneStatus: StateStatus.loading));
    int index = listinvoices.indexWhere(
        (element) => element.idInvoice == setReadyInstallParams.id_invoice);
    int index1 = listinvoiceClientSupport.indexWhere(
        (element) => element.idInvoice == setReadyInstallParams.id_invoice);

    InvoiceModel inv = await setReady_install(setReadyInstallParams);
    if (index != -1) listinvoices[index] = inv;
    if (index1 != -1) listinvoiceClientSupport[index1] = inv;
    emit(state.copyWith(setDateDoneStatus: StateStatus.success));
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
