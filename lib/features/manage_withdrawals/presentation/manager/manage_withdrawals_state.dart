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
    this.withdrawalsInvoice = const PageState.init(),
    this.withdrawnDetailsState = const PageState.init(),
    this.withdrawalInvoiceDetails = const PageState.init(),
    this.updateUsersSeriesState = const BlocStatus.initial(),
    this.setApproveSeriesState = const BlocStatus.initial(),
    this.allUsers = const [],
    this.handleAllUsers = const [],
    this.handleUsersSeries = const {},
  });

  final PageState<List<UserSeries>> allUsersSeries;
  final PageState<List<InvoiceModel>> withdrawalsInvoice;
  final PageState<List<InvoiceWithdrawalSeries>> withdrawalInvoiceDetails;
  final PageState<WithdrawnDetailsModel> withdrawnDetailsState;
  final List<UserModel> allUsers;
  final List<UserWithdrawalsManager> handleAllUsers;
  final Map<UserWithdrawalsManager?, List<UserWithdrawalsManager>> handleUsersSeries;
  final BlocStatus updateUsersSeriesState;
  final BlocStatus setApproveSeriesState;

  ManageWithdrawalsState copyWith({
    PageState<List<UserSeries>>? allUsersSeries,
    PageState<List<InvoiceModel>>? withdrawalsInvoice,
    PageState<List<InvoiceWithdrawalSeries>>? withdrawalInvoiceDetails,
    List<UserModel>? allUsers,
    List<UserWithdrawalsManager>? handleAllUsers,
    Map<UserWithdrawalsManager?, List<UserWithdrawalsManager>>? handleUsersSeries,
    BlocStatus? updateUsersSeriesState,
    BlocStatus? setApproveSeriesState,
    PageState<WithdrawnDetailsModel>? withdrawnDetailsState,
  }) {
    return ManageWithdrawalsState(
      withdrawalInvoiceDetails: withdrawalInvoiceDetails ?? this.withdrawalInvoiceDetails,
      allUsersSeries: allUsersSeries ?? this.allUsersSeries,
      withdrawalsInvoice: withdrawalsInvoice ?? this.withdrawalsInvoice,
      allUsers: allUsers ?? this.allUsers,
      handleAllUsers: handleAllUsers ?? this.handleAllUsers,
      handleUsersSeries: handleUsersSeries ?? this.handleUsersSeries,
      updateUsersSeriesState: updateUsersSeriesState ?? this.updateUsersSeriesState,
      setApproveSeriesState: setApproveSeriesState ?? this.setApproveSeriesState,
      withdrawnDetailsState: withdrawnDetailsState ?? this.withdrawnDetailsState,
    );
  }
}
