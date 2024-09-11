part of 'agents_distributors_profile_bloc.dart';

class AgentsDistributorsProfileState extends Equatable {
  final BlocStatus getAgentByIdStatus;

  final StateStatus dialogProgressState;
  final List<ClientModel> clientsList;
  final StateStatus clientsStatus;
  final String? clientsError;

  final List<ProfileInvoiceModel> invoicesList;
  final StateStatus invoicesStatus;
  final String? invoicesError;

  final InvoiceModel? currentInvoice;

  final List<ProfileCommentModel> commentsList;
  final StateStatus commentsStatus;
  final String? commentsError;

  final ProfileCommentModel? addedComment;
  final StateStatus addedCommentStatus;
  final String? addedCommentError;

  final List<DateInstallationClient> dateVisitList;
  final StateStatus dateVisitStatus;
  final String? dateVisitError;

  final BlocStatus addDateVisitStatus;
  final BlocStatus crudAgentSupportFilesStatus;
  final BlocStatus localCrudAgentSupportFilesStatus;

  // _onDoneTrainingEvent
  final StateStatus doneTrainingStatus;
  final String? doneTrainingError;

  final bool? startDateSelected;

  const AgentsDistributorsProfileState({
    this.getAgentByIdStatus = const BlocStatus.initial(),
    this.clientsList = const [],
    this.clientsStatus = StateStatus.initial,
    this.clientsError,
    this.invoicesList = const [],
    this.invoicesStatus = StateStatus.initial,
    this.invoicesError,
    this.currentInvoice,
    this.dialogProgressState = StateStatus.initial,
    this.commentsList = const [],
    this.commentsStatus = StateStatus.initial,
    this.commentsError,
    this.addedComment,
    this.addedCommentStatus = StateStatus.initial,
    this.addedCommentError,
    this.dateVisitList = const [],
    this.dateVisitStatus = StateStatus.initial,
    this.dateVisitError,
    this.addDateVisitStatus = const BlocStatus.initial(),
    this.crudAgentSupportFilesStatus = const BlocStatus.initial(),
    this.localCrudAgentSupportFilesStatus = const BlocStatus.initial(),
    this.doneTrainingStatus = StateStatus.initial,
    this.doneTrainingError,
    this.startDateSelected,
  });

  AgentsDistributorsProfileState copyWith({
    BlocStatus? getAgentByIdStatus,
    List<ClientModel>? clientsList,
    StateStatus? clientsStatus,
    String? clientsError,
    List<ProfileInvoiceModel>? invoicesList,
    StateStatus? invoicesStatus,
    String? invoicesError,
    InvoiceModel? currentInvoice,
    StateStatus? dialogProgressState,
    List<ProfileCommentModel>? commentsList,
    StateStatus? commentsStatus,
    String? commentsError,
    ProfileCommentModel? addedComment,
    StateStatus? addedCommentStatus,
    String? addedCommentError,
    List<DateInstallationClient>? dateVisitList,
    StateStatus? dateVisitStatus,
    String? dateVisitError,
    BlocStatus? addDateVisitStatus,
    BlocStatus? crudAgentSupportFilesStatus,
    BlocStatus? localCrudAgentSupportFilesStatus,
    String? addDateVisitError,
    StateStatus? doneTrainingStatus,
    String? doneTrainingError,
    bool? startDateSelected,
  }) {
    return AgentsDistributorsProfileState(
      getAgentByIdStatus: getAgentByIdStatus ?? this.getAgentByIdStatus,
      clientsList: clientsList ?? this.clientsList,
      clientsStatus: clientsStatus ?? this.clientsStatus,
      clientsError: clientsError,
      invoicesList: invoicesList ?? this.invoicesList,
      invoicesStatus: invoicesStatus ?? this.invoicesStatus,
      invoicesError: invoicesError,
      currentInvoice: currentInvoice ?? this.currentInvoice,
      dialogProgressState: dialogProgressState ?? this.dialogProgressState,
      commentsList: commentsList ?? this.commentsList,
      commentsStatus: commentsStatus ?? this.commentsStatus,
      commentsError: commentsError,
      addedComment: addedComment,
      addedCommentStatus: addedCommentStatus ?? this.addedCommentStatus,
      addedCommentError: addedCommentError,
      dateVisitList: dateVisitList ?? this.dateVisitList,
      dateVisitStatus: dateVisitStatus ?? this.dateVisitStatus,
      dateVisitError: dateVisitError,
      addDateVisitStatus: addDateVisitStatus ?? this.addDateVisitStatus,
      crudAgentSupportFilesStatus:
          crudAgentSupportFilesStatus ?? this.crudAgentSupportFilesStatus,
      localCrudAgentSupportFilesStatus: localCrudAgentSupportFilesStatus ??
          this.localCrudAgentSupportFilesStatus,
      doneTrainingStatus: doneTrainingStatus ?? this.doneTrainingStatus,
      doneTrainingError: doneTrainingError,
      startDateSelected: startDateSelected ?? this.startDateSelected,
    );
  }

  @override
  List<Object?> get props => [
        getAgentByIdStatus,
        clientsList,
        clientsStatus,
        clientsError,
        invoicesList,
        invoicesStatus,
        invoicesError,
        currentInvoice,
        dialogProgressState,
        commentsList,
        commentsStatus,
        commentsError,
        addedComment,
        addedCommentStatus,
        addedCommentError,
        dateVisitList,
        dateVisitStatus,
        dateVisitError,
        addDateVisitStatus,
        crudAgentSupportFilesStatus,
        localCrudAgentSupportFilesStatus,
        doneTrainingStatus,
        doneTrainingError,
        startDateSelected,
      ];
}
