import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/manager/sys_support_rating_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

import '../../../../../core/utils/app_colors.dart';

enum ElevationSysSupportEnum {
  system(text: 'تقييمات النظام'),
  support(text: 'تقييمات الدعم الفني');

  final String text;

  const ElevationSysSupportEnum({required this.text});
}

class SwitchElevationType extends StatelessWidget {
  const SwitchElevationType({super.key});

  @override
  Widget build(BuildContext context) {
    final SysSupportRatingBloc _bloc = context.read<SysSupportRatingBloc>();
    return GroupButton(
      buttons: ElevationSysSupportEnum.values.map((e) {
        return e.text;
      }).toList(),
      controller: GroupButtonController(
        selectedIndex: _bloc.filterEntity.rateTypeNotifier == 1 ? 1 : 0,
      ),
      onSelected: (value, index, isSelected) {
        _bloc.filterEntity.rateTypeNotifier.value = index + 1;
        _bloc.add(GetListSysOrSupportRatingEvent());
      },
      isRadio: true,
      options: GroupButtonOptions(
        borderRadius: BorderRadius.circular(10),
        selectedColor: AppColors.primaryMain,
      ),
    );
  }
}
