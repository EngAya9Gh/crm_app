import 'package:crm_smart/features/common/client_profile/invoices_tab/presentation/manager/invoices_tab_cubit/invoices_tab_cubit.dart';
import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/agent_collaborators_invoices_vm.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/employee_race_viewmodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/lastcommentclient_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/participate_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/reason_suspend.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:crm_smart/view_model/usertest_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../core/common/manager/attachments_row_cubit/attachments_row_cubit.dart';
import '../core/common/manager/cities_cubit/cities_cubit.dart';
import '../core/services/di/di_container.dart';
import '../features/app/presentation/bloc/app_manager_cubit.dart';
import '../features/app/presentation/pages/my_app.dart';
import '../features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart';
import '../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../features/sales/clients_list/presentation/manager/clients_list_bloc.dart';
import '../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart';
import '../features/task_management/presentation/manager/task_cubit.dart';

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
        BlocProvider(create: (context) => getIt<InvoicesTabCubit>()),
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
          ChangeNotifierProxyProvider<UserProvider, invoice_vm>(
            create: (_) => invoice_vm(),
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
          ChangeNotifierProvider<participate_vm>(
              create: (_) => participate_vm()),
          ChangeNotifierProvider<reason_suspend>(
              create: (_) => reason_suspend()),
          ChangeNotifierProxyProvider<invoice_vm,
              AgentsCollaboratorsInvoicesViewmodel>(
            update: (context, invoiceVm, agentCollaborateVm) {
              if (agentCollaborateVm?.invoicesList.isEmpty ?? true)
                agentCollaborateVm
                    ?.setInvoicesList(invoiceVm.listInvoicesAccept);
              return agentCollaborateVm!;
            },
            create: (_) => AgentsCollaboratorsInvoicesViewmodel(),
          ),
          ChangeNotifierProxyProvider<UserProvider, lastcommentclient_vm>(
            create: (_) => lastcommentclient_vm(),
            update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
          ),
          ChangeNotifierProvider<BranchRaceViewmodel>(
              create: (_) => BranchRaceViewmodel()),
          ChangeNotifierProvider<EmployeeRaceViewmodel>(
              create: (_) => EmployeeRaceViewmodel()),
        ],
        child: MyApp(),
      ),
    );
  }
}
