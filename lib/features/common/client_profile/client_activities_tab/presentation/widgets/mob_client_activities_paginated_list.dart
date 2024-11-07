import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../clients_care/crud_activites/presentation/widgets/mob_activities_card.dart';
import '../manager/client_activities_bloc.dart';


class MobClientActivitiesPaginatedList extends StatelessWidget {
  const MobClientActivitiesPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    ClientActivitiesBloc _bloc = context.read<ClientActivitiesBloc>();
    return BlocBuilder<ClientActivitiesBloc, ClientActivitiesState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.getClientActivitiesStatus.isFailed()) {
          return AppErrorWidget(
            message: state.getClientActivitiesStatus.error ?? '',
            onPressed: () => _bloc.add( GetAllClientActivitiesEvent(page: 1,clientId: _bloc.pageVariables.clientId)),
          );
        } else if (state.getClientActivitiesStatus.isEmpty()) {
          return const Center(child: AppText('لا يوجد نتائج'));
        }else if( state.getClientActivitiesStatus.isLoading() && state.currentPage==1){
          return const Center(child: AppLoader(),);
        }
        return AppPaginatedList(
            items: _bloc.pageVariables.allList,
            hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
            isLoading: state.getClientActivitiesStatus.isLoading(),
            onLoadMore: () {
              if(!_bloc.pageVariables.hasReachedEnd){
                _bloc.add(GetAllClientActivitiesEvent(page: _bloc.state.currentPage + 1, clientId:_bloc.pageVariables.clientId));
              }            },
            itemBuilder: (context, index) =>
                MobActivityListItem(activity: state.clientActivities[index],isClient: true,)
        );
      },
    );
  }
}
