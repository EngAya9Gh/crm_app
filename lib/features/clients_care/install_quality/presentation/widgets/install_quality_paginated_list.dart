import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../manager/install_quality_cubit.dart';
import 'card_install_quality.dart';

class InstallQualityPaginatedList extends StatelessWidget {
  const InstallQualityPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstallQualityCubit>();
    return BlocBuilder<InstallQualityCubit, InstallQualityState>(
      builder: (context, state) {
        return AppPaginatedList(
          items: cubit.pageVariables.allList,
          itemBuilder: (context, index) {
            return CardInstallQuality(
              communication: cubit.pageVariables.allList[index],
              tabCareIndex: 1,
            );
          },
          isLoading: state.getInstallStatus.isLoading(),
          hasReachedEnd: cubit.pageVariables.hasReachedEnd,
          onLoadMore: () async {
            await cubit.getInstall(isNewFilter: false);
          },
        );
      },
    );
  }
}
