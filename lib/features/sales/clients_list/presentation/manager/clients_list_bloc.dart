import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../model/clientmodel.dart';
import '../../../../../model/similar_client.dart';
import '../../data/models/client_marketing_meport_model.dart';
import '../../data/models/client_support_file_model.dart';
import '../../data/models/clients_list_response.dart';
import '../../data/models/recommended_client.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../../domain/use_cases/change_type_client_usecase.dart';
import '../../domain/use_cases/crud_client_support_files_usecase.dart';
import '../../domain/use_cases/edit_client_usecase.dart';
import '../../domain/use_cases/get_client_marketing_report_usecase.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../../domain/use_cases/get_clients_with_filter_usecase.dart';
import '../../domain/use_cases/get_recommended_cleints_usecase.dart';
import '../../domain/use_cases/get_similar_cleints_usecase.dart';
import '../../domain/use_cases/receive_client_usecase.dart';
import '../../domain/use_cases/transfer_client_usecase.dart';
import '../widgets/client_section.dart';

part 'clients_list_event.dart';
part 'clients_list_state.dart';

@injectable
class ClientsListBloc extends Bloc<ClientsListEvent, ClientsListState> {
  final GetClientsWithFilterUserUsecase _getClientsWithFilterUserUsecase;
  final GetRecommendedClientsUsecase _getRecommendedClientsUsecase;
  final GetSimilarClientsUsecase _getSimilarClientsUsecase;
  final AddClientUserUsecase _addClientUserUsecase;
  final EditClientUserUsecase _editClientUserUsecase;
  final ChangeTypeClientUsecase _changeTypeClientUsecase;
  final ApproveRejectClientUsecase _approveRejectClientUsecase;
  final CrudClientSupportFilesUsecase _crudClientSupportFilesUsecase;
  final GetClientSupportFilesUsecase _getClientSupportFilesUsecase;
  final TransferClientUserUsecase _transferClientUsecase;
  final ReceiveClientUserUsecase _receiveClientUsecase;
  final GetClientMarketingReportUsecase _getClientMarketingReportUsecase;

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
    this._transferClientUsecase,
    this._receiveClientUsecase,
    this._getClientMarketingReportUsecase,
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
    on<TransferClientEvent>(_onTransferClientEvent);
    on<ReceiveClientEvent>(_onReceiveClientEvent);
    on<GetClientMarketingReportEvent>(_onGetClientMarketingReportEvent);
    on<SearchClientMarketingReportEvent>(_onSearchClientMarketingReportEvent);
  }

  int totalNumberOfClients = 0;
  final TextEditingController searchController = TextEditingController();
  List<clientMarketingReportModel> clientMarketingReportsList = [];
  SubscribingIntentionLevelEnum _subscribingIntentionLevel =
      SubscribingIntentionLevelEnum.normal;

  SubscribingIntentionLevelEnum get subscribingIntentionLevel =>
      _subscribingIntentionLevel;

  set subscribingIntentionLevel(SubscribingIntentionLevelEnum? value) {
    _subscribingIntentionLevel = value ?? SubscribingIntentionLevelEnum.normal;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  FutureOr<void> _onGetAllClientsListEvent(
      GetAllClientsListEvent event, Emitter<ClientsListState> emit) async {
    GetClientsWithFilterParams getClientsWithFilterParams =
        state.getClientsWithFilterParams?.copyWith(page: event.page) ??
            GetClientsWithFilterParams(
              fkCountry: event.fkCountry,
              page: event.page,
            );

    final response =
        await _getClientsWithFilterUserUsecase(getClientsWithFilterParams);

    response.fold((l) {
      return state.clientsListController.error = l;
    }, (response) {
      final PaginationResponseWrapper result = response;
      totalNumberOfClients = result.count ?? 0;
      final data = result.data as List<ClientModel>;

      final hasReachedMax = HelperFunctions.instance.hasReachedMax(data);
      if (hasReachedMax) {
        state.clientsListController.appendLastPage(data);
      } else {
        final nextPage = (state.clientsListController.nextPageKey ?? 1) + 1;
        state.clientsListController.appendPage(data, nextPage);
      }
      emit(state.copyWith(
        getClientsWithFilterParams: getClientsWithFilterParams,
      ));
    });
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

    response.extract(
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
      getClientsWithFilterParams:
          state.getClientsWithFilterParams?.copyWith(query: event.query),
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

    response.extract(
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

    final response = await _addClientUserUsecase(
      event.addClientParams.copyWith(
        subscribingIntentionLevel: subscribingIntentionLevel,
      ),
    );

    response.extract(
      (exception, message) => emit(state.copyWith(
          actionClientBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        state.clientsListController.itemList = [
          value.data!,
          ...state.clientsListController.itemList ?? []
        ];

        emit(state.copyWith(
          actionClientBlocStatus: const BlocStatus.success(),
        ));
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onEditClientEvent(
      EditClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response = await _editClientUserUsecase(
      event.editClientParams.copyWith(
        subscribingIntentionLevel: subscribingIntentionLevel,
      ),
    );

    response.extract(
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
    response.extract(
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
    response.extract(
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

  FutureOr<void> _onTransferClientEvent(
    TransferClientEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    emit(state.copyWith(transferClientStatus: const BlocStatus.loading()));

    final response = await _transferClientUsecase(event.transferClientParams);
    response.fold((l) {
      emit(state.copyWith(
        transferClientStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      emit(state.copyWith(transferClientStatus: const BlocStatus.success()));
      event.onSuccess?.call(r);
    });
  }

  FutureOr<void> _onReceiveClientEvent(
    ReceiveClientEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    emit(state.copyWith(receiveClientStatus: const BlocStatus.loading()));

    final response = await _receiveClientUsecase(event.receiveClientParams);
    response.fold((l) {
      emit(state.copyWith(
        receiveClientStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      emit(state.copyWith(
        receiveClientStatus:
            BlocStatus<ClientModel1>.success(data: r.mapToClientModel1()),
      ));
      event.onSuccess?.call(r);
    });
  }

  FutureOr<void> _onGetClientMarketingReportEvent(
    GetClientMarketingReportEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    emit(state.copyWith(
        clientMarketingReportStatus: const BlocStatus.loading()));

    final response = await _getClientMarketingReportUsecase(
      event.params ?? GetClientMarketingReportParams(),
    );
    response.fold((l) {
      emit(state.copyWith(
        clientMarketingReportStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      clientMarketingReportsList = r;
      add(const SearchClientMarketingReportEvent());
    });
    emit(state.copyWith(
      getClientMarketingReportParams: event.params,
    ));
  }

  FutureOr<void> _onSearchClientMarketingReportEvent(
    SearchClientMarketingReportEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    final filteredList = clientMarketingReportsList.where((element) {
      return element.nameUser.toLowerCase().contains(searchController.text) ||
          element.count.toString().contains(searchController.text);
    }).toList();

    emit(state.copyWith(
      clientMarketingReportStatus:
          BlocStatus<List<clientMarketingReportModel>>.success(
              data: filteredList),
    ));
  }
}
