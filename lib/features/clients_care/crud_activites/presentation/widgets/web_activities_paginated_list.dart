import 'package:crm_smart/features/clients_care/crud_activites/presentation/widgets/web_activities_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/crud_activities_bloc.dart';

class WebActivitiesPaginatedList extends StatelessWidget {
  const WebActivitiesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    CrudActivitiesBloc _bloc = context.read<CrudActivitiesBloc>();
    return BlocBuilder<CrudActivitiesBloc, CrudActivitiesState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.getAllCrudActivitiesStatus.isFailed()) {
          return AppErrorWidget(
            message: state.getAllCrudActivitiesStatus.error ?? '',
            onPressed: () => _bloc.add(const GetAllCrudActivitiesEvent(page: 1,isNewFilter: true)),
          );
        } else if (state.getAllCrudActivitiesStatus.isEmpty()) {
          return const Center(child: AppText('لا يوجد نتائج'));
        }else if( state.getAllCrudActivitiesStatus.isLoading() && state.currentPage==1){
          return const Center(child: AppLoader(),);
        }
        return AppPaginatedList(
          listMargin: EdgeInsets.symmetric(horizontal: 20),
          hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
          isLoading: _bloc.state.getAllCrudActivitiesStatus.isLoading(),
          onLoadMore: () async {
            if(!_bloc.pageVariables.hasReachedEnd){
              _bloc.add(GetAllCrudActivitiesEvent(page: _bloc.state.currentPage + 1,isNewFilter: false,));
            }
          },
          items: _bloc.pageVariables.allList,
          itemBuilder: (context, index) =>
              WebActivityListItem(activity: _bloc.state.clientActivities[index]),
        );
      },
    );
  }
}
