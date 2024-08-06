import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_list_bloc.dart';

class ClientsListCount extends StatelessWidget {
  const ClientsListCount({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ClientsListBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد العملاء: ',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<ClientsListBloc, ClientsListState>(
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                "${bloc.pageVariables.allList.length} / ${bloc.pageVariables.totalCount}",
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
