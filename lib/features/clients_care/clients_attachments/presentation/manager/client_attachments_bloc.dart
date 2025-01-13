import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../data/models/attachment_model.dart';
import '../../data/models/subscribed_clients_model.dart';
import '../../domain/use_cases/get_all_client_usecase.dart';
import '../../domain/use_cases/get_attachments_usecase.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'client_attachments_event.dart';

part 'client_attachments_state.dart';

@injectable
class ClientAttachmentsBloc extends Bloc<ClientAttachmentsEvent, ClientAttachmentsState> {
  final GetAttachmentsUseCase getAttachmentsUseCase;
  final GetAllClientUseCase getAllClientUseCase;

  ClientAttachmentsBloc(
    this.getAttachmentsUseCase,
    this.getAllClientUseCase,
  ) : super(ClientAttachmentsState()) {
    on<GetAttachmentsEvent>(_onHandleGetAttachmentsEvent, transformer: droppable());
    on<GetAllClientEvent>(_onHandleGetAllClientEvent);
    on<SearchOnClientEvent>(_onHandleSearchOnClientEvent);
    on<ChangeFilterClientEvent>(_onHandleChangeFilterClientEvent);
  }

  FutureOr<void> _onHandleGetAttachmentsEvent(GetAttachmentsEvent event, Emitter<ClientAttachmentsState> emit) async {
    if (state.getAttachmentsParams.page == 1 || state.isRrefresh) {
      emit(state.copyWith(getListAttachments: BlocStatus.loading()));
    }
    try {
      final result = await getAttachmentsUseCase(state.getAttachmentsParams);
      if (state.getAttachmentsParams.page > 1) {
        emit(state.copyWith(
            totalCountItem: result.count,
            getListAttachments: BlocStatus.success(
              data: List.of(state.getListAttachments.data ?? [])..addAll(result.message ?? []),
            )));
        return;
      }
      emit(state.copyWith(totalCountItem: result.count, getListAttachments: BlocStatus.success(data: result.message ?? [])));
      print(result.data);
      // else {
      // }
      emit(state.copyWith(isRrefresh: false));
    } catch (e) {
      emit(state.copyWith(getListAttachments: BlocStatus.fail(error: e.toString())));
    }
    // result.fold(
    //   (l) => emit(state.copyWith(getListAttachments: BlocStatus.fail(error: l))),
    //   (r) {
    //     if (state.getAttachmentsParams.page > 1) {
    //       emit(state.copyWith(
    //           getListAttachments: BlocStatus.success(
    //         data: List.of(state.getListAttachments.data ?? [])..addAll(r),
    //       )));
    //     } else {
    //       emit(state.copyWith(getListAttachments: BlocStatus.success(data: r)));
    //     }
    //   },
    // );
  }

  FutureOr<void> _onHandleGetAllClientEvent(GetAllClientEvent event, Emitter<ClientAttachmentsState> emit) async {
    // emit(state.copyWith( getAllClients: BlocStatus.loading()));
    final result = await getAllClientUseCase();
    result.fold(
      (l) => emit(state.copyWith(getAllClients: BlocStatus.fail(error: l))),
      (r) => emit(state.copyWith(getAllClients: BlocStatus.success(data: r))),
    );
  }

  FutureOr<void> _onHandleSearchOnClientEvent(SearchOnClientEvent event, Emitter<ClientAttachmentsState> emit) {
    emit(state.copyWith(filterClientStateSearch: event.query));
  }

  FutureOr<void> _onHandleChangeFilterClientEvent(ChangeFilterClientEvent event, Emitter<ClientAttachmentsState> emit) {
    bool  needRefresh = ((state.getAttachmentsParams.invoiceId != event.getAttachmentsParams.invoiceId) ||
        (state.getAttachmentsParams.clientId != event.getAttachmentsParams.clientId) ||
        (state.getAttachmentsParams.type != event.getAttachmentsParams.type));
    print('needRefresh$needRefresh');
    emit(state.copyWith(getAttachmentsParams: event.getAttachmentsParams, isRrefresh: needRefresh));
  }
}
