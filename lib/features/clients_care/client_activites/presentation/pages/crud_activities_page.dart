import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/client_activites/presentation/pages/add_activity_page.dart';
import 'package:crm_smart/features/clients_care/client_communications/data/models/client_activity_model.dart';
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
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/crud_activities_bloc.dart';
import '../widgets/crud_activities_list_item.dart';
import '../widgets/filter_crud_activities_sheet.dart';

class CrudActivitiesPage extends StatefulWidget {
  const CrudActivitiesPage({Key? key}) : super(key: key);

  @override
  State<CrudActivitiesPage> createState() => _CrudActivitiesPageState();
  }

  class _CrudActivitiesPageState extends State<CrudActivitiesPage> {


  late final CrudActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<CrudActivitiesBloc>();
    _bloc.pageVariables.clear();
    _bloc.add(const GetAllCrudActivitiesEvent(page: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        appBar: CustomAppBar(
            title: 'قائمة النشاطات',
          actions: [
            AppTextButton(child: Icon(Icons.add_box_outlined,color: AppColors.white,),
              onPressed: ()async{
             AppNavigator.go(AddActivityPage(), isNew: false,);
            },)          ]
        ),
        body: Column(
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
                            () => _bloc.add( GetAllCrudActivitiesEvent(page: 1,filter: value)),
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
                      child: FilterCrudActivitiesSheet(),
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
                  BlocBuilder<CrudActivitiesBloc, CrudActivitiesState>(
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
              child: BlocBuilder<CrudActivitiesBloc, CrudActivitiesState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state.getAllCrudActivitiesStatus.isFailed()) {
                    return AppErrorWidget(
                      message: state.getAllCrudActivitiesStatus.error ?? '',
                      onPressed: () => _bloc.add(const GetAllCrudActivitiesEvent(page: 1)),
                    );
                  } else if (state.getAllCrudActivitiesStatus.isEmpty()) {
                    return const Center(child: AppText('لا يوجد نتائج'));
                  }else if( state.getAllCrudActivitiesStatus.isLoading() && state.currentPage==1){
                    return const Center(child: AppLoader(),);
                  }
                  return AppPaginatedList(
                    items: _bloc.pageVariables.allList,
                    itemBuilder: (context, index) {
                      return CrudActivityListItem(activity: state.clientActivities[index]);
                    },
                    hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
                    onLoadMore: () {
                      _bloc.add(GetAllCrudActivitiesEvent(page: _bloc.state.currentPage + 1));
                    },
                    isLoading: _bloc.state.getAllCrudActivitiesStatus.isLoading(),

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