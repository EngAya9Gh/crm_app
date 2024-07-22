import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/users_cubit.dart';
import '../widgets/filter_users_management_sheet.dart';
import '../widgets/users_paginated_list.dart';
import 'add_user_floating_button.dart';

class ManageUserPage extends StatefulWidget {
  const ManageUserPage({Key? key}) : super(key: key);

  @override
  State<ManageUserPage> createState() => _ManageUserPageState();
}

class _ManageUserPageState extends State<ManageUserPage> {
  late UsersCubit _usersCubit;

  @override
  void initState() {
    _usersCubit = context.read<UsersCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          floatingActionButton: AddUserFloatingButton(),
          appBar: CustomAppBar(context: context, title: 'إدارة المستخدمين'),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                15.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchWidget(
                        hint: 'اسم الموظف...',
                        searchController:
                            _usersCubit.pageVariables.searchController,
                        onChanged: (value) {
                          _usersCubit.getUsers(isDebounced: true);
                        },
                      ),
                    ),
                    CustomFilterIcon(
                      onTap: () async {
                        final value = await AppBottomSheet.show(
                          context: context,
                          child: FilterUsersManagementSheet(),
                        );
                        if (value != true) {
                          _usersCubit.returnToPreviousState();
                        }
                      },
                    ),
                    8.width,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        'عدد المستخدمين',
                        style: context.textTheme.titleMedium,
                      ),
                      BlocBuilder<UsersCubit, UsersState>(
                        builder: (context, state) {
                          return AppText(
                            '${_usersCubit.pageVariables.usersList.length}/${_usersCubit.pageVariables.totalUsersCount}',
                            style: context.textTheme.titleMedium,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<UsersCubit, UsersState>(
                    buildWhen: (previous, current) {
                      return previous.getUsersStatus !=
                              current.getUsersStatus &&
                          _usersCubit.pageVariables.isNewFilter;
                    },
                    builder: (context, state) {
                      if (state.getUsersStatus.isLoading()) {
                        return CustomLoadingIndicator();
                      } else if (state.getUsersStatus.isFailed()) {
                        return CustomErrorWidget(
                          message: state.getUsersStatus.error,
                          onPressed: () => _usersCubit.getUsers(),
                        );
                      } else if (_usersCubit.pageVariables.usersList.isEmpty) {
                        return CustomErrorWidget(
                          message: 'لا يوجد مستخدمين',
                        );
                      }

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: UsersPaginatedList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
