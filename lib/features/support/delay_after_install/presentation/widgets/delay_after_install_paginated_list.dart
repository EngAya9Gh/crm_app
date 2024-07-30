import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/delay_after_install_cubit.dart';
import 'card_delay_after_install.dart';

class DelayAfterInstallPaginatedList extends StatelessWidget {
  const DelayAfterInstallPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DelayAfterInstallCubit>();
    return BlocBuilder<DelayAfterInstallCubit, DelayAfterInstallState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.filteredList,
          onLoadMore: () {},
          // todo: uncomment this when pagination is implemented
          // onLoadMore: () => cubit.getDelayAfterInstall(
          //   fkCountry: AppConstants.currentCountry(context) ?? '',
          //   isNewFilter: false,
          // ),
          itemBuilder: (context, index) {
            return CardDelayAfterInstall(
              invoice: cubit.pageVariables.filteredList[index],
            );
          },
          isLoading: state.getDelayAfterInstallStatus.isLoading(),
          hasReachedMax: state.getDelayAfterInstallStatus.data ?? false,
          scrollController: ScrollController(),
        );
      },
    );
  }
}
