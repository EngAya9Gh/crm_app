import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../domain/use_cases/add_level_usecase.dart';

part 'add_ticket_state.dart';

@injectable
class AddTicketCubit extends Cubit<AddTicketState> {
  AddTicketCubit(
    this._addTicketUseCase,
  ) : super(AddTicketInitial());

  final AddLevelUsecase _addTicketUseCase;

  Future<void> addTicket(AddLevelParams params) async {
    emit(AddTicketLoading());
    final result = await _addTicketUseCase(params);
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(AddTicketError(error));
      },
      (ticket) => emit(AddTicketSuccess()),
    );
  }
}
