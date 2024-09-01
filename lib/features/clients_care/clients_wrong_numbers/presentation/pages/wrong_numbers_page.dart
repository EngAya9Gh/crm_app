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
import '../manager/wrong_numbers_cubit.dart';
import '../widgets/filter_wrong_numbers_sheet.dart';
import '../widgets/wrong_numbers_paginated_list.dart';

class WrongNumbersPage extends StatefulWidget {
  const WrongNumbersPage({super.key});

  @override
  State<WrongNumbersPage> createState() => _WrongNumbersState();
}

class _WrongNumbersState extends State<WrongNumbersPage> {
  late final WrongNumbersCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<WrongNumbersCubit>()
      ..init(AppConstants.currentUser.idUser!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getWrongNumbers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'عملاء أرقامهم خاطئة'),
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
                    onChanged: (value) => _cubit.getWrongNumbers(
                      isDebounced: true,
                    ),
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterWrongNumbersSheet(),
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
              child: CountPaginatedList<WrongNumbersCubit, WrongNumbersState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            Expanded(
              child: BlocBuilder<WrongNumbersCubit, WrongNumbersState>(
                buildWhen: (previous, current) {
                  return previous.getWrongNumbersStatus !=
                          current.getWrongNumbersStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getWrongNumbersStatus.when(
                    loading: () => AppLoader(),
                    success: (data) => WrongNumbersPaginatedList(),
                    empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getWrongNumbers(),
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
