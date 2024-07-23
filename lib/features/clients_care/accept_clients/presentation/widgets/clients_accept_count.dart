import '../../../../../core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_accept_cubit.dart';

class ClientsAcceptCount extends StatelessWidget {
  const ClientsAcceptCount({super.key});

  @override
  Widget build(BuildContext context) {
    final clientsAcceptCubit = context.read<ClientsAcceptCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد العملاء: ',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<ClientsAcceptCubit, ClientsAcceptState>(
          builder: (context, state) {
            return Text(
              "${clientsAcceptCubit.pageVariables.clientsList.length}/${clientsAcceptCubit.pageVariables.totalClientsCount}",
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
