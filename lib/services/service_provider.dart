import 'package:crm_smart/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_bloc.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/di_container.dart';
import '../features/clients_list/presentation/manager/clients_list_bloc.dart';
import '../features/communication_list/presentation/manager/communication_list_bloc.dart';
import '../features/manage_privilege/presentation/manager/privilege_cubit.dart';

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
        BlocProvider(create: (context) => getIt<ParticipateListBloc>())
      ],
      child: child,
    );
  }

  final Widget child;
}
