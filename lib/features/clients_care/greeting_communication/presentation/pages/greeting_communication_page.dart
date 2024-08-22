import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/greeting_communication_cubit.dart';
import '../widgets/filter_greeting_communication_sheet.dart';
import '../widgets/greeting_communication_paginated_list.dart';

class GreetingCommunicationPage extends StatefulWidget {
  const GreetingCommunicationPage({super.key});

  @override
  State<GreetingCommunicationPage> createState() =>
      _GreetingCommunicationState();
}

class _GreetingCommunicationState extends State<GreetingCommunicationPage> {
  late final GreetingCommunicationCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<GreetingCommunicationCubit>()
      ..init(AppConstants.currentUser.idUser!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getGreetingCommunication(
        fkCountry: AppConstants.currentCountry,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الترحيب بالعملاء'),
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
                      _cubit.localFilter();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterGreetingCommunicationSheet(),
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
              child: CountPaginatedList<GreetingCommunicationCubit,
                  GreetingCommunicationState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<GreetingCommunicationCubit,
                    GreetingCommunicationState>(
                  buildWhen: (previous, current) {
                    return previous.getGreetingCommunicationStatus !=
                            current.getGreetingCommunicationStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getGreetingCommunicationStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => GreetingCommunicationPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getGreetingCommunication(
                          fkCountry: AppConstants.currentCountry,
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
