import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/exceeded_clients_cubit.dart';

class TransferExceededClientsButton extends StatefulWidget {
  const TransferExceededClientsButton({
    super.key,
  });

  @override
  State<TransferExceededClientsButton> createState() =>
      _TransferExceededClientsButtonState();
}

class _TransferExceededClientsButtonState
    extends State<TransferExceededClientsButton> {
  late final ExceededClientsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ExceededClientsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    if (!context.read<PrivilegesCubit>().checkPrivilege('234')) {
      return SizedBox.shrink();
    }
    return BlocListener<ExceededClientsCubit, ExceededClientsState>(
      listenWhen: (previous, current) =>
          previous.transferExceededClientsStatus !=
          current.transferExceededClientsStatus,
      listener: (context, state) {
        if (state.transferExceededClientsStatus.isFailed()) {
          AppSnackbar.showSnakeBar(
            state.transferExceededClientsStatus.error,
            color: ToastColorsEnum.error,
          );
        } else if (state.transferExceededClientsStatus.isSuccess()) {
          AppSnackbar.showSnakeBar(
            'تم العملية بنجاح',
            color: ToastColorsEnum.success,
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 65.w, vertical: 5),
        child: BlocBuilder<ExceededClientsCubit, ExceededClientsState>(
          builder: (context, state) {
            return AppElevatedButton(
              text: 'تحويل العملاء المحددين',
              isLoading: state.transferExceededClientsStatus.isLoading(),
              onPressed: () async {
                if (cubit.pageVariables.selectedClientsForTransfer.isEmpty) {
                  AppSnackbar.showSnakeBar(
                    'يجب تحديد عميل واحد على الأقل',
                    color: ToastColorsEnum.warning,
                  );
                  return;
                }
                await cubit.transferExceededClients();
              },
            );
          },
        ),
      ),
    );
  }
}
