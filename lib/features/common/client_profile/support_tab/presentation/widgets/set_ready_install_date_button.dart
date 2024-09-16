import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class SetReadyInstallDateButton extends StatelessWidget {
  const SetReadyInstallDateButton({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: 'تعليق العميل',
      isDisabled: invoiceModel.ready_install == '1',
      onPressed: invoiceModel.ready_install == '1'
          ? null
          : () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: AppText('التأكيد'),
                      content: AppText('هل تريد الغاء تعليق العميل '),
                      actions: <Widget>[
                        Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: AppElevatedButton(
                                    text: 'لا',
                                    onPressed: () => AppNavigator.pop(),
                                  ),
                                ),
                                20.horizontalSpace,
                                Expanded(
                                  child: BlocBuilder<SupportTabCubit,
                                      SupportTabState>(
                                    builder: (context, state) {
                                      return AppElevatedButton(
                                        text: 'نعم',
                                        isLoading: state
                                            .setReadyInstallStatus.isLoading,
                                        onPressed: () async {
                                          await context
                                              .read<SupportTabCubit>()
                                              .setReadyInstall(
                                                SetReadyInstallParams(
                                                  idInvoice:
                                                      "${invoiceModel.idInvoice}",
                                                  TypeReadyClient: 'ready',
                                                ),
                                              );
                                          AppNavigator.pop();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
    );
  }
}
