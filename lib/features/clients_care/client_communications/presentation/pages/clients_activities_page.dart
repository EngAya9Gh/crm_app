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
import '../manager/clients_activities_bloc.dart';
import '../widgets/client_activities_list_item.dart';
import '../widgets/filter_clients_activities_sheet.dart';

class ClientsActivitiesPage extends StatefulWidget {
  const ClientsActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ClientsActivitiesPage> createState() => _ClientsActivitiesPageState();
  }

  class _ClientsActivitiesPageState extends State<ClientsActivitiesPage> {


  late final ClientsActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ClientsActivitiesBloc>();
    _bloc.pageVariables.clear();
    _bloc.pageVariables.clear();
    _bloc.add(const GetAllClientsActivitiesEvent(page: 1));
    _bloc.pageVariables.searchController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        appBar: CustomAppBar(
            title: 'قائمة الاتصالات',
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
                            () => _bloc.add( GetAllClientsActivitiesEvent(page: 1,filter: value)),
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
                      child: FilterClientsActivitiesSheet(),
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
                  BlocBuilder<ClientsActivitiesBloc, ClientsActivitiesState>(
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
              child: BlocBuilder<ClientsActivitiesBloc, ClientsActivitiesState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state.getAllClientsActivitiesStatus.isFailed()) {
                    return AppErrorWidget(
                      message: state.getAllClientsActivitiesStatus.error ?? '',
                      onPressed: () => _bloc.add(const GetAllClientsActivitiesEvent(page: 1)),
                    );
                  } else if (state.getAllClientsActivitiesStatus.isEmpty()) {
                    return const Center(child: AppText('لا يوجد نتائج'));
                  }else if( state.getAllClientsActivitiesStatus.isLoading() && state.currentPage==1){
                    return const Center(child: AppLoader(),);
                  }
                  return AppPaginatedList(
                    items: _bloc.pageVariables.allList,
                    itemBuilder: (context, index) {
                      return ClientActivityListItem(activity: state.clientActivities[index]);
                    },
                    hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
                    onLoadMore: () {
                      _bloc.add(GetAllClientsActivitiesEvent(page: _bloc.state.currentPage + 1));
                    },
                    isLoading: _bloc.state.getAllClientsActivitiesStatus.isLoading(),

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