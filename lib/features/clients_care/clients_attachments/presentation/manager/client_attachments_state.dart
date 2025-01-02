part of 'client_attachments_bloc.dart';

@immutable
class ClientAttachmentsState {
  final BlocStatus<List<AttachmentModel>> getListAttachments;
  final GetAttachmentsParams getAttachmentsParams;
  final BlocStatus<List<SubscribedClientsModel>> getAllClients;
  final int selectedSubscriber;
  final String filterClientStateSearch;
  const ClientAttachmentsState({
    this.getListAttachments = const BlocStatus.initial(),
    this.getAttachmentsParams = const GetAttachmentsParams(),
    this.getAllClients = const BlocStatus.initial(),
    this.selectedSubscriber = -1,
    this.filterClientStateSearch = '',
  });

  ClientAttachmentsState copyWith({
    BlocStatus<List<AttachmentModel>>? getListAttachments,
    GetAttachmentsParams? getAttachmentsParams,
    BlocStatus<List<SubscribedClientsModel>>? getAllClients,
    int? selectedSubscriber,
    String? filterClientStateSearch,
  }) {
    return ClientAttachmentsState(
      getListAttachments: getListAttachments ?? this.getListAttachments,
      getAttachmentsParams: getAttachmentsParams ?? this.getAttachmentsParams,
      getAllClients: getAllClients ?? this.getAllClients,
      selectedSubscriber: selectedSubscriber ?? this.selectedSubscriber,
    );
  }
}
