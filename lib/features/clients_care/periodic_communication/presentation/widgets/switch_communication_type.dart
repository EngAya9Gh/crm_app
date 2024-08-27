import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

import '../../../../../core/common/enums/periodic_communication_type_enum.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/periodic_communication_cubit.dart';

class SwitchCommunicationType extends StatelessWidget {
  const SwitchCommunicationType({super.key});

  @override
  Widget build(BuildContext context) {
    final PeriodicCommunicationCubit _cubit =
        context.read<PeriodicCommunicationCubit>();
    return GroupButton(
      buttons: PeriodicCommunicationTypeEnum.values.map((e) {
        return e.value;
      }).toList(),
      controller: GroupButtonController(
        selectedIndex: _cubit.pageVariables.switchValue ? 0 : 1,
      ),
      onSelected: (value, index, isSelected) {
        if (index == 0 && _cubit.pageVariables.switchValue) return;
        if (index == 1 && !_cubit.pageVariables.switchValue) return;

        _cubit.pageVariables.changePeriodicCommunicationType();
        _cubit.getPeriodicCommunication();
      },
      isRadio: true,
      options: GroupButtonOptions(
        borderRadius: BorderRadius.circular(10),
        selectedColor: AppColors.primaryColor,
      ),
    );
  }
}
