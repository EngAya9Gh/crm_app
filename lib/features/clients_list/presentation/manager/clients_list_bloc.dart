import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/models/nullable.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/clients_list/data/models/recommended_client.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/similar_client.dart';
import '../../data/models/client_support_file_model.dart';
import '../../data/models/clients_list_response.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../../domain/use_cases/change_type_client_usecase.dart';
import '../../domain/use_cases/crud_client_support_files_usecase.dart';
import '../../domain/use_cases/edit_client_usecase.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../../domain/use_cases/get_recommended_cleints_usecase.dart';
import '../../domain/use_cases/get_similar_cleints_usecase.dart';

part 'clients_list_event.dart';
part 'clients_list_state.dart';

@injectable
class ClientsListBloc extends Bloc<ClientsListEvent, ClientsListState> {
  ClientsListBloc(
    this._getClientsWithFilterUserUsecase,
    this._getRecommendedClientsUsecase,
    this._addClientUserUsecase,
    this._editClientUserUsecase,
    this._changeTypeClientUsecase,
    this._getSimilarClientsUsecase,
    this._approveRejectClientUsecase,
    this._crudClientSupportFilesUsecase,
    this._getClientSupportFilesUsecase,
  ) : super(ClientsListState()) {
    on<GetAllClientsListEvent>(_onGetAllClientsListEvent);
    on<UpdateGetClientsParamsEvent>(_onUpdateGetClientsParamsEvent);
    on<SearchEvent>(_onSearchEvent);
    on<ResetClientList>(_onResetClientList);
    on<GetRecommendedClientsEvent>(_onGetRecommendedClientsEvent);
    on<GetSimilarClientsListEvent>(_onGetSimilarClientsEvent);
    on<AddClientEvent>(_onAddClientEvent);
    on<EditClientEvent>(_onEditClientEvent);
    on<ChangeTypeClientEvent>(_onEditTypeClientEvent);
    on<SwitchEvent>(_onSwitchEvent);
    on<ApproveRejectClientEvent>(_onApproveRejectClientEvent);
    on<CrudClientSupportFilesEvent>(_onCrudClientSupportFilesEvent);
    on<GetClientSupportFilesEvent>(_onGetClientSupportFilesEvent);
  }

  final GetClientsWithFilterUserUsecase _getClientsWithFilterUserUsecase;
  final GetRecommendedClientsUsecase _getRecommendedClientsUsecase;
  final GetSimilarClientsUsecase _getSimilarClientsUsecase;
  final AddClientUserUsecase _addClientUserUsecase;
  final EditClientUserUsecase _editClientUserUsecase;
  final ChangeTypeClientUsecase _changeTypeClientUsecase;
  final ApproveRejectClientUsecase _approveRejectClientUsecase;
  final CrudClientSupportFilesUsecase _crudClientSupportFilesUsecase;
  final GetClientSupportFilesUsecase _getClientSupportFilesUsecase;

  FutureOr<void> _onGetAllClientsListEvent(
      GetAllClientsListEvent event, Emitter<ClientsListState> emit) async {
    final GetClientsWithFilterParams getClientsWithFilterParams = state
            .getClientsWithFilterParams
            ?.copyWith(page: Nullable.value(event.page)) ??
        GetClientsWithFilterParams(
          country: event.fkCountry,
          page: event.page,
          regionPrivilegeId: event.regionPrivilegeId,
          userPrivilegeId: event.userPrivilegeId,
        );

    final response =
        await _getClientsWithFilterUserUsecase(getClientsWithFilterParams);

    response.fold(
      (exception, message) => state.clientsListController.error = exception,
      (value) {
        final hasReachedMax =
            HelperFunctions.instance.hasReachedMax(value.message);
        if (hasReachedMax) {
          state.clientsListController.appendLastPage(value.message ?? []);
        } else {
          final nextPage = (state.clientsListController.nextPageKey ?? 1) + 1;
          state.clientsListController.appendPage(value.message ?? [], nextPage);
        }
        emit(state.copyWith(
          getClientsWithFilterParams: getClientsWithFilterParams,
          // myclient: myclient
        ));
      },
    );
  }

  FutureOr<void> _onGetSimilarClientsEvent(
      GetSimilarClientsListEvent event, Emitter<ClientsListState> emit) async {
    // emit(state.copyWith(
    //   getClientsWithFilterParams: event.getClientsWithFilterParams,
    //   restFilter: event.resetFilter,
    // ));
    final GetSimilarClientsListParams getClientsWithFilterParams =
        event.getClientsWithFilterParams;
    if (state.similarClientsState.isLoaded) {
      emit(state.copyWith(similarClientsState: state.similarClientsState));
      return;
    }
    emit(state.copyWith(similarClientsState: PageState.loading()));
    final response =
        await _getSimilarClientsUsecase(getClientsWithFilterParams);

    response.fold(
      (exception, message) =>
          emit(state.copyWith(similarClientsState: PageState.error())),
      (value) {
        emit(state.copyWith(
            similarClientsState: PageState.loaded(data: value.data ?? [])));
        event.onSuccess?.call(value.data ?? []);
      },
    );
  }

  FutureOr<void> _onUpdateGetClientsParamsEvent(
      UpdateGetClientsParamsEvent event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
      getClientsWithFilterParams: event.getClientsWithFilterParams,
      restFilter: event.resetFilter,
    ));

    state.clientsListController.refresh();
  }

  FutureOr<void> _onSwitchEvent(
      SwitchEvent event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
      myclient: event.mycl,
    ));
  }

  FutureOr<void> _onSearchEvent(
      SearchEvent event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
      getClientsWithFilterParams: state.getClientsWithFilterParams
          ?.copyWith(query: Nullable.value(event.query)),
    ));

    state.clientsListController.refresh();
  }

  FutureOr<void> _onResetClientList(
      ResetClientList event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
        clientsListController:
            PagingController(firstPageKey: 1, invisibleItemsThreshold: 10),
        restFilter: true,
        similarClientsState: PageState.init()));
  }

  FutureOr<void> _onGetRecommendedClientsEvent(
      GetRecommendedClientsEvent event, Emitter<ClientsListState> emit) async {
    if (state.recommendedClientsState.isLoaded) {
      emit(state.copyWith(
          recommendedClientsState: state.recommendedClientsState));
      return;
    }
    emit(state.copyWith(recommendedClientsState: PageState.loading()));

    final response = await _getRecommendedClientsUsecase();

    response.fold(
      (exception, message) =>
          emit(state.copyWith(recommendedClientsState: PageState.error())),
      (value) {
        emit(state.copyWith(
            recommendedClientsState:
                PageState.loaded(data: value.message ?? [])));
        event.onSuccess?.call(value.message ?? []);
      },
    );
  }

  FutureOr<void> _onAddClientEvent(
      AddClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response = await _addClientUserUsecase(event.addClientParams);

    response.fold(
      (exception, message) => emit(state.copyWith(
          actionClientBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(
            state.copyWith(actionClientBlocStatus: const BlocStatus.success()));
        state.clientsListController.itemList = [
          value.data!,
          ...state.clientsListController.itemList ?? []
        ];
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onEditClientEvent(
      EditClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response = await _editClientUserUsecase(event.editClientParams);

    response.fold(
      (exception, message) => emit(state.copyWith(
          actionClientBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(
            state.copyWith(actionClientBlocStatus: const BlocStatus.success()));

        state.clientsListController.itemList =
            (state.clientsListController.itemList ?? [])
                .map((e) => e.idClients == event.editClientParams.clientId
                    ? value.data!
                    : e)
                .toList();
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onEditTypeClientEvent(
      ChangeTypeClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response =
        await _changeTypeClientUsecase(event.changeTypeClientParams);

    /// code response
    response.fold(
      (exception, message) => emit(state.copyWith(
          actionClientBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(state.copyWith(
            changeTypeClientParams: null,
            actionClientBlocStatus: const BlocStatus.success()));
        //
        // state.clientsListController.itemList =
        //     (state.clientsListController.itemList ?? [])
        //     .map((e) => e.idClients == event.changeTypeClientParams.id_clients ? value.data! : e)
        //     .toList();

        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onApproveRejectClientEvent(
      ApproveRejectClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response =
        await _approveRejectClientUsecase(event.approveRejectClientParams);

    /// code response
    response.fold(
      (exception, message) => emit(state.copyWith(
          actionClientBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(
            state.copyWith(actionClientBlocStatus: const BlocStatus.success()));
        //
        // state.clientsListController.itemList =
        //     (state.clientsListController.itemList ?? [])
        //     .map((e) => e.idClients == event.changeTypeClientParams.id_clients ? value.data! : e)
        //     .toList();
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onCrudClientSupportFilesEvent(
      CrudClientSupportFilesEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(
        clientSupportFilesBlocStatus: const BlocStatus.loading()));

    final response = await _crudClientSupportFilesUsecase(
        event.crudClientSupportFilesParams);

    response.fold((l) {
      emit(state.copyWith(
        clientSupportFilesBlocStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      final List<ClientSupportFileModel> files =
          _deleteFileFromList(event.crudClientSupportFilesParams.deletedFiles);
      files.addAll(r);
      emit(state.copyWith(
        clientSupportFilesList: files,
        clientSupportFilesBlocStatus: const BlocStatus.success(),
      ));
      event.onSuccess?.call(r);
    });
  }

  List<ClientSupportFileModel> _deleteFileFromList(List<String> deletedFiles) {
    return state.clientSupportFilesList
        .where((element) => !deletedFiles.contains(element.id))
        .toList();
  }

  FutureOr<void> _onGetClientSupportFilesEvent(
      GetClientSupportFilesEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(
        clientSupportFilesBlocStatus: const BlocStatus.loading()));

    final response =
        await _getClientSupportFilesUsecase(event.getClientSupportFilesParams);

    response.fold((l) {
      emit(state.copyWith(
        clientSupportFilesBlocStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      emit(state.copyWith(
        clientSupportFilesList: r,
        clientSupportFilesBlocStatus: const BlocStatus.success(),
      ));
      event.onSuccess?.call(r);
    });
  }
}
