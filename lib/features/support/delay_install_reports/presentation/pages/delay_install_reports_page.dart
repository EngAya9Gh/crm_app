import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/delay_install_reports_cubit.dart';
import '../widgets/delay_install_reports_count.dart';
import '../widgets/delay_install_reports_paginated_list.dart';
import '../widgets/filter_delay_install_reports_sheet.dart';

class DelayInstallReportsPage extends StatefulWidget {
  const DelayInstallReportsPage({super.key});

  @override
  State<DelayInstallReportsPage> createState() => _DelayInstallReportsState();
}

class _DelayInstallReportsState extends State<DelayInstallReportsPage> {
  late final DelayInstallReportsCubit delayInstallCubit;

  @override
  void initState() {
    delayInstallCubit = context.read<DelayInstallReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await delayInstallCubit.getDelayInstallReports(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تقرير التأخير عن الجدولة للعملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController:
                        delayInstallCubit.pageVariables.searchController,
                    onChanged: (value) {
                      delayInstallCubit.filterReportsLocally();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterDelayInstallReportsSheet(),
                    );
                    if (value != true) {
                      delayInstallCubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DelayInstallReportsCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<DelayInstallReportsCubit,
                    DelayInstallReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getDelayInstallReportsStatus !=
                            current.getDelayInstallReportsStatus &&
                        delayInstallCubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getDelayInstallReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => DelayInstallReportsPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () =>
                            delayInstallCubit.getDelayInstallReports(
                          fkCountry: AppConstants.currentCountry(context) ?? '',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
