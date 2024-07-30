import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/delay_install_reports_cubit.dart';
import 'card_delay_install_report.dart';

class DelayInstallReportsPaginatedList extends StatelessWidget {
  const DelayInstallReportsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DelayInstallReportsCubit>();
    return BlocBuilder<DelayInstallReportsCubit, DelayInstallReportsState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.filteredList,
          onLoadMore: () {},
          // todo: uncomment this when pagination is implemented
          // onLoadMore: () => cubit.getDelayInstallReports(
          //   fkCountry: AppConstants.currentCountry(context) ?? '',
          //   isNewFilter: false,
          // ),
          itemBuilder: (context, index) {
            return CardDelayInstallReport(
              invoice: cubit.pageVariables.filteredList[index],
            );
          },
          isLoading: state.getDelayInstallReportsStatus.isLoading(),
          hasReachedMax: state.getDelayInstallReportsStatus.data ?? false,
          scrollController: ScrollController(),
        );
      },
    );
  }
}
