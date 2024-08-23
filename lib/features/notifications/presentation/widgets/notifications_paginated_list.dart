import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/notifications_cubit.dart';
import 'card_notifications.dart';

class NotificationsPaginatedList extends StatelessWidget {
  const NotificationsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardNotifications(
              notification: cubit.pageVariables.allList[index],
            );
          },
          onLoadMore: () => cubit.getNotifications(isNewFilter: false),
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
          isLoading: state.getNotificationsStatus.isLoading(),
        );
      },
    );
  }
}
