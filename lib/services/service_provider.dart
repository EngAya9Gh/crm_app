import 'package:crm_smart/features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart';
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
import '../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart';
import '../features/common/cities/presentation/manager/cities_cubit.dart';
import '../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart';
import '../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart';
import '../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart';
import '../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../features/sales/clients_list/presentation/manager/clients_list_bloc.dart';
import '../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart';
import '../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart';
import '../features/support/dates_table/presentation/manager/dates_table_cubit.dart';
import '../features/task_management/presentation/manager/task_cubit.dart';
import '../provider/bottomNav.dart';
import '../provider/config_vm.dart';
import '../provider/loadingprovider.dart';
import '../provider/manage_provider.dart';
import '../provider/selected_button_provider.dart';
import '../provider/switch_provider.dart';
import '../view_model/activity_vm.dart';
import '../view_model/approve_vm.dart';
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
import '../view_model/lastcommentclient_vm.dart';
import '../view_model/maincity_vm.dart';
import '../view_model/notify_vm.dart';
import '../view_model/product_vm.dart';
import '../view_model/reason_suspend.dart';
import '../view_model/regoin_vm.dart';
import '../view_model/ticket_vm.dart';
import '../view_model/typeclient.dart';
import '../view_model/user_vm_provider.dart';
import '../view_model/usertest_vm.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /* Blocs and Cubits */
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<CommunicationListBloc>()),
        BlocProvider(create: (context) => getIt<ClientsListBloc>()),
        BlocProvider(create: (context) => getIt<AppManagerCubit>()),
        BlocProvider(create: (context) => getIt<PrivilegeCubit>()),
        BlocProvider(create: (context) => getIt<TaskCubit>()),
        BlocProvider(create: (context) => getIt<ParticipateListBloc>()),
        BlocProvider(create: (context) => getIt<CitiesCubit>()),
        BlocProvider(create: (context) => getIt<AttachmentsRowCubit>()),
        BlocProvider(create: (context) => getIt<TicketsCubit>()),
        BlocProvider(create: (context) => getIt<AddTicketCubit>()),
        BlocProvider(create: (context) => getIt<EditTicketCubit>()),
        BlocProvider(create: (context) => getIt<SupportTabCubit>()),
        BlocProvider(create: (context) => getIt<InvoicesSectionCubit>()),
        BlocProvider(create: (context) => getIt<DatesTableCubit>()),
        BlocProvider(create: (context) => getIt<AgentsDistributorsCubit>()),
        BlocProvider(
            create: (context) => getIt<AgentsDistributorsActionsCubit>()),
        BlocProvider(create: (context) => getIt<WaitingAgentsCubit>()),
        BlocProvider(create: (context) => getIt<AdvancedCofigsCubit>()),
        BlocProvider(create: (context) => getIt<GeneralCofigsCubit>()),
        BlocProvider(create: (context) => getIt<ClientsAcceptCubit>()),
        BlocProvider(create: (context) => getIt<RegionsCubit>()),
        BlocProvider(create: (context) => getIt<LatestClientsUpdatesCubit>()),
      ],
      /* Providers */
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
              create: (_) => UserProvider()..getUsersVm()),
          ChangeNotifierProvider<navigatorProvider>(
              create: (_) => navigatorProvider()),
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
          ChangeNotifierProxyProvider<UserProvider, notifyvm>(
            create: (_) => notifyvm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProxyProvider<UserProvider, approve_vm>(
            create: (_) => approve_vm(),
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
          ChangeNotifierProxyProvider<UserProvider, communication_vm>(
            create: (_) => communication_vm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<datetime_vm>(create: (_) => datetime_vm()),
          ChangeNotifierProvider<ActivityProvider>(
              create: (_) => ActivityProvider()),
          ChangeNotifierProvider<CompanyProvider>(
              create: (_) => CompanyProvider()),
          ChangeNotifierProvider<reason_suspend>(
              create: (_) => reason_suspend()),
          ChangeNotifierProxyProvider<UserProvider, lastcommentclient_vm>(
            create: (_) => lastcommentclient_vm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
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
