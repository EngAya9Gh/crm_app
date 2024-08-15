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
import '../manager/previous_ratings_cubit.dart';
import '../widgets/previous_ratings_count.dart';
import '../widgets/previous_ratings_paginated_list.dart';
import '../widgets/previous_ratings_sheet.dart';
import '../widgets/switch_communication_type.dart';

class PreviousRatingsPage extends StatefulWidget {
  const PreviousRatingsPage({super.key});

  @override
  State<PreviousRatingsPage> createState() => _PreviousRatingsState();
}

class _PreviousRatingsState extends State<PreviousRatingsPage> {
  late final PreviousRatingsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PreviousRatingsCubit>()
      ..init(AppConstants.currentUser(context)!.idUser!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getPreviousRatings();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تقرير إعادة التقييم'),
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
                      _cubit.filterPreviousRatings();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: PreviousRatingsSheet(),
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
              child: PreviousRatingsCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<PreviousRatingsCubit, PreviousRatingsState>(
                  buildWhen: (previous, current) {
                    return previous.getPreviousRatingsStatus !=
                            current.getPreviousRatingsStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getPreviousRatingsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => PreviousRatingsPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getPreviousRatings(),
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
