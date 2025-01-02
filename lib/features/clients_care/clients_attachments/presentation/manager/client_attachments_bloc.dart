import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../data/models/attachment_model.dart';
import '../../data/models/subscribed_clients_model.dart';
import '../../domain/use_cases/get_all_client_usecase.dart';
import '../../domain/use_cases/get_attachments_usecase.dart';

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
    on<GetAttachmentsEvent>(_onHandleGetAttachmentsEvent);
    on<GetAllClientEvent>(_onHandleGetAllClientEvent);
    on<SearchOnClientEvent>(_onHandleSearchOnClientEvent);
    on<ChangeFilterClientEvent>(_onHandleChangeFilterClientEvent);
  }

  FutureOr<void> _onHandleGetAttachmentsEvent(GetAttachmentsEvent event, Emitter<ClientAttachmentsState> emit) async {
    emit(state.copyWith( getListAttachments: BlocStatus.loading()));
    final result = await getAttachmentsUseCase( state.getAttachmentsParams);
    result.fold(
      (l) => emit(state.copyWith(getListAttachments: BlocStatus.fail(error: l))),
      (r) => emit(state.copyWith(getListAttachments: BlocStatus.success(data: r))),
    );
  }

  FutureOr<void> _onHandleGetAllClientEvent(GetAllClientEvent event, Emitter<ClientAttachmentsState> emit)async {
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
    emit(state.copyWith(getAttachmentsParams: event.getAttachmentsParams));
  }
}
