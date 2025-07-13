import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../../../finance/clients_attachments/data/models/subscribed_clients_model.dart';
import '../../../domain/entities/tickets_page_variables_entity.dart';
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
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(AddTicketError(error));
      },
      (ticket) => emit(AddTicketSuccess()),
    );
  }


}
