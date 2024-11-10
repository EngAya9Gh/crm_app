import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../crud_activites/presentation/widgets/mob_activities_card.dart';
import '../manager/care_activities_bloc.dart';
import '../widgets/filter_care_activities_sheet.dart';

class CareActivitiesPage extends StatefulWidget {
  const CareActivitiesPage({Key? key}) : super(key: key);

  @override
  State<CareActivitiesPage> createState() => _CareActivitiesPageState();
  }

  class _CareActivitiesPageState extends State<CareActivitiesPage> {


  late final CareActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<CareActivitiesBloc>();
    _bloc.pageVariables.clear();
    _bloc.pageVariables.clear();
    _bloc.add(const GetAllCareActivitiesEvent(page: 1));
    _bloc.pageVariables.searchController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
          title: 'قائمة الاتصالات',
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController:
                    _bloc.pageVariables.searchController,
                    onChanged: (value) {
                      AppConstants.debounceFunction(
                            () => _bloc.add( GetAllCareActivitiesEvent(page: 1,filter: value)),
                        tag: "search_clients_contacts_list",
                        isDebounced: true,
                      );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    await AppBottomSheet.show(
                      context: context,
                      child: FilterCareActivitiesSheet(),
                    );
                  },
                ),
                SizedBox(width: 8),
              ],
            ),
            5.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('عدد العملاء: '),
                  BlocBuilder<CareActivitiesBloc, CareActivitiesState>(
                    builder: (context, state) {
                      final count = _bloc.pageVariables.allList.length;
                      final total = _bloc.pageVariables.totalCount;
                      return AppText('$count/$total');
                    },
                  ),
                ],
              )
            ),
            5.verticalSpace,
            Expanded(
              child: BlocBuilder<CareActivitiesBloc, CareActivitiesState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state.getAllCareActivitiesStatus.isFailed()) {
                    return AppErrorWidget(
                      message: state.getAllCareActivitiesStatus.error ?? '',
                      onPressed: () => _bloc.add(const GetAllCareActivitiesEvent(page: 1)),
                    );
                  } else if (state.getAllCareActivitiesStatus.isEmpty()) {
                    return const Center(child: AppText('لا يوجد نتائج'));
                  }else if( state.getAllCareActivitiesStatus.isLoading() && state.currentPage==1){
                    return const Center(child: AppLoader(),);
                  }
                  return AppPaginatedList(
                    items: _bloc.pageVariables.allList,
                    itemBuilder: (context, index) {
                      return MobActivityListItem(activity: state.careActivities[index],isCare: true,);
                    },
                    hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
                    onLoadMore: () {
                      _bloc.add(GetAllCareActivitiesEvent(page: _bloc.state.currentPage + 1));
                    },
                    isLoading: _bloc.state.getAllCareActivitiesStatus.isLoading(),

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