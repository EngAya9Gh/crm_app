import 'dart:ui' as myui;

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomDoneInstallButton extends StatelessWidget {
  const CustomDoneInstallButton({
    super.key,
    this.invoiceModel,
    required this.nameUserClient,
  });

  final InvoiceModel? invoiceModel;
  final TextEditingController nameUserClient;

  @override
  Widget build(BuildContext context) {
    final supportTabCubit = context.read<SupportTabCubit>();
    return ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
        onPressed: () async {
          if (invoiceModel!.ready_install == '0')
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('العميل غير جاهز للتركيب ')));
          else {
            await showDialog(
                context: context,
                builder: (context) {
                  return Directionality(
                    textDirection: myui.TextDirection.rtl,
                    child: AlertDialog(
                      title: Text('التأكيد'),
                      content: Text('هل تريد تأكيد عملية التركيب'),
                      actions: <Widget>[
                        Column(
                          children: [
                            EditTextFormField(
                              maxline: 4,
                              paddcustom: EdgeInsets.all(10),
                              hintText: ' يوزر العميل',
                              obscureText: false,
                              controller: nameUserClient,
                              vaildator: (value) {
                                if (value.toString().trim().isEmpty) {
                                  return 'الحقل فارغ';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            Consumer<invoice_vm>(
                                builder: (context, invoice, _) {
                              if (invoice.isloadingdone) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              return Row(
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
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(
                                                false); // dismisses only the dialog and returns false
                                      },
                                      child: Text('لا'),
                                    ),
                                  ),
                                  10.horizontalSpace,
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kMainColor)),
                                      onPressed: () async {
                                        try {
                                          final value = await supportTabCubit
                                              .setDateDone(SetDateDoneParams(
                                            id_invoice:
                                                invoiceModel!.idInvoice!,
                                            clientusername: nameUserClient.text,
                                          ));

                                          if (value) {
                                            // todo: clear
                                            // clear();
                                            AppNavigator.pop();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content:
                                                        Text('حدث خطأ ما.')));
                                          }
                                        } catch (e) {
                                          Provider.of<invoice_vm>(context,
                                                  listen: false)
                                              .setisload(isLoading: false);
                                        }
                                      },
                                      child: Text('نعم'),
                                    ),
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  );
                });
          }
          //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
        },
        child: Text('تم التركيب للعميل'));
  }
}
