import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/finance/commission_for_collaborators/data/models/commission_collaborators_response.dart';
import 'package:crm_smart/features/finance/commission_for_collaborators/domain/use_cases/get_commission_collaborators_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'commission_collaborators_event.dart';

part 'commission_collaborators_state.dart';

@injectable
class CommissionCollaboratorsBloc extends Bloc<CommissionCollaboratorsEvent, CommissionCollaboratorsState> {
  final GetCommissionCollaboratorsUseCase _getCommissionCollaboratorsUseCase;

  CommissionCollaboratorsBloc(
    this._getCommissionCollaboratorsUseCase,
  ) : super(CommissionCollaboratorsState()) {
    on<GetCommissionCollaboratorsEvent>(_onGetCommissionCollaboratorsEvent,transformer: droppable());
  }

  FutureOr<void> _onGetCommissionCollaboratorsEvent(GetCommissionCollaboratorsEvent event, Emitter<CommissionCollaboratorsState> emit) async {
    if ((event.params?.page ?? 1) == 1) {
      emit(state.copyWith(commissionCollaboratorsResponse: BlocStatus.loading()));
    }

    final result = await _getCommissionCollaboratorsUseCase(event.params ?? CommissionCollaboratorsParams());
    result.fold(
      (l) => emit(state.copyWith(commissionCollaboratorsResponse: BlocStatus.fail(error: l))),
      (r) {
        emit(state.copyWith(hasReachedMax: r.invoiceModel?.isEmpty ?? true, totalCount: r.count));
        /// if the come form page not first page should add data that come to previous data
        if ((event.params?.page ?? 1) > 1) {
          emit(state.copyWith(
              commissionCollaboratorsResponse: BlocStatus.success(
                  data: r.copyWith(
                      invoiceModel: List.of(state.commissionCollaboratorsResponse.data?.invoiceModel ?? [])..addAll(r.invoiceModel ?? [])))));
        } else {
          emit(state.copyWith(commissionCollaboratorsResponse: BlocStatus.success(data: r)));
        }
        ///when get data success return the next page number to send it with coming next api call
        event.onSuccess?.call((event.params?.page ?? 1) + 1);
      },
    );
  }
}
