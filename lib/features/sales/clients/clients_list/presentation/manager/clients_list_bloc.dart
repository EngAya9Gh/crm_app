import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/enums/activity_type_size_enum.dart';
import 'package:crm_smart/core/common/enums/client/client_source_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/similar_client.dart';
import '../../data/models/client_marketing_meport_model.dart';
import '../../data/models/client_support_file_model.dart';
import '../../data/models/recommended_client.dart';
import '../../domain/entities/clients_list_page_variables_entity.dart';
import '../../domain/entities/filter_clients_list_entity.dart';
import '../../domain/entities/linked_clients_page_variables_entity.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../../domain/use_cases/change_type_client_usecase.dart';
import '../../domain/use_cases/crud_client_support_files_usecase.dart';
import '../../domain/use_cases/edit_client_usecase.dart';
import '../../domain/use_cases/export_clients_to_excel_usecase.dart';
import '../../domain/use_cases/fetch_link_usecase.dart';
import '../../domain/use_cases/fetch_paginated_clients_usecase.dart';
import '../../domain/use_cases/get_client_marketing_report_usecase.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../../domain/use_cases/get_clients_with_filter_usecase.dart';
import '../../domain/use_cases/get_high_similar_cleints_usecase.dart';
import '../../domain/use_cases/get_recommended_cleints_usecase.dart';
import '../../domain/use_cases/get_similar_cleints_usecase.dart';
import '../../domain/use_cases/link_selected_client_usecase.dart';
import '../../domain/use_cases/receive_client_usecase.dart';
import '../../domain/use_cases/transfer_client_usecase.dart';

part 'clients_list_event.dart';
part 'clients_list_state.dart';

abstract class LinkClientEvent extends Equatable {
  const LinkClientEvent();

  @override
  List<Object> get props => [];
}

class FetchLinkClients extends ClientsListEvent {
  final String clientId;

  const FetchLinkClients(this.clientId);

  @override
  List<Object> get props => [clientId];
}

class LinkClient extends LinkClientEvent {
  final String parentId;
  final String childId;

  const LinkClient(this.parentId, this.childId);

  @override
  List<Object> get props => [parentId, childId];
}

class UnlinkClient extends LinkClientEvent {
  final String clientId;

  const UnlinkClient(this.clientId);

  @override
  List<Object> get props => [clientId];
}

class LinkSelectedClients extends ClientsListEvent {
  final String clientId;
  final List<String> selectedIds;

  const LinkSelectedClients(this.clientId, this.selectedIds);

  @override
  List<Object> get props => [clientId, selectedIds];
}

// State

class LinkClientState extends Equatable {
  final List<ClientModel> linkedClients;
  final bool isLoading;
  String? error = null;

  LinkClientState({
    this.linkedClients = const [],
    this.isLoading = false,
    this.error,
  });

  LinkClientState copyWith({
    List<ClientModel>? linkedClients,
    bool? isLoading,
    String? error,
  }) {
    return LinkClientState(
      linkedClients: linkedClients ?? this.linkedClients,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [linkedClients, isLoading, error];
}

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
  final GetHighSimilarClientsUsecase _getHighSimilarClientsUsecase;
  final FetchLinkClientsUseCase _fetchLinkClientsUseCase;
  final FetchPaginatedClientsUsecase _fetchPaginatedClientsUsecase;
  final LinkSelectedClientsUseCase _linkSelectedClientsUseCase;
  final ExportClientsToExcelUseCase _exportClientsToExcelUseCase;

  ClientsListBloc(
    this._getClientsWithFilterUserUsecase,
    this._getRecommendedClientsUsecase,
    this._getSimilarClientsUsecase,
    this._addClientUserUsecase,
    this._editClientUserUsecase,
    this._changeTypeClientUsecase,
    this._approveRejectClientUsecase,
    this._crudClientSupportFilesUsecase,
    this._getClientSupportFilesUsecase,
    this._transferClientUsecase,
    this._receiveClientUsecase,
    this._getClientMarketingReportUsecase,
    this._getHighSimilarClientsUsecase,
    this._fetchLinkClientsUseCase,
    this._fetchPaginatedClientsUsecase,
    this._linkSelectedClientsUseCase,
    this._exportClientsToExcelUseCase,
  ) : super(ClientsListState()) {
    on<GetAllClientsListEvent>(_onGetAllClientsListEvent);
    on<GetRecommendedClientsEvent>(_onGetRecommendedClientsEvent);
    on<GetSimilarClientsListEvent>(_onGetSimilarClientsEvent);
    on<AddClientEvent>(_onAddClientEvent);
    on<EditClientEvent>(_onEditClientEvent);
    on<ChangeTypeClientEvent>(_onEditTypeClientEvent);
    on<ApproveRejectClientEvent>(_onApproveRejectClientEvent);
    on<CrudClientSupportFilesEvent>(_onCrudClientSupportFilesEvent);
    on<GetClientSupportFilesEvent>(_onGetClientSupportFilesEvent);
    on<TransferClientEvent>(_onTransferClientEvent);
    on<ReceiveClientEvent>(_onReceiveClientEvent);
    on<GetClientMarketingReportEvent>(_onGetClientMarketingReportEvent);
    // on<SearchClientMarketingReportEvent>(_onSearchClientMarketingReportEvent);
    on<GetHighSimilarClientsListEvent>(_onGetHighSimilarClientsEvent);
    on<FetchLinkClients>(_onFetchLinkClients);
    on<FetchPaginatedClientsEvent>(_onFetchPaginatedClientsEvent);
    on<LinkSelectedClients>(_onLinkSelectedClients);
  }

  final TextEditingController searchController = TextEditingController();
  List<clientMarketingReportModel> clientMarketingReportsList = [];
  SubscribingIntentionLevelEnum _subscribingIntentionLevel =
      SubscribingIntentionLevelEnum.normal;

  ClientModel? _currentClient;

  ClientModel? get currentClient => _currentClient;

  FilterClientsListEntity filterEntity = FilterClientsListEntity();
  ClientsListPageVariablesEntity pageVariables =
      ClientsListPageVariablesEntity();
  LinkedClientsPageVariablesEntity linkedClientsVariables =
      LinkedClientsPageVariablesEntity();

  void init() {
    pageVariables = ClientsListPageVariablesEntity();
    filterEntity = FilterClientsListEntity();
    state.copyWith(getClientMarketingReportParams: null);
  }

  void clearGetClientMarketingReportParams() {
    state.copyWith(getClientMarketingReportParams: null);
  }

  set currentClient(ClientModel? value) {
    _currentClient = value;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  SubscribingIntentionLevelEnum get subscribingIntentionLevel =>
      _subscribingIntentionLevel;

  set subscribingIntentionLevel(SubscribingIntentionLevelEnum? value) {
    _subscribingIntentionLevel = value ?? SubscribingIntentionLevelEnum.normal;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  FutureOr<void> _onFetchPaginatedClientsEvent(
    FetchPaginatedClientsEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    if (state.getAllClientsStatus.isLoading()) return;

    emit(state.copyWith(getAllClientsStatus: BlocStatus.loading()));

    final params = FetchPaginatedClientsParams(
      page: event.page,
      fkCountry: event.fkCountry,
    );

    try {
      final response = await _fetchPaginatedClientsUsecase(params);

      pageVariables.allList = response.data ?? [];
      pageVariables.totalCount = response.count ?? 0;
      pageVariables.hasReachedEnd = response.data?.isEmpty ?? true;

      if (pageVariables.allList.isEmpty) {
        emit(state.copyWith(getAllClientsStatus: BlocStatus.empty()));
      } else {
        emit(state.copyWith(getAllClientsStatus: BlocStatus.success()));
      }
    } catch (e) {
      emit(state.copyWith(
          getAllClientsStatus: BlocStatus.fail(error: e.toString())));
    }
  }

  FutureOr<void> _onGetAllClientsListEvent(
    GetAllClientsListEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    if (state.getAllClientsStatus.isLoading()) return;
    pageVariables.isNewFilter = event.isNewFilter;
    if (event.isNewFilter) {
      pageVariables.allList.clear();
      pageVariables.hasReachedEnd = false;
    }
    if (pageVariables.hasReachedEnd) return;

    emit(state.copyWith(getAllClientsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    print('event.download');
    print(event.download);
    final result =
        await _getClientsWithFilterUserUsecase(_prepareParams(event));

    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getAllClientsStatus: BlocStatus.fail(error: e),
        ));
      },
      (response) async {
        if (event.download == '1') {
          try {
            List<int> excelData =
                await _exportClientsToExcelUseCase(_prepareParams(event));
            final directory = await getExternalStorageDirectory();
            final filePath = '${directory!.path}/clients_list.xlsx';
            final file = File(filePath);
            await file.writeAsBytes(excelData);

            OpenFile.open(filePath);
            // OpenFilex.open("${savePath}");
          } catch (e) {
            emit(state.copyWith(error: e.toString()));
          }
        } else {
          final PaginationResponseWrapper result = response;
          pageVariables.allList = response.data; // Replace instead of add
          pageVariables.totalCount = result.count ?? 0;
          pageVariables.hasReachedEnd = response.data.isEmpty;

          if (pageVariables.allList.isEmpty) {
            return emit(state.copyWith(
              getAllClientsStatus: BlocStatus.empty(),
              currentPage: event.pageWeb ?? 1,
            ));
          }
          emit(state.copyWith(
            getAllClientsStatus: BlocStatus.success(),
            currentPage: event.pageWeb ?? 1,
          ));
          event.onSuccess?.call();
        }
      },
    );
  }

  GetClientsWithFilterParams _prepareParams(GetAllClientsListEvent event) {
    return GetClientsWithFilterParams(
      fkCountry: event.fkCountry,
      download: event.download,
      page: pageVariables.allList.length,
      skip: (event.pageWeb - 1) * AppConstants.kPerPage,
      query: pageVariables.searchController.text,
      fkRegion: filterEntity.regionIdNotifier.value,
      typeClient: filterEntity.statusNotifier.value,
      activityTypeId: filterEntity.activityNotifier.value,
      activitySize: filterEntity.activitySizeNotifier.value?.value,
      typeClient_record: filterEntity.recordTypeNotifier.value,
      typeClassfication: filterEntity.classTypeNotifier.value,
      fkUser: filterEntity.userNotifier.value?.id,
      from: filterEntity.fromController.text,
      to: filterEntity.toController.text,
      clientSource: filterEntity.clientSourceNotifier.value?.value,
      subscribingIntentionLevel: filterEntity.subscribingIntentionLevel.value,
      isSwitchOn: filterEntity.isSwitchOnNotifier.value,
      cityId: filterEntity.cityNotifier.value?.cityId,
    );
  }

  FutureOr<void> _onGetSimilarClientsEvent(
      GetSimilarClientsListEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.initial()));
    final GetSimilarClientsListParams getClientsWithFilterParams =
        event.getClientsWithFilterParams;
    if (state.similarClientsState.isLoading()) {
      emit(state.copyWith(similarClientsState: state.similarClientsState));
      return;
    }
    emit(state.copyWith(similarClientsState: BlocStatus.loading()));
    final response =
        await _getSimilarClientsUsecase(getClientsWithFilterParams);

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(
            similarClientsState: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(
            similarClientsState: BlocStatus.success(data: value.data ?? [])));
        event.onSuccess?.call(value.data ?? []);
      },
    );
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
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(recommendedClientsState: PageState.error()));
      },
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
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(
            actionClientBlocStatus: BlocStatus.fail(error: message ?? '')));
      },
      (value) {
        pageVariables.allList.insert(0, value.data!);
        pageVariables.totalCount++;
        emit(state.copyWith(
          getAllClientsStatus: const BlocStatus.success(),
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
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(
            actionClientBlocStatus: BlocStatus.fail(error: message ?? '')));
      },
      (value) {
        currentClient = value.data;
        pageVariables.allList.forEach((element) {
          if (element.idClients == event.editClientParams.clientId) {
            element = value.data!;
          }
        });

        emit(state.copyWith(
          getAllClientsStatus: const BlocStatus.success(),
          actionClientBlocStatus: const BlocStatus.success(),
        ));
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onEditTypeClientEvent(
      ChangeTypeClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response =
        await _changeTypeClientUsecase(event.changeTypeClientParams);

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(
            actionClientBlocStatus: BlocStatus.fail(error: message ?? '')));
      },
      (value) {
        emit(state.copyWith(
          changeTypeClientParams: null,
          actionClientBlocStatus: const BlocStatus.success(),
        ));

        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onApproveRejectClientEvent(
      ApproveRejectClientEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(actionClientBlocStatus: const BlocStatus.loading()));

    final response =
        await _approveRejectClientUsecase(event.approveRejectClientParams);

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(
            actionClientBlocStatus: BlocStatus.fail(error: message ?? '')));
      },
      (value) {
        emit(state.copyWith(
          actionClientBlocStatus: const BlocStatus.success(),
        ));
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

    response.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        clientSupportFilesBlocStatus: BlocStatus.fail(error: e),
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
      if (AppConstants.shouldReturnEarly(l)) return;
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
      if (AppConstants.shouldReturnEarly(l)) return;
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
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(
        receiveClientStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      currentClient = r;
      emit(state.copyWith(
        receiveClientStatus: BlocStatus<ClientModel>.success(data: r),
      ));
      event.onSuccess?.call(r);
    });
  }

  FutureOr<void> _onGetClientMarketingReportEvent(
    GetClientMarketingReportEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    emit(state.copyWith(
      clientMarketingReportStatus: const BlocStatus.loading(),
    ));

    final response = await _getClientMarketingReportUsecase(
      event.params ?? GetClientMarketingReportParams(),
    );
    response.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(
        clientMarketingReportStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      clientMarketingReportsList = r;
      add(const SearchClientMarketingReportEvent());
    });
    emit(state.copyWith(
      clientMarketingReportStatus: BlocStatus.success(),
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

  FutureOr<void> _onGetHighSimilarClientsEvent(
    GetHighSimilarClientsListEvent event,
    Emitter<ClientsListState> emit,
  ) async {
    emit(state.copyWith(highSimilarClientsState: BlocStatus.loading()));
    final response =
        await _getHighSimilarClientsUsecase(event.getHighSimilarClientsParams);

    response.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(
          highSimilarClientsState: BlocStatus.fail(error: l),
        ));
      },
      (r) {
        emit(state.copyWith(
          highSimilarClientsState: BlocStatus.success(data: r.data),
        ));
        event.onSuccess?.call(r.data);
      },
    );
  }

  Future<void> _onFetchLinkClients(
    FetchLinkClients event,
    Emitter<ClientsListState> emit,
  ) async {
    emit(state.copyWith(getLinkClientsStatus: BlocStatus.loading()));
    try {
      final linkedClients = await _fetchLinkClientsUseCase(event.clientId);
      linkedClientsVariables.allList = linkedClients;
      _initializeCheckedList();
      if (linkedClients.isEmpty) {
        emit(state.copyWith(getLinkClientsStatus: BlocStatus.empty()));
        return;
      }
      emit(state.copyWith(getLinkClientsStatus: BlocStatus.success()));
    } catch (e) {
      emit(state.copyWith(
          getLinkClientsStatus: BlocStatus.fail(error: e.toString())));
    }
  }

  void _initializeCheckedList() {
    if (linkedClientsVariables.allList.isEmpty)
      linkedClientsVariables.checkedClientsList = const [];

    linkedClientsVariables.checkedClientsList =
        List.generate(linkedClientsVariables.allList.length, (index) {
      return linkedClientsVariables.allList[index].isParent != null;
    });
  }

  Future<void> _onLinkSelectedClients(
    LinkSelectedClients event,
    Emitter<ClientsListState> emit,
  ) async {
    if (event.selectedIds.isNotEmpty) {
      emit(state.copyWith(
          linkSelectedClientsStatus: const BlocStatus.loading()));
      // try {
      final success =
          await _linkSelectedClientsUseCase(event.clientId, event.selectedIds);

      success.fold(
        (l) {
          if (AppConstants.shouldReturnEarly(l)) return;
          emit(state.copyWith(
              linkSelectedClientsStatus: BlocStatus.fail(error: l)));
        },
        (r) => emit(
            state.copyWith(linkSelectedClientsStatus: BlocStatus.success())),
      );
      //   if (success) {
      //
      //     emit(state.copyWith(  isLoading: false));
      //   } else {
      //     emit(state.copyWith(error: 'Failed to link clients', isLoading: false));
      //   }
      // } catch (e) {
      //   emit(state.copyWith(error: e.toString(), isLoading: false));
      // }
    }
  }

// Future<void> _onLinkClient(
//   LinkClient event,
//   Emitter<LinkClientState> emit,
// ) async {
//   emit(state.copyWith(isLoading: true));
//   try {
//     await linkClientUseCase(event.parentId, event.childId);
//     final updatedClients = await fetchLinkClientsUseCase(event.parentId);
//     emit(state.copyWith(linkedClients: updatedClients, isLoading: false));
//   } catch (e) {
//     emit(state.copyWith(error: e.toString(), isLoading: false));
//   }
// }

// Future<void> _onUnlinkClient(
//   UnlinkClient event,
//   Emitter<LinkClientState> emit,
// ) async {
//   emit(state.copyWith(isLoading: true));
//   try {
//     await unlinkClientUseCase(event.clientId);
//     final updatedClients = await fetchLinkClientsUseCase(event.clientId);
//     emit(state.copyWith(linkedClients: updatedClients, isLoading: false));
//   } catch (e) {
//     emit(state.copyWith(error: e.toString(), isLoading: false));
//   }
// }
}
