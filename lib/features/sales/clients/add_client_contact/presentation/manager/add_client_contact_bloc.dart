import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../clients_contacts/data/models/client_contact_model.dart';
import '../../domain/use_cases/update_client_contact_usecase.dart';

part 'add_client_contact_event.dart';
part 'add_client_contact_state.dart';

@injectable
class AddClientContactBloc extends Bloc<AddClientContactEvent, AddClientContactState> {
  final AddClientContactUseCase _addClientContactUseCase;
  final UpdateClientContactUseCase _updateClientContactUseCase;

  AddClientContactBloc(this._addClientContactUseCase,this._updateClientContactUseCase) : super(AddClientContactState()) {
    on<AddClientContactSubmitEvent>(_onAddClientContactSubmitEvent);
    on<SelectClientEvent>(_onSelectClientEvent); // Add
    on<UpdateContactRoleEvent>(_onUpdateContactRoleEvent); // Add this
    on<UpdateClientContactEvent>(_onUpdateClientContactSubmitEvent); // Add this
// this

  }

  FutureOr<void> _onAddClientContactSubmitEvent(
      AddClientContactSubmitEvent event,
      Emitter<AddClientContactState> emit,
      ) async {
    if (state.addClientContactStatus.isLoading()) return;

    emit(state.copyWith(addClientContactStatus: BlocStatus.loading()));

    try {
      final params = event.addContactParams.copyWith(
        clientId: state.selectedClient?.idClients ?? "",
        type: state.selectedRole.name
      );
      final response = await _addClientContactUseCase(params);

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
  FutureOr<void> _onUpdateClientContactSubmitEvent(
      UpdateClientContactEvent event,
      Emitter<AddClientContactState> emit,
      ) async {
    if (state.addClientContactStatus.isLoading()) return;

    emit(state.copyWith(addClientContactStatus: BlocStatus.loading()));

    try {
      final params = event.addContactParams.copyWith(
        clientId: state.selectedClient?.idClients ?? "",
        type: state.selectedRole.name
      );
      final response = await _updateClientContactUseCase(params);

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

  FutureOr<void> _onSelectClientEvent(
      SelectClientEvent event,
      Emitter<AddClientContactState> emit,
      ) {
    emit(state.copyWith(selectedClient: event.client));
  }

  FutureOr<void> _onUpdateContactRoleEvent(
      UpdateContactRoleEvent event,
      Emitter<AddClientContactState> emit,
      ) {
    emit(state.copyWith(selectedRole: event.role));
  }



}