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
import '../manager/install_quality_cubit.dart';
import '../widgets/delay_after_install_count.dart';
import '../widgets/delay_after_install_paginated_list.dart';
import '../widgets/filter_after_delay_install_sheet.dart';
import '../widgets/switch_communication_type.dart';

class InstallQualityPage extends StatefulWidget {
  const InstallQualityPage({super.key});

  @override
  State<InstallQualityPage> createState() => _InstallQualityState();
}

class _InstallQualityState extends State<InstallQualityPage> {
  late final InstallQualityCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<InstallQualityCubit>()
      ..init(AppConstants.currentUser(context)!.idUser!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getInstall(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'جودة التركيب والتدريب'),
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
                      _cubit.filterInstall();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterInstallQualitySheet(),
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
            SwitchCommunicationType(),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DelayAfterInstallCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<InstallQualityCubit, InstallQualityState>(
                  buildWhen: (previous, current) {
                    return previous.getInstallStatus !=
                            current.getInstallStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getInstallStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => InstallQualityPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getInstall(
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
