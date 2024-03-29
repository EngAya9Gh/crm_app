import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/common/helpers/participate_filter_handlers.dart';
import '../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../model/maincitymodel.dart';
import '../../data/models/participatModel.dart';
import '../../data/models/participate_client_model.dart';
import '../../domain/use_cases/add_participate_comment_usecase.dart';
import '../../domain/use_cases/add_participate_usecase.dart';
import '../../domain/use_cases/edit_paraticipate_usecase.dart';
import '../../domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../domain/use_cases/get_participate_Invoice_list_usecase.dart';
import '../../domain/use_cases/get_participate_client_list_usecase.dart';
import '../../domain/use_cases/get_participate_comment_list_usecase.dart';
import '../../domain/use_cases/get_participate_list_usecase.dart';
import 'participate_list_event.dart';
import 'participate_list_state.dart';

@injectable
class ParticipateListBloc extends Bloc<ParticipateEvent, ParticipateListState> {
  ParticipateListBloc(
    this._getParticipateListUsecase,
    this._addParticipateUserUsecase,
    this._editParticipateUserUsecase,
    this._getParticipateClientListUsecase,
    this._getParticipateInvoiceListUsecase,
    this._getInvoiceByIdUsecase,
    this._getParticipateCommentListUsecase,
    this._addParticipateCommentUsecase,
  ) : super(ParticipateListState()) {
    on<GetParticipateListEvent>(_onGetParticipateListEvent);
    on<FilterEvent>(_onFilterEvent);
    on<AddParticipateEvent>(_onAddParticipateEvent);
    on<EditParticipateEvent>(_onEditParticipateEvent);
    on<ChanageCurrentParticipate>(_onChangeCurrentParticipate);
    on<SwitchProfileTabs>(_onSwitchProfileTabs);
    on<GetParticipateClientListEvent>(_onGetParticipateClientListEvent);
    on<GetParticipateInvoiceListEvent>(_onGetParticipateInvoiceListEvent);
    on<SearchClientEvent>(_onSearchClientEvent);
    on<SearchInvoiceEvent>(_onSearchInvoiceEvent);
    on<GetInvoiceByIdEvent>(_getInvoiceById);
    on<GetParticipateCommentListEvent>(_onGetParticipateCommentListEvent);
    on<AddParticipateCommentEvent>(_onAddParticipateCommentEvent);
  }

  final ParticipateListUsecase _getParticipateListUsecase;
  final AddParticipateUserUsecase _addParticipateUserUsecase;
  final EditParticipateUserUsecase _editParticipateUserUsecase;
  final ParticipateClientListUsecase _getParticipateClientListUsecase;
  final ParticipateInvoiceListUsecase _getParticipateInvoiceListUsecase;
  final GetInvoiceByIdUsecase _getInvoiceByIdUsecase;
  final ParticipateCommentListUsecase _getParticipateCommentListUsecase;
  final AddParticipateCommentUsecase _addParticipateCommentUsecase;

  CityModel? selectedCity;
  List<ParticipateModel> allParticipates = [];
  final TextEditingController searchTextField = TextEditingController();

  FutureOr<void> _onGetParticipateListEvent(
      GetParticipateListEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateListState: PageState.loading()));

    final response =
        await _getParticipateListUsecase(GetParticipateListParams());

    response.fold(
      (exception, message) =>
          emit(state.copyWith(particiPateListState: PageState.error())),
      (value) {
        allParticipates = value.message ?? [];

        emit(
          state.copyWith(
            allParticipateState: value.message,
            particiPateListState: PageState.loaded(data: allParticipates),
          ),
        );
      },
    );
  }

  FutureOr<void> _onFilterEvent(
      FilterEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(
      particiPateListState: PageState.loaded(data: filterParticipatesList()),
    ));
  }

  List<ParticipateModel> filterParticipatesList() {
    final searchFilterHandler = SearchFilterHandler();
    final cityFilterHandler = CityFilterHandler();
    searchFilterHandler.setNextHandler(cityFilterHandler);

    final filterParticipates = searchFilterHandler.handleFiltering(
      list: allParticipates,
      query: searchTextField.text,
      cityId: selectedCity?.id_city,
    );

    return filterParticipates;
  }

  FutureOr<void> _onAddParticipateEvent(
      AddParticipateEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(actionParticipateBlocStatus: BlocStatus.loading()));

    final response =
        await _addParticipateUserUsecase(event.addParticipateParams);

    response.fold(
      (exception, message) => emit(state.copyWith(
          actionParticipateBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(state.copyWith(
            actionParticipateBlocStatus: const BlocStatus.success()));
        allParticipates.insert(0, value.data!);
        emit(
          state.copyWith(
            particiPateListState:
                PageState.loaded(data: filterParticipatesList()),
            allParticipateState: allParticipates,
          ),
        );
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onEditParticipateEvent(
      EditParticipateEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(
        actionParticipateBlocStatus: const BlocStatus.loading()));

    final response =
        await _editParticipateUserUsecase(event.editParticipateParams);

    response.fold(
      (exception, message) => emit(state.copyWith(
          actionParticipateBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(state.copyWith(
            actionParticipateBlocStatus: const BlocStatus.success()));
        allParticipates = allParticipates
            .map((e) =>
                e.id_participate == event.editParticipateParams.idParticipate
                    ? value.data!
                    : e)
            .toList();

        //  emit(state.copyWith(particiPateListState: PageState.loading()));
        emit(
          state.copyWith(
            particiPateListState:
                PageState.loaded(data: filterParticipatesList()),
            allParticipateState: allParticipates,
          ),
        );
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onSwitchProfileTabs(
      SwitchProfileTabs event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(currentProfileTab: event.indexTab));
  }

  FutureOr<void> _onChangeCurrentParticipate(ChanageCurrentParticipate event,
      Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(currentPaticipate: event.participateModel));
  }

  FutureOr<void> _onGetParticipateClientListEvent(
      GetParticipateClientListEvent event,
      Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateClientsListState: PageState.loading()));

    final response = await _getParticipateClientListUsecase(
        event.getParticipateClientListParams);

    response.fold(
      (exception, message) =>
          emit(state.copyWith(particiPateClientsListState: PageState.error())),
      (value) {
        final filterData = filterClientList(event.query);
        final lists = [filterData, (value.data ?? [])];
        final commonElements = event.query.isNotEmpty
            ? filterClientList(event.query, value.data)
            : HelperFunctions.instance.intersection(lists);

        emit(
          state.copyWith(
            particiPateClientsListState: event.query.isNotEmpty
                ? PageState.loaded(data: commonElements)
                : PageState.loaded(data: value.data ?? []),
            allParticipateClientsState: value.data,
          ),
        );
      },
    );
  }

  FutureOr<void> _onSearchClientEvent(
      SearchClientEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(
        particiPateClientsListState:
            PageState.loaded(data: filterClientList(event.query))));
  }

  List<ParticipateClientModel> filterClientList(String query,
      [List<ParticipateClientModel>? l]) {
    List<ParticipateClientModel> list = List<ParticipateClientModel>.from(
        l ?? state.allParticipateClientsState);
    list = list
        .where((element) =>
                (element.nameEnterprise!.toLowerCase().contains(query) ?? false)
            // || (element.m.toLowerCase().contains(query) ?? false)
            )
        .toList();
    return list;
  }

  FutureOr<void> _onGetParticipateInvoiceListEvent(
      GetParticipateInvoiceListEvent event,
      Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateInvoicesListState: PageState.loading()));

    final response = await _getParticipateInvoiceListUsecase(
        event.getParticipateInvoiceListParams);

    response.fold(
      (exception, message) =>
          emit(state.copyWith(particiPateInvoicesListState: PageState.error())),
      (value) {
        final filterData = filterInvoiceList(event.query);
        final lists = [filterData, (value.data ?? [])];
        final commonElements = event.query.isNotEmpty
            ? filterInvoiceList(event.query, value.data)
            : HelperFunctions.instance.intersection(lists);

        emit(
          state.copyWith(
            particiPateInvoicesListState: event.query.isNotEmpty
                ? PageState.loaded(data: commonElements)
                : PageState.loaded(data: value.data ?? []),
            allParticipateInvoicesState: value.data,
          ),
        );
      },
    );
  }

  FutureOr<void> _onSearchInvoiceEvent(
      SearchInvoiceEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(
        particiPateInvoicesListState:
            PageState.loaded(data: filterInvoiceList(event.query))));
  }

  List<ProfileInvoiceModel> filterInvoiceList(String query,
      [List<ProfileInvoiceModel>? l]) {
    List<ProfileInvoiceModel> list =
        List<ProfileInvoiceModel>.from(l ?? state.allParticipateInvoicesState);
    list = list
        .where((element) =>
            (element.nameEnterprise != null &&
                    element.nameEnterprise!.toLowerCase().contains(query) ??
                false) ||
            (element.idInvoice != null &&
                    element.idInvoice!.toString().contains(query) ??
                false) ||
            (element.nameClient != null &&
                    element.nameClient!.toLowerCase().contains(query) ??
                false))
        .toList();
    return list;
  }

  FutureOr<void> _getInvoiceById(
      GetInvoiceByIdEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(dialogProgressState: const BlocStatus.loading()));
    final response = await _getInvoiceByIdUsecase(
        GetInvoiceByIdParams(idInvoice: event.getInvoiceByIdParams.idInvoice));

    response.fold(
      (exception, message) => emit(state.copyWith(
          dialogProgressState: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(state.copyWith(dialogProgressState: const BlocStatus.success()));
        emit(state.copyWith(currentInvoice: value.data));
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onGetParticipateCommentListEvent(
      GetParticipateCommentListEvent event,
      Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateCommentsListState: PageState.loading()));

    final response = await _getParticipateCommentListUsecase(
        event.getParticipateCommentListParams);

    response.fold(
      (exception, message) =>
          emit(state.copyWith(particiPateCommentsListState: PageState.error())),
      (value) {
        emit(
          state.copyWith(
            particiPateCommentsListState:
                PageState.loaded(data: value.data ?? []),
            allParticipateCommentsState: value.data,
          ),
        );
      },
    );
  }

  FutureOr<void> _onAddParticipateCommentEvent(AddParticipateCommentEvent event,
      Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(actionCommentState: BlocStatus.loading()));
    final response =
        await _addParticipateCommentUsecase(event.addParticipateCommentParams);
    response.fold(
      (exception, message) => emit(
          state.copyWith(actionCommentState: BlocStatus.fail(error: message))),
      (value) {
        final commentData = value.data!;

        if (commentData.id.toString() == '0') {
          event.onSuccess?.call("repeat");
          return;
        }
        List<ProfileCommentModel> comment = state.allParticipateCommentsState;

        comment.insert(0, commentData);
        final usersState = PageState.loaded(data: comment);
        emit(
          state.copyWith(
            actionCommentState: BlocStatus.success(),
            particiPateCommentsListState: usersState,
            allParticipateCommentsState: comment,
            // currentLink: updateLink != null ? link : null,
          ),
        );
        event.onSuccess?.call(null);
      },
    );
  }
}
