import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_elevation_sys_support_use_case.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/widgets/elevation_sys_support_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/sys_support_rating_bloc.dart';
import '../widgets/card_elevation_sys_support.dart';
import '../widgets/switch_communication_type.dart';

class SysSupportRatingPage extends StatefulWidget {
  const SysSupportRatingPage({super.key});

  @override
  State<SysSupportRatingPage> createState() => _PeriodicCommunicationState();
}

class _PeriodicCommunicationState extends State<SysSupportRatingPage> {
  late final SysSupportRatingBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<SysSupportRatingBloc>()..add(GetListSysOrSupportRatingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تقييمات النظام'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _bloc.filterEntity.searchController,
                    onChanged: (value) {
                      _bloc.add(GetListSysOrSupportRatingEvent());
                    },
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomFilterIcon(
                        onTap: () async {
                          await AppBottomSheet.show(
                            context: context,
                            child: FilterElevationSysSupportSheet(),
                          ).then(
                            (value) {
                              if (value != true) {
                                _bloc.filterEntity.returnToPreviousState;
                              }
                              setState(() {});
                            },
                          );
                        },
                      ),
                      ListenableBuilder(
                        listenable: Listenable.merge(
                          _bloc.filterEntity.listenables(),
                        ),
                        builder: (context, child) {
                          return _bloc.filterEntity.checkIfFilterIsNotEmpty()
                              ? Positioned(
                                  right: -5,
                                  top: -2,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: AppColors.statusErrorActive,
                                  ),
                                )
                              : SizedBox.shrink();
                        },
                      )
                    ],
                  ),
                ),
                8.width,
              ],
            ),
            15.height,
            SwitchElevationType(),
            15.height,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('عدد العناصر: '),
                    BlocBuilder<SysSupportRatingBloc, SysSupportRatingState>(
                      builder: (context, state) {
                        return ((state.listRating.data ?? []).isEmpty)
                            ? SizedBox.shrink()
                            : AppText('${state.listRating.data?.length ?? ''}/${state.totalCount}');
                      },
                    ),
                  ],
                )),
            Expanded(
              child: BlocBuilder<SysSupportRatingBloc, SysSupportRatingState>(
                buildWhen: (previous, current) {
                  return ((previous.listRating != current.listRating) || (previous.statusListRating != current.statusListRating));
                },
                builder: (context, state) {
                  return state.listRating.when(
                    success: (data) => AppPaginatedList(
                      hasReachedEnd: state.hasReachedEnd,
                      isLoading: state.statusListRating.isLoading(),
                      onLoadMore: () {
                        _bloc.add(GetListSysOrSupportRatingEvent(page: _bloc.filterEntity.page + 1));
                      },
                      items: data ?? [],
                      itemBuilder: (context, index) =>
                          ElevationSysOrSupportCard(elevationModel: data![index], tabElevationIndex: _bloc.filterEntity.rateTypeNotifier.value),
                    ),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () {},
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
