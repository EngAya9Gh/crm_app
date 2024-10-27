import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/violations_cubit.dart';
import '../widgets/filter_violations_sheet.dart';
import '../widgets/violations_paginated_list.dart';

class ViolationsPage extends StatefulWidget {
  const ViolationsPage({super.key});

  @override
  State<ViolationsPage> createState() => _ViolationsPageState();
}

class _ViolationsPageState extends State<ViolationsPage> {
  late final ViolationsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ViolationsCubit>()..init;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getViolations();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'مخالفات العناية'),
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
                    onChanged: (value) => _cubit.getViolations(
                      isDebounced: true,
                    ),
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterViolationsSheet(),
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
              child: CountPaginatedList<ViolationsCubit, ViolationsState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            Expanded(
              child: BlocBuilder<ViolationsCubit, ViolationsState>(
                buildWhen: (previous, current) {
                  return previous.getViolationsStatus !=
                          current.getViolationsStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getViolationsStatus.when(
                    loading: () => AppLoader(),
                    success: (data) => ViolationsPaginatedList(),
                    empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getViolations(),
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
