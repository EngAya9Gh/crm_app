part of 'agents_distributors_profile_bloc.dart';

class AgentsDistributorsProfileState extends Equatable {
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

  final StateStatus addDateVisitStatus;
  final String? addDateVisitError;

  AgentsDistributorsProfileState({
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
    this.addDateVisitStatus = StateStatus.initial,
    this.addDateVisitError,
  });

  AgentsDistributorsProfileState copyWith({
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
    StateStatus? addDateVisitStatus,
    String? addDateVisitError,
  }) {
    return AgentsDistributorsProfileState(
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
      addDateVisitError: addDateVisitError,
    );
  }

  @override
  List<Object?> get props => [
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
        addDateVisitError,
      ];
}
