import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/install_quality_cubit.dart';

class DelayAfterInstallCount extends StatelessWidget {
  const DelayAfterInstallCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstallQualityCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'عدد العملاء: ',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<InstallQualityCubit, InstallQualityState>(
          builder: (context, state) {
            return Text(
              "${cubit.pageVariables.filteredList.length}",
              // "${cubit.pageVariables.allClientsList.length}/${cubit.pageVariables.totalClientsCount}",
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
