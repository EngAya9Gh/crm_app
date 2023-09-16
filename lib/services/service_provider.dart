import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
        BlocProvider(
          create: (context) => GetIt.I<CommunicationListBloc>(),
        )
      ],
      child: child,
    );
  }

  final Widget child;
}
