import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/evaluation_level_report_cubit.dart';
import '../widgets/evaluation_level_report_paginated_list.dart';
import '../widgets/filter_evaluation_level_report_sheet.dart';

class EvaluationLevelReportPage extends StatefulWidget {
  const EvaluationLevelReportPage({super.key});

  @override
  State<EvaluationLevelReportPage> createState() =>
      _EvaluationLevelReportState();
}

class _EvaluationLevelReportState extends State<EvaluationLevelReportPage> {
  late final EvaluationLevelReportCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<EvaluationLevelReportCubit>()
      ..init(AppConstants.currentUser.idUser!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getPeriodicCommunication(
        fkCountry: AppConstants.currentCountry,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تقرير مستوى التقييم'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.localfilter();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterEvaluationLevelReportSheet(),
                    );
                    if (value != true) {
                      _cubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<EvaluationLevelReportCubit,
                  EvaluationLevelReportState>(
                countSelector: (state) {
                  return _cubit.pageVariables.filteredList.length;
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<EvaluationLevelReportCubit,
                  EvaluationLevelReportState>(
                buildWhen: (previous, current) {
                  return previous.getEvaluationLevelReportStatus !=
                          current.getEvaluationLevelReportStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getEvaluationLevelReportStatus.when(
                    loading: () => AppLoader(),
                    success: (data) => EvaluationLevelReportPaginatedList(),
                    empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getPeriodicCommunication(
                        fkCountry: AppConstants.currentCountry,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
