import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../../common/models/profile_invoice_model.dart';
import '../../../../../common/widgets/profile_comments_model.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../clients_list/data/models/clients_list_response.dart';
import '../../../../manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../../domain/use_cases/add_agent_comments_usecase.dart';
import '../../../domain/use_cases/get_agent_client_list_usecase.dart';
import '../../../domain/use_cases/get_agent_comments_list_usecase.dart';
import '../../../domain/use_cases/get_agent_invoice_list_usecase.dart';

part 'agents_distributors_profile_event.dart';
part 'agents_distributors_profile_state.dart';

class AgentsDistributorsProfileBloc extends Bloc<AgentsDistributorsProfileEvent,
    AgentsDistributorsProfileState> {
  final GetAgentClientListUsecase _getAgentClientListUsecase;
  final GetAgentInvoiceListUsecase _getAgentInvoiceListUsecase;
  final GetInvoiceByIdUsecase _getInvoiceByIdUsecase;
  final GetAgentCommentsListUsecase _getParticipateCommentListUsecase;
  final AddAgentCommentUsecase _addAgentCommentUsecase;

  AgentsDistributorsProfileBloc(
    this._getAgentClientListUsecase,
    this._getAgentInvoiceListUsecase,
    this._getInvoiceByIdUsecase,
    this._getParticipateCommentListUsecase,
    this._addAgentCommentUsecase,
  ) : super(AgentsDistributorsProfileState()) {
    on<GetAgentClientListEvent>(_onGetAgentClientListEvent);
    on<SearchClientEvent>(_onSearchClientEvent);
    on<GetAgentInvoiceListEvent>(_onGetAgentInvoiceListEvent);
    on<GetInvoiceByIdEvent>(_onGetInvoiceByIdEvent);
    on<SearchInvoiceEvent>(_onSearchInvoiceEvent);
    on<GetAgentCommentListEvent>(_onGetAgentCommentListEvent);
    on<AddAgentCommentEvent>(_onAddAgentCommentEvent);
  }

  List<ClientModel> _agentClientsList = [];
  List<ProfileInvoiceModel> _agentInvoicesList = [];

  void _onGetAgentClientListEvent(GetAgentClientListEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(
      clientsStatus: StateStatus.loading,
    ));
    final result =
        await _getAgentClientListUsecase.call(event.getAgentClientListParams);
    result.fold(
      (error) {
        emit(state.copyWith(
          clientsStatus: StateStatus.failure,
          clientsError: error,
        ));
      },
      (data) {
        _agentClientsList = data;
        emit(state.copyWith(
          clientsStatus: StateStatus.success,
          clientsList: _filterClientList(event.query),
        ));
      },
    );
  }

  void _onSearchClientEvent(
      SearchClientEvent event, Emitter<AgentsDistributorsProfileState> emit) {
    emit(state.copyWith(
      clientsStatus: StateStatus.success,
      clientsList: _filterClientList(event.query),
    ));
  }

  List<ClientModel> _filterClientList(String query) {
    return _agentClientsList
        .where((element) => element.nameClient!.toLowerCase().contains(query))
        .toList();
  }

  void _onGetAgentInvoiceListEvent(GetAgentInvoiceListEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(
      invoicesStatus: StateStatus.loading,
    ));
    final result =
        await _getAgentInvoiceListUsecase.call(event.getAgentInvoiceListParams);
    result.fold(
      (error) {
        emit(state.copyWith(
          invoicesStatus: StateStatus.failure,
          invoicesError: error,
        ));
      },
      (data) {
        _agentInvoicesList = data;
        emit(state.copyWith(
          invoicesStatus: StateStatus.success,
          invoicesList: _filterInvoiceList(event.query),
        ));
      },
    );
  }

  void _onSearchInvoiceEvent(
      SearchInvoiceEvent event, Emitter<AgentsDistributorsProfileState> emit) {
    emit(state.copyWith(
      invoicesStatus: StateStatus.success,
      invoicesList: _filterInvoiceList(event.query),
    ));
  }

  List<ProfileInvoiceModel> _filterInvoiceList(String query) {
    return _agentInvoicesList.where((element) {
      return element.idInvoice!.toString().contains(query) ||
          element.nameEnterprise!.toLowerCase().contains(query) ||
          element.nameUser!.toLowerCase().contains(query);
    }).toList();
  }

  void _onGetInvoiceByIdEvent(GetInvoiceByIdEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(
      dialogProgressState: StateStatus.loading,
    ));
    final result =
        await _getInvoiceByIdUsecase.call(event.getInvoiceByIdParams);

    result.fold(
      (exception, message) => emit(state.copyWith(
          invoicesError: message, dialogProgressState: StateStatus.failure)),
      (value) {
        emit(state.copyWith(
          currentInvoice: value.data,
          dialogProgressState: StateStatus.success,
        ));
        event.onSuccess?.call(value.data!);
      },
    );
  }

  void _onGetAgentCommentListEvent(GetAgentCommentListEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(
      commentsStatus: StateStatus.loading,
    ));

    final result = await _getParticipateCommentListUsecase
        .call(event.getAgentCommentListParams);

    result.fold(
      (error) {
        emit(state.copyWith(
          commentsStatus: StateStatus.failure,
          commentsError: error,
        ));
      },
      (data) {
        emit(state.copyWith(
          commentsStatus: StateStatus.success,
          commentsList: data,
        ));
      },
    );
  }

  void _onAddAgentCommentEvent(AddAgentCommentEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(
      addedCommentStatus: StateStatus.loading,
    ));

    final result =
        await _addAgentCommentUsecase.call(event.addAgentCommentParams);

    result.fold(
      (error) {
        emit(state.copyWith(
          addedCommentStatus: StateStatus.failure,
          addedCommentError: error,
        ));
      },
      (data) {
        emit(state.copyWith(
          addedCommentStatus: StateStatus.success,
        ));
        event.onSuccess?.call();
      },
    );
  }
}
