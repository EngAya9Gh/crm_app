import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../core/common/widgets/app_adaptive_builder.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/crud_activities_bloc.dart';
import '../widgets/filter_crud_activities_sheet.dart';
import '../widgets/mob_activities_paginated_list.dart';
import '../widgets/web_activities_paginated_list.dart';
import 'add_activity_page.dart';

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
    _bloc.add(const GetAllCrudActivitiesEvent(page: 1,isNewFilter: true));
  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
          title: 'قائمة الانشطة',
        actions: [
          AppTextButton(child: Icon(Icons.add_box_outlined,color: AppColors.white,),
            onPressed: ()async{
           AppNavigator.go(AddActivityPage(), isNew: false,);
          },)          ]
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
              child: AppLayoutBuilder(
                smallBuilder: (context) => MobActivitiesPaginatedList(),
                mediumBuilder: (context) => WebActivitiesPaginatedList(),
              )
            ),
          ],
        ),
      ),
    );
  }
}