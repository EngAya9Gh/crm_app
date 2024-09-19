import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/general_cofigs_cubit.dart';

class SaveConfigsButton extends StatefulWidget {
  const SaveConfigsButton({super.key});

  @override
  State<SaveConfigsButton> createState() => _SaveConfigsButtonState();
}

class _SaveConfigsButtonState extends State<SaveConfigsButton> {
  late final GeneralCofigsCubit _generalCofigsCubit;

  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    _generalCofigsCubit = context.read<GeneralCofigsCubit>();
    _privilegeCubit = context.read<PrivilegesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralCofigsCubit, GeneralCofigsState>(
      builder: (context, state) {
        if (!isAllowed()) return SizedBox.shrink();
        if (state.editGeneralConfigsStatus.isLoading()) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: AppLoader(color: AppColors.white),
          );
        } else if (state.editGeneralConfigsStatus.isFailed()) {
          return AppErrorWidget(
            onPressed: () => _generalCofigsCubit.updateConfigs(),
            message: state.editGeneralConfigsStatus.error,
          );
        }
        return InkWell(
          onTap: () => _generalCofigsCubit.updateConfigs(),
          child: const AppIcon(Icons.check_circle_outline, size: 30),
        );
      },
    );
  }

  bool isAllowed() {
    return _privilegeCubit.checkPrivilege('213') ||
        _privilegeCubit.checkPrivilege('214');
  }
}
