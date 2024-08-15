import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../manager/install_quality_cubit.dart';
import 'card_install_quality.dart';

class InstallQualityPaginatedList extends StatelessWidget {
  const InstallQualityPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstallQualityCubit>();
    return BlocBuilder<InstallQualityCubit, InstallQualityState>(
      builder: (context, state) {
        return CustomPaginatedList(
          items: cubit.pageVariables.filteredList,
          itemBuilder: (context, index) {
            return CardInstallQuality(
              communication: cubit.pageVariables.filteredList[index],
              tabCareIndex: 1,
            );
          },
        );
      },
    );
  }
}
