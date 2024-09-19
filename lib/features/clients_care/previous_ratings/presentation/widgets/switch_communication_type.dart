import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../manager/previous_ratings_cubit.dart';

class SwitchCommunicationType extends StatelessWidget {
  const SwitchCommunicationType({super.key});

  @override
  Widget build(BuildContext context) {
    final PreviousRatingsCubit _cubit = context.read<PreviousRatingsCubit>();
    return GroupButton(
      buttons: ['الجودة الأول', 'الجودة الثاني', 'التواصل الدوري'],
      controller: GroupButtonController(
        selectedIndex: _cubit.pageVariables.typeCommunication.index,
      ),
      onSelected: (value, index, isSelected) {
        final doRefresh = _cubit.pageVariables.changeTypeCommunication(index);
        if (doRefresh) _cubit.getPreviousRatings();
      },
      isRadio: true,
      options: GroupButtonOptions(
        borderRadius: BorderRadius.circular(10),
        selectedColor: AppColors.primaryMain,
        buttonWidth: 0.25.sw,
        spacing: 0.02.sw,
        selectedTextStyle: AppStyles.textStyle.copyWith(
          color: Colors.white,
          fontSize: (16.0).scaleFontSize,
        ),
        unselectedTextStyle: AppStyles.textStyle.copyWith(
          fontSize: (16.0).scaleFontSize,
        ),
      ),
    );
  }
}
