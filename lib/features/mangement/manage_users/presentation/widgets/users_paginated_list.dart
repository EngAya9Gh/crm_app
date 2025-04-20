import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/users_cubit.dart';
import '../widgets/custom_user_card.dart';

class UsersPaginatedList extends StatelessWidget {
  const UsersPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _usersCubit = context.read<UsersCubit>();
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: AppPaginatedList(
            items: _usersCubit.pageVariables.usersList,
            onLoadMore: () => _usersCubit.getUsers(isNewFilter: false),
            itemBuilder: (context, index) {
              return CustomUserCard(
                user: _usersCubit.pageVariables.usersList[index],
              );
            },
            isLoading: state.getUsersStatus.isLoading(),
            hasReachedEnd: _usersCubit.pageVariables.hasReachedEnd,
            scrollController: ScrollController(),
            listMargin: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
