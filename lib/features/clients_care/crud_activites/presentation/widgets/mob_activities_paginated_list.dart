import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/crud_activities_bloc.dart';
import 'mob_activities_card.dart';

class MobActivitiesPaginatedList extends StatelessWidget {
  const MobActivitiesPaginatedList({super.key});

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
            items: _bloc.pageVariables.allList,
            hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
            isLoading: state.getAllCrudActivitiesStatus.isLoading(),
            onLoadMore: () {
              if(!_bloc.pageVariables.hasReachedEnd){
                _bloc.add(GetAllCrudActivitiesEvent(page: _bloc.state.currentPage + 1));
              }            },
            itemBuilder: (context, index) =>
                MobActivityListItem(activity: state.clientActivities[index])
        );
      },
    );
  }
}
