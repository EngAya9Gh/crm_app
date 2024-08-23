import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
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
                        title: Text('التأكيد'),
                        content: Text('هل تريد الغاء تعليق العميل '),
                        actions: <Widget>[
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.primaryColor)),
                                      onPressed: () {
                                        AppNavigator.pop();
                                      },
                                      child: Text('لا'),
                                    ),
                                  ),
                                  20.horizontalSpace,
                                  Expanded(
                                    child: BlocBuilder<SupportTabCubit,
                                        SupportTabState>(
                                      builder: (context, state) {
                                        return AppElevatedButton(
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
                                          child: Text('نعم'),
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
        child: Text('الغاء تعليق العميل'));
  }
}
