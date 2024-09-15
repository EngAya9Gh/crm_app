import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/delay_after_install_cubit.dart';
import '../widgets/delay_after_install_paginated_list.dart';
import '../widgets/filter_after_delay_install_sheet.dart';

class DelayAfterInstallReportPage extends StatefulWidget {
  const DelayAfterInstallReportPage({super.key});

  @override
  State<DelayAfterInstallReportPage> createState() => _DelayAfterInstallState();
}

class _DelayAfterInstallState extends State<DelayAfterInstallReportPage> {
  late final DelayAfterInstallCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<DelayAfterInstallCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getDelayAfterInstall();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تقرير التأخير عن التركيب للعملاء'),
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
                      _cubit.filterDelayAfterInstall();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterAfterDelayInstallSheet(),
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
              child: CountPaginatedList<DelayAfterInstallCubit,
                  DelayAfterInstallState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
              ),
            ),
            Expanded(
              child:
                  BlocBuilder<DelayAfterInstallCubit, DelayAfterInstallState>(
                buildWhen: (previous, current) {
                  return previous.getDelayAfterInstallStatus !=
                          current.getDelayAfterInstallStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getDelayAfterInstallStatus.when(
                    success: (data) => DelayAfterInstallPaginatedList(),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getDelayAfterInstall(),
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
