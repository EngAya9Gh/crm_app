import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../clients_care/crud_activites/presentation/widgets/web_activities_card.dart';
import '../manager/client_activities_bloc.dart';

class WebClientActivitiesPaginatedList extends StatelessWidget {
  const WebClientActivitiesPaginatedList({super.key});

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
          listMargin: EdgeInsets.symmetric(horizontal: 20),
          hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
          isLoading: _bloc.state.getClientActivitiesStatus.isLoading(),
          onLoadMore: () async {
            if(!_bloc.pageVariables.hasReachedEnd){
              _bloc.add(GetAllClientActivitiesEvent(page: _bloc.state.currentPage + 1, clientId:_bloc.pageVariables.clientId));
            }
          },
          items: _bloc.pageVariables.allList,
          itemBuilder: (context, index) =>
              WebActivityListItem(activity: _bloc.state.clientActivities[index],isClient: true,),
        );
      },
    );
  }
}
