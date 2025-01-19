import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/get_verified_invoice_usecase.dart';
import '../../domain/use_cases/verified_invoice_usecase.dart';

part 'verified_invoice_event.dart';

part 'verified_invoice_state.dart';

@injectable
class VerifiedInvoiceBloc extends Bloc<VerifiedInvoiceEvent, VerifiedInvoiceState> {
  final GetVerifiedInvoiceUseCase getVerifiedInvoiceUseCase;
  final VerifiedInvoiceUseCase verifiedInvoiceUseCase;

  VerifiedInvoiceBloc(
    this.getVerifiedInvoiceUseCase,
    this.verifiedInvoiceUseCase,
  ) : super(VerifiedInvoiceState()) {
    on<GetVerifiedInvoiceEvent>(_onHandleGetVerifiedInvoiceEvent);
    on<ChangeStatusVerifiedInvoiceEvent>(_onHandleChangeStatusVerifiedInvoiceEvent);
  }

  FutureOr<void> _onHandleGetVerifiedInvoiceEvent(GetVerifiedInvoiceEvent event, Emitter<VerifiedInvoiceState> emit) async {
    emit(state.copyWith(verifiedInvoiceList: BlocStatus.loading()));
    final result = await getVerifiedInvoiceUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(verifiedInvoiceList: BlocStatus.fail(error: l)),
      ),
      (r) => emit(state.copyWith(verifiedInvoiceList: BlocStatus.success(data: r))),
    );
  }

  FutureOr<void> _onHandleChangeStatusVerifiedInvoiceEvent(ChangeStatusVerifiedInvoiceEvent event, Emitter<VerifiedInvoiceState> emit) async {
    emit(state.copyWith(changeStatusInvoice: BlocStatus.loading()));
    final result = await verifiedInvoiceUseCase(VerifiedInvoiceParams(invoiceModel: event.invoiceModel));
    result.fold(
      (l) => emit(
        state.copyWith(changeStatusInvoice: BlocStatus.fail(error: l)),
      ),
      (r) => emit(state.copyWith(changeStatusInvoice: BlocStatus.success())),
    );
  }
}
