import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/advanced_cofigs_cubit.dart';

class SaveConfigsButton extends StatefulWidget {
  const SaveConfigsButton({super.key});

  @override
  State<SaveConfigsButton> createState() => _SaveConfigsButtonState();
}

class _SaveConfigsButtonState extends State<SaveConfigsButton> {
  late final AdvancedCofigsCubit _advancedCofigsCubit;

  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    _advancedCofigsCubit = context.read<AdvancedCofigsCubit>();
    _privilegeCubit = context.read<PrivilegesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedCofigsCubit, AdvancedCofigsState>(
      builder: (context, state) {
        if (!isAllowed()) return SizedBox.shrink();
        if (state.editAdvancedConfigsStatus.isLoading()) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: AppLoader(color: AppColors.paperCard),
          );
        } else if (state.editAdvancedConfigsStatus.isFailed()) {
          return AppErrorWidget(
            onPressed: () => _advancedCofigsCubit.updateConfigs(),
            message: state.editAdvancedConfigsStatus.error,
          );
        }
        return InkWell(
          onTap: () => _advancedCofigsCubit.updateConfigs(),
          child: const AppIcon(Icons.check_circle_outline, size: 30),
        );
      },
    );
  }

  bool isAllowed() {
    return _privilegeCubit.checkPrivilege('211') ||
        _privilegeCubit.checkPrivilege('212');
  }
}
