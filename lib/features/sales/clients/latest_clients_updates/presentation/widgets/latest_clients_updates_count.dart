import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/latest_clients_updates_cubit.dart';

class LatestClientsUpdatesCount extends StatelessWidget {
  const LatestClientsUpdatesCount({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<LatestClientsUpdatesCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('عدد العملاء: '),
        BlocBuilder<LatestClientsUpdatesCubit, LatestClientsUpdatesState>(
          builder: (context, state) {
            return AppText(
              "${clientsAcceptCubit.pageVariables.latestUpdates.length}/${clientsAcceptCubit.pageVariables.totalClientsCount}",
            );
          },
        ),
      ],
    );
  }
}
