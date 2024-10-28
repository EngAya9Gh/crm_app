import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../clients_contacts/data/models/client_contact_model.dart';

part 'add_client_contact_event.dart';
part 'add_client_contact_state.dart';

@injectable
class AddClientContactBloc extends Bloc<AddClientContactEvent, AddClientContactState> {
  final AddClientContactUseCase _addClientContactUseCase;

  AddClientContactBloc(this._addClientContactUseCase) : super(AddClientContactState()) {
    on<AddClientContactSubmitEvent>(_onAddClientContactSubmitEvent);
  }

  FutureOr<void> _onAddClientContactSubmitEvent(
      AddClientContactSubmitEvent event,
      Emitter<AddClientContactState> emit,
      ) async {
    if (state.addClientContactStatus.isLoading()) return;

    emit(state.copyWith(addClientContactStatus: BlocStatus.loading()));

    try {
      final response = await _addClientContactUseCase(event.addContactParams);

      emit(state.copyWith(
        addClientContactStatus: BlocStatus.success(),
        contact: response.message,
      ));

      event.onSuccess?.call(response.message!);
    } catch (e) {
      emit(state.copyWith(
        addClientContactStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }
}