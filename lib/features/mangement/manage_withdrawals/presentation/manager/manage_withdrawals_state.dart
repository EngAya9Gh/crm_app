part of 'manage_withdrawals_cubit.dart';

class UserWithdrawalsManager extends Equatable {
  UserWithdrawalsManager(this.idUser, this.name);

  final String? idUser;
  final String? name;

  @override
  String toString() {
    return 'UserWithdrawalsManager{idUser: $idUser, name: $name}';
  }

  @override
  List<Object?> get props => [idUser, name];
}

class ManageWithdrawalsState {
  ManageWithdrawalsState({
    this.allUsersSeries = const PageState.init(),
    this.withdrawalsInvoices = const PageState.init(),
    this.withdrawnDetailsState = const PageState.init(),
    this.rejectReasonsStat = const PageState.init(),
    this.withdrawalInvoiceDetails = const PageState.init(),
    this.updateUsersSeriesState = const BlocStatus.initial(),
    this.setApproveSeriesState = const BlocStatus.initial(),
    this.deleteWithdrawnRequestStatus = const BlocStatus.initial(),
    this.actionRejectReason = const BlocStatus.initial(),
    this.allUsers = const [],
    this.handleAllUsers = const [],
    this.handleUsersSeries = const {},
    this.currentInvoice,
    this.selectedFilter = const BlocStatus.initial(),
  });

  final PageState<List<UserSeries>> allUsersSeries;
  final PageState<List<InvoiceModel>> withdrawalsInvoices;
  final PageState<List<InvoiceWithdrawalSeries>> withdrawalInvoiceDetails;
  final PageState<List<RejectReason>> rejectReasonsStat;
  final PageState<WithdrawnDetailsModel> withdrawnDetailsState;
  final List<UserModel> allUsers;
  final List<UserWithdrawalsManager> handleAllUsers;
  final Map<UserWithdrawalsManager?, List<UserWithdrawalsManager>>
      handleUsersSeries;
  final BlocStatus updateUsersSeriesState;
  final BlocStatus setApproveSeriesState;
  final BlocStatus deleteWithdrawnRequestStatus;
  final BlocStatus actionRejectReason;
  final InvoiceModel? currentInvoice;
  final BlocStatus selectedFilter;

  ManageWithdrawalsState copyWith({
    PageState<List<UserSeries>>? allUsersSeries,
    PageState<List<InvoiceModel>>? withdrawalsInvoices,
    PageState<List<InvoiceWithdrawalSeries>>? withdrawalInvoiceDetails,
    PageState<List<RejectReason>>? rejectReasonsStat,
    List<UserModel>? allUsers,
    List<UserWithdrawalsManager>? handleAllUsers,
    Map<UserWithdrawalsManager?, List<UserWithdrawalsManager>>?
        handleUsersSeries,
    BlocStatus? updateUsersSeriesState,
    BlocStatus? setApproveSeriesState,
    BlocStatus? deleteWithdrawnRequestStatus,
    BlocStatus? actionRejectReason,
    PageState<WithdrawnDetailsModel>? withdrawnDetailsState,
    InvoiceModel? currentInvoice,
    BlocStatus? selectedFilter,
  }) {
    return ManageWithdrawalsState(
      withdrawalInvoiceDetails:
          withdrawalInvoiceDetails ?? this.withdrawalInvoiceDetails,
      allUsersSeries: allUsersSeries ?? this.allUsersSeries,
      withdrawalsInvoices: withdrawalsInvoices ?? this.withdrawalsInvoices,
      allUsers: allUsers ?? this.allUsers,
      handleAllUsers: handleAllUsers ?? this.handleAllUsers,
      handleUsersSeries: handleUsersSeries ?? this.handleUsersSeries,
      updateUsersSeriesState:
          updateUsersSeriesState ?? this.updateUsersSeriesState,
      setApproveSeriesState:
          setApproveSeriesState ?? this.setApproveSeriesState,
      withdrawnDetailsState:
          withdrawnDetailsState ?? this.withdrawnDetailsState,
      deleteWithdrawnRequestStatus:
          deleteWithdrawnRequestStatus ?? this.deleteWithdrawnRequestStatus,
      rejectReasonsStat: rejectReasonsStat ?? this.rejectReasonsStat,
      actionRejectReason: actionRejectReason ?? this.actionRejectReason,
      currentInvoice: currentInvoice ?? this.currentInvoice,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
