import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/install_quality_cubit.dart';

class SwitchCommunicationType extends StatelessWidget {
  const SwitchCommunicationType({super.key});

  @override
  Widget build(BuildContext context) {
    final InstallQualityCubit _cubit = context.read<InstallQualityCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppText('التواصل الثاني'),
        StatefulBuilder(
          builder: (context, refresh) {
            return Switch(
              value: _cubit.pageVariables.switchValue,
              onChanged: (value) {
                _cubit.pageVariables.changeInstallQualityType();
                refresh(() {});
                _cubit.getInstall(
                  fkCountry: AppConstants.currentCountry(context) ?? '',
                );
              },
              activeTrackColor: kMainColor,
              inactiveTrackColor: kUnActiveColor,
            );
          },
        ),
        AppText('التواصل الأول'),
      ],
    );
  }
}
