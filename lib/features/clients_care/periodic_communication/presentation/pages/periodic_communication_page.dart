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
import '../manager/periodic_communication_cubit.dart';
import '../widgets/filter_periodic_communication_sheet.dart';
import '../widgets/periodic_communication_count.dart';
import '../widgets/periodic_communication_paginated_list.dart';
import '../widgets/switch_communication_type.dart';

class PeriodicCommunicationPage extends StatefulWidget {
  const PeriodicCommunicationPage({super.key});

  @override
  State<PeriodicCommunicationPage> createState() =>
      _PeriodicCommunicationState();
}

class _PeriodicCommunicationState extends State<PeriodicCommunicationPage> {
  late final PeriodicCommunicationCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PeriodicCommunicationCubit>()
      ..init(AppConstants.currentUser(context)!.idUser!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getPeriodicCommunication(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'التواصل الدوري'),
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
                      child: FilterPeriodicCommunicationSheet(),
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
              child: PeriodicCommunicationCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<PeriodicCommunicationCubit,
                    PeriodicCommunicationState>(
                  buildWhen: (previous, current) {
                    return previous.getPeriodicCommunicationStatus !=
                            current.getPeriodicCommunicationStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getPeriodicCommunicationStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => PeriodicCommunicationPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getPeriodicCommunication(
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
