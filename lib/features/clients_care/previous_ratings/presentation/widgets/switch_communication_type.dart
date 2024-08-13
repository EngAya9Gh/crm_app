import 'package:crm_smart/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

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
        selectedColor: kMainColor,
      ),
    );
  }
}
