import 'package:crm_smart/features/clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart';
import 'package:crm_smart/features/common/client_profile/client_activities_tab/presentation/manager/client_activities_bloc.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../core/common/manager/attachments_row_cubit/attachments_row_cubit.dart';
import '../core/common/widgets/restart_app_widget.dart';
import '../core/services/di/di_container.dart';
import '../features/app/presentation/bloc/app_manager_cubit.dart';
import '../features/app/presentation/pages/my_app.dart';
import '../features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart';
import '../features/clients_care/client_communications/presentation/manager/care_activities_bloc.dart';
import '../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart';
import '../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart';
import '../features/clients_care/crud_activites/presentation/manager/crud_activities_bloc.dart';
import '../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart';
import '../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart';
import '../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart';
import '../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart';
import '../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart';
import '../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart';
import '../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart';
import '../features/common/branches/presentation/manager/branches_cubit.dart';
import '../features/common/cities/presentation/manager/cities_cubit.dart';
import '../features/common/client_profile/client_dates_tab/presentation/manager/clients_dates_cubit.dart';
import '../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart';
import '../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../features/common/regions/presentation/manager/regions_cubit.dart';
import '../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart';
import '../features/finance/client_dept/presentation/management/client_dept_bloc.dart';
import '../features/finance/clients_attachments/presentation/manager/client_attachments_bloc.dart';
import '../features/home/presentation/manager/web_home_page_cubit.dart';
import '../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart';
import '../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart';
import '../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart';
import '../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../features/mangement/manage_users/presentation/manager/users_cubit.dart';
import '../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../features/notifications/presentation/manager/notifications_cubit.dart';
import '../features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart';
import '../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart';
import '../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import '../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart';
import '../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart';
import '../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart';
import '../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart';
import '../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart';
import '../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart';
import '../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart';
import '../features/sales/packages_offers/presentation/manager/packages_offers_bloc.dart';
import '../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart';
import '../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart';
import '../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart';
import '../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart';
import '../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart';
import '../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart';
import '../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart';
import '../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart';
import '../features/support/dates_table/presentation/manager/dates_table_cubit.dart';
import '../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart';
import '../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart';
import '../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart';
import '../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart';
import '../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart';
import '../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart';
import '../features/task_management/presentation/manager/task_cubit.dart';
import '../provider/config_vm.dart';
import '../provider/loadingprovider.dart';
import '../provider/manage_provider.dart';
import '../provider/selected_button_provider.dart';
import '../provider/switch_provider.dart';
import '../view_model/activity_vm.dart';
import '../view_model/branch_race_viewmodel.dart';
import '../view_model/client_vm.dart';
import '../view_model/comment.dart';
import '../view_model/communication_vm.dart';
import '../view_model/company_vm.dart';
import '../view_model/country_vm.dart';
import '../view_model/datetime_vm.dart';
import '../view_model/employee_race_viewmodel.dart';
import '../view_model/event_provider.dart';
import '../view_model/invoice_vm.dart';
import '../view_model/maincity_vm.dart';
import '../view_model/product_vm.dart';
import '../view_model/reason_suspend.dart';
import '../view_model/regoin_vm.dart';
import '../view_model/ticket_vm.dart';
import '../view_model/typeclient.dart';
import '../view_model/user_vm_provider.dart';
import '../view_model/usertest_vm.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /* Blocs and Cubits */
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<SpecialClientsBloc>()),
        BlocProvider(create: (context) => getIt<ClientsListBloc>()),
        BlocProvider(create: (context) => getIt<AppManagerCubit>()),
        BlocProvider(create: (context) => getIt<PrivilegesCubit>()),
        BlocProvider(create: (context) => getIt<TaskCubit>()),
        BlocProvider(create: (context) => getIt<ParticipateListBloc>()),
        BlocProvider(create: (context) => getIt<CitiesCubit>()),
        BlocProvider(create: (context) => getIt<AttachmentsRowCubit>()),
        BlocProvider(create: (context) => getIt<ClientAttachmentsBloc>()),
        BlocProvider(create: (context) => getIt<TicketsCubit>()),
        BlocProvider(create: (context) => getIt<AddTicketCubit>()),
        BlocProvider(create: (context) => getIt<EditTicketCubit>()),
        BlocProvider(create: (context) => getIt<SupportTabCubit>()),
        BlocProvider(create: (context) => getIt<InvoicesSectionCubit>()),
        BlocProvider(create: (context) => getIt<DatesTableCubit>()),
        BlocProvider(create: (context) => getIt<AgentsDistributorsCubit>()),
        BlocProvider(
            create: (context) => getIt<AgentsDistributorsActionsCubit>()),
        BlocProvider(
            create: (context) => getIt<AgentsDistributorsProfileBloc>()),
        BlocProvider(create: (context) => getIt<WaitingAgentsCubit>()),
        BlocProvider(create: (context) => getIt<AdvancedCofigsCubit>()),
        BlocProvider(create: (context) => getIt<GeneralCofigsCubit>()),
        BlocProvider(create: (context) => getIt<ClientsAcceptCubit>()),
        BlocProvider(create: (context) => getIt<BranchesCubit>()),
        BlocProvider(create: (context) => getIt<LatestClientsUpdatesCubit>()),
        BlocProvider(create: (context) => getIt<UsersCubit>()),
        BlocProvider(create: (context) => getIt<ManageWithdrawalsCubit>()),
        BlocProvider(create: (context) => getIt<SupportClientsAcceptCubit>()),
        BlocProvider(create: (context) => getIt<DelayInstallReportsCubit>()),
        BlocProvider(create: (context) => getIt<ExceededClientsCubit>()),
        BlocProvider(create: (context) => getIt<DelayAfterInstallCubit>()),
        BlocProvider(create: (context) => getIt<FinancePendingCubit>()),
        BlocProvider(create: (context) => getIt<PendingInvoicesCubit>()),
        BlocProvider(create: (context) => getIt<ClientsDebtsCubit>()),
        BlocProvider(
            create: (context) => getIt<ClientsTransferApprovalsCubit>()),
        BlocProvider(create: (context) => getIt<InstallQualityCubit>()),
        BlocProvider(create: (context) => getIt<PreviousRatingsCubit>()),
        BlocProvider(create: (context) => getIt<UsersTypeCubit>()),
        BlocProvider(create: (context) => getIt<EmployeesSalesReportsCubit>()),
        BlocProvider(create: (context) => getIt<SupportClientsInvoicesCubit>()),
        BlocProvider(create: (context) => getIt<ClientsInstallReportsCubit>()),
        BlocProvider(create: (context) => getIt<RegionsSalesReportsCubit>()),
        BlocProvider(create: (context) => getIt<ProductsSalesReportsCubit>()),
        BlocProvider(create: (context) => getIt<ClientsDebtsReportsCubit>()),
        BlocProvider(create: (context) => getIt<ClientsStatusReportsCubit>()),
        BlocProvider(create: (context) => getIt<GreetingCommunicationCubit>()),
        BlocProvider(create: (context) => getIt<PeriodicCommunicationCubit>()),
        BlocProvider(create: (context) => getIt<ClientsCareReportsCubit>()),
        BlocProvider(create: (context) => getIt<EvaluationLevelReportCubit>()),
        BlocProvider(
            create: (context) => getIt<PeriodicCommunicationReportsCubit>()),
        BlocProvider(create: (context) => getIt<NotificationsCubit>()),
        BlocProvider(create: (context) => getIt<ClientDeptBloc>()),
        BlocProvider(create: (context) => getIt<VersionsBloc>()),
        BlocProvider(create: (context) => getIt<RegionsCubit>()),
        BlocProvider(create: (context) => getIt<LevelsCubit>()),
        BlocProvider(create: (context) => getIt<PrivilegesCubit>()),
        BlocProvider(create: (context) => getIt<WithdrawnInvoicesCubit>()),
        BlocProvider(create: (context) => getIt<PackagesOffersBloc>()),
        BlocProvider(
            create: (context) => getIt<ManageWithdrawnInvoicesCubit>()),
        BlocProvider(create: (context) => getIt<DeletedInvoicesCubit>()),
        BlocProvider(create: (context) => getIt<ClientLogsTabCubit>()),
        BlocProvider(create: (context) => getIt<WrongNumbersCubit>()),
        BlocProvider(create: (context) => getIt<NotUsingSystemCubit>()),
        BlocProvider(create: (context) => getIt<WebHomePageCubit>()),
        BlocProvider(create: (context) => getIt<DatesTimelineBloc>()),
        BlocProvider(create: (context) => getIt<ViolationsCubit>()),
        BlocProvider(create: (context) => getIt<AddClientContactBloc>()),
        BlocProvider(create: (context) => getIt<ClientsContactsBloc>()),
        BlocProvider(create: (context) => getIt<CareActivitiesBloc>()),
        BlocProvider(create: (context) => getIt<CrudActivitiesBloc>()),
        BlocProvider(create: (context) => getIt<ClientsDatesCubit>()),
        BlocProvider(create: (context) => getIt<ClientActivitiesBloc>()),
      ],
      /* Providers */
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<switch_provider>(
              create: (_) => switch_provider()),
          ChangeNotifierProvider<selected_button_provider>(
              create: (_) => selected_button_provider()),
          ChangeNotifierProvider<country_vm>(create: (_) => country_vm()),
          ChangeNotifierProxyProvider<UserProvider, config_vm>(
            create: (_) => config_vm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<LoadProvider>(create: (_) => LoadProvider()),
          ChangeNotifierProxyProvider<UserProvider, product_vm>(
            create: (_) => product_vm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<manage_provider>(
              create: (_) => manage_provider()),
          ChangeNotifierProxyProvider<UserProvider, RegionProvider>(
            create: (_) => RegionProvider(),
            update: (ctx, value, prev) =>
                prev!..setCurrentUser(value.currentUser),
          ),
          ChangeNotifierProxyProvider<UserProvider, ClientProvider>(
            create: (_) => ClientProvider(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProxyProvider<UserProvider, usertest_vm>(
            create: (_) => usertest_vm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProxyProvider<UserProvider, InvoiceVm>(
            create: (_) => InvoiceVm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProxyProvider<UserProvider, MainCityProvider>(
            create: (_) => MainCityProvider(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<ClientTypeProvider>(
              create: (_) => ClientTypeProvider()),
          ChangeNotifierProvider<EventProvider>(
            create: (_) => EventProvider(),
          ),
          ChangeNotifierProxyProvider<UserProvider, TicketVM>(
            create: (_) => TicketVM(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<comment_vm>(create: (_) => comment_vm()),
          ChangeNotifierProxyProvider<UserProvider, CommunicationVm>(
            create: (_) => CommunicationVm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<datetime_vm>(create: (_) => datetime_vm()),
          ChangeNotifierProvider<ActivityProvider>(
              create: (_) => ActivityProvider()),
          ChangeNotifierProvider<CompanyProvider>(
              create: (_) => CompanyProvider()),
          ChangeNotifierProvider<reason_suspend>(
              create: (_) => reason_suspend()),
          ChangeNotifierProvider<BranchRaceViewmodel>(
              create: (_) => BranchRaceViewmodel()),
          ChangeNotifierProvider<EmployeeRaceViewmodel>(
              create: (_) => EmployeeRaceViewmodel()),
        ],
        child: RestartAppWidget(child: MyApp()),
      ),
    );
  }
}
