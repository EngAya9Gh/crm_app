import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../domain/use_cases/returnToApprove.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class ReturnInvoiceApprove extends StatefulWidget {
  ReturnInvoiceApprove({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  State<ReturnInvoiceApprove> createState() => _ReturnInvoiceApproveState();
}

class _ReturnInvoiceApproveState extends State<ReturnInvoiceApprove> {
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportTabCubit, SupportTabState>(
      builder: (context, state) {
        return SimpleDialog(
          titlePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          contentPadding: EdgeInsets.all(15),
          title: Center(
              child: Text(' اعادة العميل لموافقة المشرف',
                  style: TextStyle(
                    fontFamily: AppFonts.fontFamily2,
                  ))),
          children: [
            Form(
                key: _globalKey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      EditTextFormField(
                        controller: notesController,
                        vaildator: InputValidator.requiredFiled,
                        hintText: "الملاحظات*",
                        paddcustom: EdgeInsets.all(8),
                        maxline: 5,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppElevatedButton(
                            isLoading: state.setReadyInstallStatus.isLoading,
                            onPressed: () async {
                              if (!_globalKey.currentState!.validate()) return;
                              final returnToApproveParams =
                                  ReturnToApproveParams(
                                id_invoice:
                                    widget.invoiceModel.idInvoice.toString(),
                                comment: notesController.text,
                              );

                              await context
                                  .read<SupportTabCubit>()
                                  .returnToAppove(returnToApproveParams);

                              notesController.clear();

                              AppNavigator.pop();
                            },
                            child: Text('تأكيد'),
                          ),
                          AppElevatedButton(
                            isLoading: state.setReadyInstallStatus.isLoading,
                            onPressed: () => Navigator.pop(context),
                            child: Text('إلغاء'),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
