import 'package:crm_smart/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/clients_list/presentation/manager/clients_list_bloc.dart';
import '../features/communication_list/presentation/manager/communication_list_bloc.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<CommunicationListBloc>()),
        BlocProvider(create: (context) => GetIt.I<ClientsListBloc>()),
        BlocProvider(create: (context) => GetIt.I<AppManagerCubit>())
      ],
      child: child,
    );
  }

  final Widget child;
}
