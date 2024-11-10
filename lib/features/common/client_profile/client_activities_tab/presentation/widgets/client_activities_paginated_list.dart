import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../clients_care/crud_activites/presentation/widgets/mob_activities_card.dart';
import '../manager/client_activities_bloc.dart';


class ClientActivitiesPaginatedList extends StatelessWidget {
  const ClientActivitiesPaginatedList({super.key});

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
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: TimelineTile(
                alignment: TimelineAlign.end,
                afterLineStyle: LineStyle(
                  color: AppColors.primaryMain,
                ),
                beforeLineStyle: const LineStyle(
                  color: Colors.red,
                ),
                isFirst: index == 0,
                isLast:
                index == state.clientActivities.length - 1,
                indicatorStyle: IndicatorStyle(
                  width: 65.scaleIconsSize,
                  height: 65.scaleIconsSize,
                  padding: const EdgeInsets.all(5),
                  indicatorXY: 0.00,
                  indicator: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: (index & 1 == 0)
                          ? AppColors.primaryMain
                          : AppColors.secondaryMain,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                          state.clientActivities[index].startDate != null?DateFormat('dd').format(state.clientActivities[index].startDate!):"",
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          AppText(
                            state.clientActivities[index].startDate != null?DateFormat('MMM').format(state.clientActivities[index].startDate!):"",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                startChild: MobActivityListItem(activity: state.clientActivities[index],isClient: true,),
              ),
            ));
      },
    );
  }
}
