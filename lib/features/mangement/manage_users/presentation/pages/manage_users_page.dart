import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/users_cubit.dart';
import '../widgets/add_user_floating_button.dart';
import '../widgets/filter_users_management_sheet.dart';
import '../widgets/users_paginated_list.dart';

class ManageUserPage extends StatefulWidget {
  const ManageUserPage({super.key});

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
        return AppScaffold(
          floatingActionButton: AddUserFloatingButton(),
          appBar: CustomAppBar(title: 'إدارة المستخدمين'),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                10.height,
                Row(
                  children: [
                    Flexible(
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
                10.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CountPaginatedList<UsersCubit, UsersState>(
                    label: 'عدد المستخدمين',
                    countSelector: (state) =>
                        _usersCubit.pageVariables.usersList.length,
                    totalCount: (state) =>
                        _usersCubit.pageVariables.totalUsersCount,
                  ),
                ),
                10.height,
                Expanded(
                  child: BlocBuilder<UsersCubit, UsersState>(
                    buildWhen: (previous, current) {
                      return previous.getUsersStatus !=
                              current.getUsersStatus &&
                          _usersCubit.pageVariables.isNewFilter;
                    },
                    builder: (context, state) {
                      return state.getUsersStatus.when(
                        loading: () => AppLoader(),
                        failure: (error, data) => AppErrorWidget(
                          message: error,
                          onPressed: () => _usersCubit.getUsers(),
                        ),
                        empty: () =>
                            AppErrorWidget(message: 'لا يوجد مستخدمين'),
                        success: (data) => const UsersPaginatedList(),
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
