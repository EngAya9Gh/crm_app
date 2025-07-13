part of 'client_attachments_bloc.dart';

@immutable
class ClientAttachmentsState {
  final BlocStatus<List<AttachmentModel>> getListAttachments;
  final BlocStatus gettingData;
  final GetAttachmentsParams getAttachmentsParams;
  final BlocStatus<List<SubscribedClientsModel>> getAllClients;
  final int selectedSubscriber;
  final String filterClientStateSearch;
  final int totalCountItem;
  final bool isRrefresh;

  const ClientAttachmentsState({
    this.getListAttachments = const BlocStatus.initial(),
    this.getAttachmentsParams = const GetAttachmentsParams(),
    this.gettingData = const BlocStatus.initial(),
    this.getAllClients = const BlocStatus.initial(),
    this.selectedSubscriber = -1,
    this.totalCountItem = 0,
    this.isRrefresh = false,
    this.filterClientStateSearch = '',

  });

  ClientAttachmentsState copyWith({
    BlocStatus<List<AttachmentModel>>? getListAttachments,
    GetAttachmentsParams? getAttachmentsParams,
    BlocStatus<List<SubscribedClientsModel>>? getAllClients,
    int? selectedSubscriber,
    int? totalCountItem,
    bool? isRrefresh,
    String? filterClientStateSearch,
    BlocStatus? gettingData,
  }) {
    return ClientAttachmentsState(
      getListAttachments: getListAttachments ?? this.getListAttachments,
      getAttachmentsParams: getAttachmentsParams ?? this.getAttachmentsParams,
      getAllClients: getAllClients ?? this.getAllClients,
      selectedSubscriber: selectedSubscriber ?? this.selectedSubscriber,
      totalCountItem: totalCountItem ?? this.totalCountItem,
      isRrefresh: isRrefresh ?? this.isRrefresh,
      gettingData: gettingData ?? this.gettingData,
    );
  }
}
