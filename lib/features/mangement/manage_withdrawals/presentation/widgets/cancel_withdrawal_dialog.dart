import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CancelWithdrawalDialog extends StatefulWidget {
  const CancelWithdrawalDialog({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  State<CancelWithdrawalDialog> createState() => _CancelWithdrawalDialogState();
}

class _CancelWithdrawalDialogState extends State<CancelWithdrawalDialog> {
  late final ManageWithdrawalsCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<ManageWithdrawalsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: AppText(
        "إلغاء الانسحاب",
        textAlign: TextAlign.center,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppElevatedButton(
              text: "إلغاء",
              onPressed: () => AppNavigator.pop(),
            ),
            BlocConsumer<ManageWithdrawalsCubit, ManageWithdrawalsState>(
              listener: (context, state) {
                if (state.cancelWithdrawalState.isSuccess()) {
                  AppNavigator.pop();
                  AppNavigator.pop();
                } else if (state.cancelWithdrawalState.isFailed()) {
                  AppSnackbar.showSnakeBar(
                    state.cancelWithdrawalState.error.toString(),
                    color: ToastColorsEnum.error,
                  );
                }
              },
              builder: (context, state) {
                if (state.cancelWithdrawalState.isFailed()) {
                  return AppErrorWidget(
                    message: state.cancelWithdrawalState.error,
                    onPressed: () async => await _onTapOk(context),
                  );
                }
                return AppElevatedButton(
                  isLoading: state.cancelWithdrawalState.isLoading(),
                  text: "تم",
                  onPressed: () async => await _onTapOk(context),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onTapOk(BuildContext context) async {
    await _cubit.cancelWithdrawal(
      CancelWithdrawalParams(
        idInvoice: widget.invoice.idInvoice!,
      ),
    );
  }
}
