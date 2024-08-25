import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/privilege_model.dart';
import '../manager/privilege_cubit.dart';

class PrivilegeCard extends StatefulWidget {
  const PrivilegeCard({
    super.key,
    required this.privilegeModel,
  });

  final PrivilegeModel privilegeModel;

  @override
  State<PrivilegeCard> createState() => _PrivilegeCardState();
}

class _PrivilegeCardState extends State<PrivilegeCard> {
  @override
  Widget build(BuildContext context) {
    final privilegeCubit = context.read<PrivilegeCubit>();
    return Container(
      child: SwitchListTile(
        title: AppText(widget.privilegeModel.namePrivilege!),
        value: widget.privilegeModel.isCheck!,
        activeColor: AppColors.white,
        activeTrackColor: AppColors.green,
        onChanged: (bool? value) {
          if (value == null) return;

          privilegeCubit.changePrivilege(
            privilegeModel: widget.privilegeModel,
          );
          setState(() {});
        },
      ),
    );
  }
}
