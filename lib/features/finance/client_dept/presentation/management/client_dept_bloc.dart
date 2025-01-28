import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../data/models/client_dept.dart';
import '../../domain/use_cases/get_client_dept_usecase.dart';
import '../../domain/use_cases/report_client_dept_usecase.dart';

part 'client_dept_event.dart';

part 'client_dept_state.dart';

@injectable
class ClientDeptBloc extends Bloc<ClientDeptEvent, ClientDeptState> {
  final GetClientDeptUseCase _getClientDeptUseCase;
  final ReportClientDeptUseCase _reportClientDeptUseCase;

  ClientDeptBloc(
    this._getClientDeptUseCase,
    this._reportClientDeptUseCase,
  ) : super(ClientDeptState()) {
    on<GetClientDeptEvents>(_onHandleGetClientDeptEvents,transformer: droppable());
    on<ReportPayoutClientDeptEvents>(_onHandleReportPayoutClientDeptEvents);
    on<ResetFilterEvent>(_onHandleResetFilterEvent);

  }

  FutureOr<void> _onHandleGetClientDeptEvents(GetClientDeptEvents event, Emitter<ClientDeptState> emit) async {
    if (event.addNewFilter) {
      emit(state.copyWith(getClientDeptList: BlocStatus.loading()));
    }
    emit(state.copyWith(getInvoicesByPrivilegesParams: () => event.getInvoicesByPrivilegesParams));
    final result = await _getClientDeptUseCase(event.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams());
    result.extract(

          (l,e) => emit(
        state.copyWith(getClientDeptList: BlocStatus.fail(error: e)),
      ),
          (r) {
        emit(state.copyWith(hasReachedMax: r.message?.isEmpty??true));
        if (!event.addNewFilter) {
          emit(state.copyWith(getClientDeptList: BlocStatus.success(data: List.of(state.getClientDeptList.data ?? [])..addAll(r.message??[])),totalCount: r.count));
          return;
        }
        emit(state.copyWith(getClientDeptList: BlocStatus.success(data: r.message),totalCount: r.count));
      },
    );
  }

  FutureOr<void> _onHandleReportPayoutClientDeptEvents(ReportPayoutClientDeptEvents event, Emitter<ClientDeptState> emit) async {
    emit(state.copyWith(reportPayoutClientStatus: BlocStatus.loading()));
    final resutl = await _reportClientDeptUseCase(event.params);
    resutl.extract(
      (exception, message) => emit(
        state.copyWith(reportPayoutClientStatus: BlocStatus.fail(error: message)),
      ),
      (value) {
        emit(
        state.copyWith(reportPayoutClientStatus: BlocStatus.success()),
      );
        event.onSuccess?.call();
      },
    );
  }
  FutureOr<void> _onHandleResetFilterEvent(ResetFilterEvent event, Emitter<ClientDeptState> emit) {
    emit(state.copyWith(getInvoicesByPrivilegesParams:() =>  GetInvoicesByPrivilegesParams()));
  }

}
