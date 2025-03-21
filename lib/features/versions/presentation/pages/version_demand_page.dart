import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_filter_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/versions/domain/entity/filter_demand_entity.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_demands_usecase.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/widgets/demand_card.dart';
import 'package:crm_smart/features/versions/presentation/widgets/filter_get_demand_sheet.dart';
import 'package:crm_smart/features/versions/presentation/widgets/order_new_version_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';

class VersionOrderPage extends StatefulWidget {
  const VersionOrderPage({super.key});

  @override
  State<VersionOrderPage> createState() => _VersionOrderPageState();
}

class _VersionOrderPageState extends State<VersionOrderPage> {
  late final VersionsBloc _bloc;
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<bool> pressbackNotFilter = ValueNotifier(false);
  @override
  void initState() {
    _bloc = context.read<VersionsBloc>()..resetFilter();
    _bloc.add(GetDenmadsEvent(params: GetDemandParams(page: 1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'طلبات التحديثات', showBackButton: true),
      floatingActionButton: (context.read<PrivilegesCubit>().checkPrivilege("337"))
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryMain,
              onPressed: () {
                AppConstants.showAppDialog(
                  child: OrderNewVersionDialog(),
                ).then(
                  (value) {
                    if (value) _bloc.add(GetDenmadsEvent(params: GetDemandParams(page: 1)));
                  },
                );
              },
              child: Icon(
                Icons.add_circle_outline_sharp,
                color: AppColors.white,
              ),
            )
          : null,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<VersionsBloc, VersionsState>(
          builder: (context, state) {
            return Column(
              children: [
                10.height,
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchWidget(
                        searchController: searchController,
                        onChanged: (value) {
                          AppConstants.debounceFunction(
                            () => _bloc.add(GetDenmadsEvent(params: GetDemandParams(page: 1, filter: value))),
                            tag: "search_demand_list",
                            isDebounced: true,
                          );
                        },
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomFilterIcon(
                          onTap: () async {
                            await AppBottomSheet.show(
                              // onDismissed: () {
                              //   _bloc.filterEntity = state.filterEntity.returnToPreviousState;
                              //   _bloc.filterEntity.returnToPreviousState;
                              // },
                              // onCancelFilter: () {
                              //   _bloc.filterEntity = state.filterEntity.returnToPreviousState;
                              //   _bloc.filterEntity.returnToPreviousState;
                              // },
                              context: context,
                              child: FilterGetDemandSheet(
                                bloc: _bloc,
                              ),
                            ).then(
                              (value) {
                                if (!(value ?? false)) {
                                  _bloc.filterEntity = _bloc.filterEntity.fromParams(state.params);
                                  pressbackNotFilter.value = !pressbackNotFilter.value;
                                }
                              },
                            );
                          },
                        ),
                        ValueListenableBuilder(
                          valueListenable: pressbackNotFilter,
                          builder: (context, value, child) => ListenableBuilder(
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
                          ),
                        ),
                      ],
                    ),
                    8.width,
                  ],
                ),
                10.height,
                ((state.getListDemands.data ?? []).isEmpty)
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText('عدد العناصر: '),
                            AppText('${state.getListDemands.data?.length ?? ''}/${state.totalDataCount}'),
                          ],
                        )),
                Expanded(
                  child: state.getListDemands.when(
                    success: (data) => AppPaginatedList(
                      items: data ?? [],
                      hasReachedEnd: state.hasReachedMax,
                      isLoading: state.getDemandStatus.isLoading(),
                      onLoadMore: () {
                        if (!state.hasReachedMax) {
                          _bloc.filterEntity.currentPage = _bloc.filterEntity.currentPage + 1;
                          _bloc.add(GetDenmadsEvent(params: state.params.copyWith(page: _bloc.filterEntity.currentPage)));
                        }
                      },
                      itemBuilder: (context, index) {
                        var status = (DemandVersionStatus.values.firstWhereOrNull(
                              (element) => element.text == state.getListDemands.data?[index].status,
                            ) ??
                            DemandVersionStatus.review);
                        var item = state.getListDemands.data![index];
                        return demandCardWidget(status: status, item: item);
                      },
                    ),
                    empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _bloc.add(GetDenmadsEvent()),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
