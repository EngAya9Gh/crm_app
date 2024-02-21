import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/models/agent_date_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../../common/models/profile_invoice_model.dart';
import '../../../../../common/widgets/profile_comments_model.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../clients_list/data/models/clients_list_response.dart';
import '../../../../manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../../domain/use_cases/add_agent_comments_usecase.dart';
import '../../../domain/use_cases/add_agent_date_usecase.dart';
import '../../../domain/use_cases/get_agent_client_list_usecase.dart';
import '../../../domain/use_cases/get_agent_comments_list_usecase.dart';
import '../../../domain/use_cases/get_agent_dates_list_usecase.dart';
import '../../../domain/use_cases/get_agent_invoice_list_usecase.dart';

part 'agents_distributors_profile_event.dart';

part 'agents_distributors_profile_state.dart';

class AgentsDistributorsProfileBloc extends Bloc<AgentsDistributorsProfileEvent,
    AgentsDistributorsProfileState> {
  List<AgentDateModel> agentDatesList = [];
  final GetAgentClientListUsecase _getAgentClientListUsecase;
  final GetAgentInvoiceListUsecase _getAgentInvoiceListUsecase;
  final GetInvoiceByIdUsecase _getInvoiceByIdUsecase;
  final GetAgentCommentsListUsecase _getParticipateCommentListUsecase;
  final AddAgentCommentUsecase _addAgentCommentUsecase;
  final AddAgentDateUseCase _addAgentDateUseCase;
  final GetAgentDatesListUsecase _getAgentDatesListUsecase;

  AgentsDistributorsProfileBloc(
    this._getAgentClientListUsecase,
    this._getAgentInvoiceListUsecase,
    this._getInvoiceByIdUsecase,
    this._getParticipateCommentListUsecase,
    this._addAgentCommentUsecase,
    this._addAgentDateUseCase,
    this._getAgentDatesListUsecase,
  ) : super(AgentsDistributorsProfileState()) {
    on<GetAgentClientListEvent>(_onGetAgentClientListEvent);
    on<SearchClientEvent>(_onSearchClientEvent);
    on<GetAgentInvoiceListEvent>(_onGetAgentInvoiceListEvent);
    on<GetInvoiceByIdEvent>(_onGetInvoiceByIdEvent);
    on<SearchInvoiceEvent>(_onSearchInvoiceEvent);
    on<GetAgentCommentListEvent>(_onGetAgentCommentListEvent);
    on<AddAgentCommentEvent>(_onAddAgentCommentEvent);
    on<AddAgentDateEvent>(_onAddAgentDateEvent);
    on<GetAgentDatesListEvent>(_onGetAgentDatesListEvent);
  }

  // date keys and controllers
  final supportFormKey = GlobalKey<FormState>();
  final TextEditingController supportDateController = TextEditingController();
  final TextEditingController supportTimeController = TextEditingController();

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

  void _onGetAgentDatesListEvent(GetAgentDatesListEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(dateVisitStatus: StateStatus.loading));

    final result = await _getAgentDatesListUsecase.call(
      GetAgentDatesListParams(agentId: event.getAgentDatesListParams.agentId),
    );

    result.fold(
      (error) {
        emit(state.copyWith(dateVisitStatus: StateStatus.failure));
      },
      (data) {
        agentDatesList = data;
        emit(state.copyWith(
            dateVisitStatus: StateStatus.success, dateVisitList: data));
      },
    );
  }

  List<AgentDateModel> get finishedVisits {
    return agentDatesList
        .where((element) =>
            element.isDone == VisitsStatusEnum.finished.index.toString())
        .toList();
  }

  List<AgentDateModel> get unfinishedVisits {
    return agentDatesList
        .where((element) =>
            element.isDone == VisitsStatusEnum.unfinished.index.toString())
        .toList();
  }

  List<AgentDateModel> get canceledVisits {
    return agentDatesList
        .where((element) =>
            element.isDone == VisitsStatusEnum.canceled.index.toString())
        .toList();
  }

  void _onAddAgentDateEvent(AddAgentDateEvent event,
      Emitter<AgentsDistributorsProfileState> emit) async {
    emit(state.copyWith(addDateVisitStatus: StateStatus.loading));

    final result = await _addAgentDateUseCase.call(
      AddAgentDateUseCaseParams(agentModel: event.addAgentDateParams),
    );

    result.fold(
      (error) {
        emit(state.copyWith(addDateVisitStatus: StateStatus.failure));
      },
      (data) {
        emit(state.copyWith(addDateVisitStatus: StateStatus.success));
        event.onSuccess?.call();
      },
    );
  }

  String handleVisitTime() {
    final date = DateTime.parse(supportDateController.text);
    final selectedTime = supportTimeController.text.split(':');
    final time = TimeOfDay(
        hour: int.parse(selectedTime[0]), minute: int.parse(selectedTime[1]));
    final dateVisit =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateVisit);
  }
}
