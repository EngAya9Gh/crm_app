import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/manager/sys_support_rating_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

import '../../../../../core/utils/app_colors.dart';

enum ElevationSysSupportEnum {

  support(text: ' تقييم الدعم الفني', value: 2),
  system(text: 'تقييم النظام', value: 1),
  recommand(text: 'توصية العميل', value: 3);

  final String text;
  final int value;

  const ElevationSysSupportEnum({required this.text, required this.value});
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
        selectedIndex: _bloc.filterEntity.rateTypeNotifier.value - 1,
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
