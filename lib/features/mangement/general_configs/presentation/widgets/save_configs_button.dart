import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/general_cofigs_cubit.dart';

class SaveConfigsButton extends StatefulWidget {
  const SaveConfigsButton({super.key});

  @override
  State<SaveConfigsButton> createState() => _SaveConfigsButtonState();
}

class _SaveConfigsButtonState extends State<SaveConfigsButton> {
  late final GeneralCofigsCubit _generalCofigsCubit;

  late final PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _generalCofigsCubit = context.read<GeneralCofigsCubit>();
    _privilegeCubit = context.read<PrivilegeCubit>();
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
            child: const CircularProgressIndicator(color: Colors.white),
          );
        } else if (state.editGeneralConfigsStatus.isFailed()) {
          return CustomErrorWidget(
            onPressed: () => _generalCofigsCubit.updateConfigs(),
            message: state.editGeneralConfigsStatus.error,
          );
        }
        return IconButton(
          onPressed: () => _generalCofigsCubit.updateConfigs(),
          icon: const Icon(Icons.check_circle_outline, size: 30),
        );
      },
    );
  }

  bool isAllowed() {
    return _privilegeCubit.checkPrivilege('211') ||
        _privilegeCubit.checkPrivilege('212');
  }
}
