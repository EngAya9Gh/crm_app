import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return AppPaginatedList(
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
          separatorBuilder: (context, index) => Divider(
            height: 20.h,
            thickness: 1.5,
            indent: 10.w,
          ),
        );
      },
    );
  }
}
