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
import '../manager/delay_after_install_cubit.dart';
import '../widgets/delay_after_install_count.dart';
import '../widgets/delay_after_install_paginated_list.dart';
import '../widgets/filter_after_delay_install_sheet.dart';

class DelayAfterInstallPage extends StatefulWidget {
  const DelayAfterInstallPage({super.key});

  @override
  State<DelayAfterInstallPage> createState() => _DelayAfterInstallState();
}

class _DelayAfterInstallState extends State<DelayAfterInstallPage> {
  late final DelayAfterInstallCubit delayInstallCubit;

  @override
  void initState() {
    delayInstallCubit = context.read<DelayAfterInstallCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await delayInstallCubit.getDelayAfterInstall(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    searchController:
                        delayInstallCubit.pageVariables.searchController,
                    onChanged: (value) {
                      delayInstallCubit.filterDelayAfterInstall();
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
              child: DelayAfterInstallCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child:
                    BlocBuilder<DelayAfterInstallCubit, DelayAfterInstallState>(
                  buildWhen: (previous, current) {
                    return previous.getDelayAfterInstallStatus !=
                            current.getDelayAfterInstallStatus &&
                        delayInstallCubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getDelayAfterInstallStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => DelayAfterInstallPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => delayInstallCubit.getDelayAfterInstall(
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
