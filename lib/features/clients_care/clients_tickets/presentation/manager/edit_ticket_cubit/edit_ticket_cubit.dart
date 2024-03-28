import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/edit_ticket_type_usecase.dart';

part 'edit_ticket_state.dart';

@injectable
class EditTicketCubit extends Cubit<EditTicketState> {
  EditTicketCubit(
    this._editTicketTypeUseCase,
  ) : super(EditTicketInitial());

  final EditTicketTypeUseCase _editTicketTypeUseCase;

  Future<void> editTicketType(EditTicketTypeParams params) async {
    emit(EditTicketLoading());
    final result = await _editTicketTypeUseCase(params);
    result.fold(
      (error) => emit(EditTicketError(error)),
      (ticket) => emit(EditTicketSuccess()),
    );
  }
}
