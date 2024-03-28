import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/add_ticket_usecase.dart';

part 'add_ticket_state.dart';

@injectable
class AddTicketCubit extends Cubit<AddTicketState> {
  AddTicketCubit(
    this._addTicketUseCase,
  ) : super(AddTicketInitial());

  final AddTicketUseCase _addTicketUseCase;

  Future<void> addTicket(AddTicketParams params) async {
    emit(AddTicketLoading());
    final result = await _addTicketUseCase(params);
    result.fold(
      (error) => emit(AddTicketError(error)),
      (ticket) => emit(AddTicketSuccess()),
    );
  }
}
