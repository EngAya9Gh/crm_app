import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../../domain/use_cases/transfer_ticket_usecase.dart';

part 'edit_ticket_state.dart';

@injectable
class EditTicketCubit extends Cubit<EditTicketState> {
  EditTicketCubit(
    this._editTicketTypeUseCase,
    this._transferTicketUseCase,
  ) : super(EditTicketInitial());

  final EditTicketTypeUseCase _editTicketTypeUseCase;
  final TransferTicketUseCase _transferTicketUseCase;

  Future<void> editTicketType(EditTicketTypeParams params) async {
    emit(EditTicketLoading());
    final result = await _editTicketTypeUseCase(params);
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(EditTicketError(error));
      },
      (ticket) => emit(EditTicketSuccess()),
    );
  }

  Future<void> transferTicket(TransferTicketParams params) async {
    emit(EditTicketLoading());
    final result = await _transferTicketUseCase(params);
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(EditTicketError(error));
      },
      (ticket) => emit(EditTicketSuccess()),
    );
  }
}
