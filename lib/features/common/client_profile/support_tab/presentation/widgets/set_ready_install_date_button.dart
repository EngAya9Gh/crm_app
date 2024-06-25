import '../../../../../../constants.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                                                  kMainColor)),
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
                                                  id_invoice:
                                                      "${invoiceModel.idInvoice}",
                                                  date_temp: invoiceModel
                                                      .date_not_readyinstall,
                                                  date_ready_prev: invoiceModel
                                                      .date_readyinstall,
                                                  date_readyinstall:
                                                      DateTime.now().toString(),
                                                  user_ready_install: context
                                                      .read<UserProvider>()
                                                      .currentUser
                                                      .idUser
                                                      .toString(),
                                                  ready_install: '1',
                                                ));

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
