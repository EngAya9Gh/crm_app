import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
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
          fontSize: 14.scaleFontSize,
          style: AppStyles.textStyle.copyWith(
            fontWeight: FontWeight.bold),
        ),
        BlocBuilder<ClientsListBloc, ClientsListState>(
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: AppText(
                fontSize: 14.scaleFontSize,
                "${bloc.pageVariables.allList.length} / ${bloc.pageVariables.totalCount}",
                style: AppStyles.textStyle.copyWith(
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
