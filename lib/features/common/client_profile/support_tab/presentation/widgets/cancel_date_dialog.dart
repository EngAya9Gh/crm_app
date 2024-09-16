import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../domain/use_cases/cancel_date_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class CancelDateDialog extends StatelessWidget {
  const CancelDateDialog({
    super.key,
    required this.idInvoice,
  });

  final String idInvoice;

  @override
  Widget build(BuildContext context) {
    final supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
    return SimpleDialog(
      title: const AppText(
        "ارجاع العميل للانتظار",
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: const AppText(
            "هل تريد ارجاع العميل للانتظار؟",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppElevatedButton(
                text: "لا",
                onPressed: () => AppNavigator.pop(),
              ),
              BlocConsumer<SupportTabCubit, SupportTabState>(
                listener: (context, state) {
                  if (state.cancelDateInstallStatus.isFailed()) {
                    AppSnackbar.showSnakeBar(
                      state.cancelDateInstallStatus.error ??
                          "Something went wrong",
                      color: ToastColorsEnum.error,
                    );
                  } else if (state.cancelDateInstallStatus.isSuccess()) {
                    AppNavigator.pop();
                    AppSnackbar.showSnakeBar(
                      "تم ارجاع العميل للانتظار بنجاح",
                      color: ToastColorsEnum.success,
                    );
                  }
                },
                builder: (context, state) {
                  return AppElevatedButton(
                    text: "نعم",
                    isLoading: state.cancelDateInstallStatus.isLoading(),
                    onPressed: () async {
                      await supportTabCubit.cancelDateInstall(
                        CancelDateInstallParams(
                          idInvoice: idInvoice,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
