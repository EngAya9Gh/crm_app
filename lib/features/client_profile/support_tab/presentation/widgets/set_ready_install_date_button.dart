import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../view_model/invoice_vm.dart';

class SetReadyInstallDateButton extends StatelessWidget {
  const SetReadyInstallDateButton({
    super.key,
    required this.invoiceModel,
  });

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kMainColor),
            foregroundColor:
                MaterialStateProperty.all(context.colorScheme.white),
          ),
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
                                      child: AppElevatedButton(
                                        onPressed: () async {
                                          Provider.of<invoice_vm>(context,
                                                  listen: false)
                                              .setisload();

                                          await Provider.of<invoice_vm>(context,
                                                  listen: false)
                                              .set_ready_install({
                                            'date_temp': invoiceModel
                                                .date_not_readyinstall
                                                .toString(),
                                            'date_ready_prev': invoiceModel
                                                .date_readyinstall
                                                .toString(),
                                            'date_readyinstall':
                                                DateTime.now().toString(),
                                            'user_ready_install':
                                                Provider.of<UserProvider>(
                                                        context,
                                                        listen: false)
                                                    .currentUser
                                                    .idUser
                                                    .toString(),
                                            'ready_install': '1',
                                          }, invoiceModel.idInvoice).then(
                                                  (value) {
                                            // return clear();
                                          });
                                          AppNavigator.pop();
                                        },
                                        child: Text('نعم'),
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
          child: Text('الغاء تعليق العميل')),
    );
  }
}
