import 'package:crm_smart/features/clients_care/crud_activites/presentation/widgets/web_activities_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/care_activities_bloc.dart';

class WebCareActivitiesPaginatedList extends StatelessWidget {
  const WebCareActivitiesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    CareActivitiesBloc _bloc = context.read<CareActivitiesBloc>();
    return BlocBuilder<CareActivitiesBloc, CareActivitiesState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.getAllCareActivitiesStatus.isFailed()) {
          return AppErrorWidget(
            message: state.getAllCareActivitiesStatus.error ?? '',
            onPressed: () => _bloc.add(const GetAllCareActivitiesEvent(page: 1,)),
          );
        } else if (state.getAllCareActivitiesStatus.isEmpty()) {
          return const Center(child: AppText('لا يوجد نتائج'));
        }else if( state.getAllCareActivitiesStatus.isLoading() && state.currentPage==1){
          return const Center(child: AppLoader(),);
        }
        return AppPaginatedList(
          listMargin: EdgeInsets.symmetric(horizontal: 20),
          hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
          isLoading: _bloc.state.getAllCareActivitiesStatus.isLoading(),
          onLoadMore: () async {
            if(!_bloc.pageVariables.hasReachedEnd){
              _bloc.add(GetAllCareActivitiesEvent(page: _bloc.state.currentPage + 1,));
            }
          },
          items: _bloc.pageVariables.allList,
          itemBuilder: (context, index) =>
              WebActivityListItem(activity: _bloc.state.careActivities[index],isCare: true,),
        );
      },
    );
  }
}
