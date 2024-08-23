import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/delay_after_install_cubit.dart';
import 'card_delay_after_install.dart';

class DelayAfterInstallPaginatedList extends StatelessWidget {
  const DelayAfterInstallPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DelayAfterInstallCubit>();
    return BlocBuilder<DelayAfterInstallCubit, DelayAfterInstallState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardDelayAfterInstall(
              invoice: cubit.pageVariables.filteredList[index],
            );
          },
        );
      },
    );
  }
}
