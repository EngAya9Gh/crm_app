import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/latest_clients_updates_cubit.dart';

class LatestClientsUpdatesCount extends StatelessWidget {
  const LatestClientsUpdatesCount({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<LatestClientsUpdatesCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد العملاء: ',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<LatestClientsUpdatesCubit, LatestClientsUpdatesState>(
          builder: (context, state) {
            return Text(
              "${clientsAcceptCubit.pageVariables.latestUpdates.length}/${clientsAcceptCubit.pageVariables.totalClientsCount}",
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
