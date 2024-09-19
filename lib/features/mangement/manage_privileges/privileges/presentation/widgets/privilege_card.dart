import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/privilege_model.dart';
import '../manager/levels_cubit/privileges_cubit.dart';

class PrivilegeCard extends StatelessWidget {
  const PrivilegeCard({
    super.key,
    required this.privilegeModel,
  });

  final PrivilegeModel privilegeModel;

  @override
  Widget build(BuildContext context) {
    final privilegeCubit = context.read<PrivilegesCubit>();
    return Container(
      child: SwitchListTile(
        title: AppText(privilegeModel.namePrivilege!),
        value: privilegeModel.isCheck!,
        activeColor: AppColors.white,
        activeTrackColor: AppColors.green,
        onChanged: (bool? value) {
          if (value == null) return;

          privilegeCubit.changePrivilege(privilegeModel: privilegeModel);
        },
      ),
    );
  }
}
