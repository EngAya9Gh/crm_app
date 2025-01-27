import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
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
    on<GetClientDeptEvents>(_onHandleGetClientDeptEvents);
    on<ReportPayoutClientDeptEvents>(_onHandleReportPayoutClientDeptEvents);
  }

  FutureOr<void> _onHandleGetClientDeptEvents(GetClientDeptEvents event, Emitter<ClientDeptState> emit) async {
    emit(state.copyWith(getClientDeptList: BlocStatus.loading()));
    final resutl = await _getClientDeptUseCase();
    resutl.extract(
      (exception, message) => emit(
        state.copyWith(getClientDeptList: BlocStatus.fail(error: message)),
      ),
      (value) => emit(
        state.copyWith(getClientDeptList: BlocStatus.success(data: value.message), totalCount: value.count),
      ),
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
}
