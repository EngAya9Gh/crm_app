import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../manager/install_quality_cubit.dart';

class SwitchCommunicationType extends StatelessWidget {
  const SwitchCommunicationType({super.key});

  @override
  Widget build(BuildContext context) {
    final InstallQualityCubit _cubit = context.read<InstallQualityCubit>();
    return GroupButton(
      buttons: ['التواصل الأول', 'التواصل الثاني'],
      controller: GroupButtonController(
        selectedIndex: _cubit.pageVariables.switchValue ? 0 : 1,
      ),
      onSelected: (value, index, isSelected) {
        if (index == 0 && _cubit.pageVariables.switchValue) return;
        if (index == 1 && !_cubit.pageVariables.switchValue) return;

        _cubit.pageVariables.changeInstallQualityType();
        _cubit.getInstall();
      },
      isRadio: true,
      options: GroupButtonOptions(
        borderRadius: BorderRadius.circular(10),
        selectedColor: AppColors.primaryColor,
      ),
    );
  }
}
