import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../data/models/verified_client_model.dart';
import '../../domain/use_cases/get_verified_client_usecase.dart';
import '../../domain/use_cases/verified_client_usecase.dart';

part 'verified_client_event.dart';

part 'verified_client_state.dart';

@injectable
class VerifiedClientBloc extends Bloc<VerifiedClientEvent, VerifiedClientState> {
  final GetVerifiedClientUseCase _getVerifiedClientUseCase;
  final VerifiedClientUseCase _verifiedClientUseCase;

  VerifiedClientBloc(
    this._getVerifiedClientUseCase,
    this._verifiedClientUseCase,
  ) : super(VerifiedClientState()) {
    on<GetVerifiedClientEvent>(_onHandleGetVerifiedClientEvent);
    on<ChangeStatusVerifiedClientEvent>(_onHandleChangeStatusVerifiedClientEvent);
    on<ResetFilterEvent>(_onHandleResetFilterEvent);
  }

  FutureOr<void> _onHandleGetVerifiedClientEvent(GetVerifiedClientEvent event, Emitter<VerifiedClientState> emit) async {
    if (!event.addNewFilter) {
      emit(state.copyWith(verifiedClientList: BlocStatus.loading()));
    }
    emit(state.copyWith(getInvoicesByPrivilegesParams: () => event.getInvoicesByPrivilegesParams));
    final result = await _getVerifiedClientUseCase(event.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams());
    result.extract(

      (l,e) => emit(
        state.copyWith(verifiedClientList: BlocStatus.fail(error: e)),
      ),
      (r) {
        emit(state.copyWith(hasReachedMax: r.message?.isEmpty??true));
        if (event.addNewFilter) {
          emit(state.copyWith(verifiedClientList: BlocStatus.success(data: List.of(state.verifiedClientList.data ?? [])..addAll(r.message??[])),totalCount: r.count));
          return;
        }
        emit(state.copyWith(verifiedClientList: BlocStatus.success(data: r.message),totalCount: r.count));
      },
    );
  }

  FutureOr<void> _onHandleChangeStatusVerifiedClientEvent(ChangeStatusVerifiedClientEvent event, Emitter<VerifiedClientState> emit) async {
    emit(state.copyWith(changeStatusClient: BlocStatus.loading()));
    final result = await _verifiedClientUseCase(VerifiedClientParams(verifiedClientModel: event.clientModel));
    result.fold(
      (l) => emit(
        state.copyWith(changeStatusClient: BlocStatus.fail(error: l)),
      ),
      (r) => emit(state.copyWith(changeStatusClient: BlocStatus.success())),
    );
  }

  FutureOr<void> _onHandleResetFilterEvent(ResetFilterEvent event, Emitter<VerifiedClientState> emit) {
    emit(state.copyWith(getInvoicesByPrivilegesParams:() =>  GetInvoicesByPrivilegesParams()));
  }
}
