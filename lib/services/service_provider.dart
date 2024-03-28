import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/common/manager/attachments_row_cubit/attachments_row_cubit.dart';
import '../core/common/manager/cities_cubit/cities_cubit.dart';
import '../core/di/di_container.dart';
import '../features/app/presentation/bloc/app_manager_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart';
import '../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../features/clients_list/presentation/manager/clients_list_bloc.dart';
import '../features/communication_list/presentation/manager/communication_list_bloc.dart';
import '../features/manage_participates/presentation/manager/participate_list_bloc.dart';
import '../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../features/task_management/presentation/manager/task_cubit.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      ],
      child: child,
    );
  }

  final Widget child;
}
