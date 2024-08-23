import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/evaluation_level_report_cubit.dart';
import 'card_periodic_communication.dart';

class EvaluationLevelReportPaginatedList extends StatelessWidget {
  const EvaluationLevelReportPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EvaluationLevelReportCubit>();
    return BlocBuilder<EvaluationLevelReportCubit, EvaluationLevelReportState>(
      buildWhen: (previous, current) =>
          previous.getEvaluationLevelReportStatus !=
          current.getEvaluationLevelReportStatus,
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardPeriodicCommunication(
              communication: cubit.pageVariables.filteredList[index],
              tabCareIndex: 1,
            );
          },
        );
      },
    );
  }
}
