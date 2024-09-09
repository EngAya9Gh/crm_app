abstract class AppRoutesNames {
  static final _ClientProfileInClientsSubSections
      clientProfileInClientsSubSections = _ClientProfileInClientsSubSections();
}

class _ClientProfileInClientsSubSections {
  final String clientProfileInClientsList = 'client-profile-in-clients-list';
  final String clientProfileInLatestClientsUpdates =
      'client-profile-in-latest-clients-updates';
  final String clientProfileInClientsDebts = 'client-profile-in-clients-debts';
  final String clientProfileInCalenderClient =
      'client-profile-in-calender-client';
  final String clientProfileInClientsTransferApprovals =
      'client-profile-in-clients-transfer-approvals';
  final String clientProfileInPendingInvoices =
      'client-profile-in-pending-invoices';
  final String clientProfileInFinancePending =
      'client-profile-in-finance-pending';
  final String clientProfileInExceededClients =
      'client-profile-in-exceeded-clients';

  List<String> get toList => [
        AppRoutesNames
            .clientProfileInClientsSubSections.clientProfileInClientsList,
        AppRoutesNames.clientProfileInClientsSubSections
            .clientProfileInLatestClientsUpdates,
        AppRoutesNames
            .clientProfileInClientsSubSections.clientProfileInClientsDebts,
        AppRoutesNames
            .clientProfileInClientsSubSections.clientProfileInCalenderClient,
        AppRoutesNames.clientProfileInClientsSubSections
            .clientProfileInClientsTransferApprovals,
        AppRoutesNames
            .clientProfileInClientsSubSections.clientProfileInPendingInvoices,
        AppRoutesNames
            .clientProfileInClientsSubSections.clientProfileInFinancePending,
        AppRoutesNames
            .clientProfileInClientsSubSections.clientProfileInExceededClients,
      ];
}
