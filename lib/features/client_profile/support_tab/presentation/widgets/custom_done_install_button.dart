import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart';
import 'package:crm_smart/features/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/helpers/helper_functions.dart';

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
    return AppElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          kMainColor,
        )),
        onPressed: () async {
          if (invoiceModel!.ready_install == '0') {
            AppConstants.showSnakeBar(context, 'العميل غير جاهز للتركيب');
          }
          await showDialog(
            context: context,
            builder: (context) {
              return Directionality(
                textDirection: TextDirection.rtl,
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
                          vaildator: HelperFunctions.instance.requiredFiled,
                        ),
                        SizedBox(height: 10),
                        Consumer<invoice_vm>(builder: (context, invoice, _) {
                          if (invoice.isloadingdone) {
                            return CustomLoadingIndicator();
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kMainColor)),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true).pop(
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
                                        id_invoice: invoiceModel!.idInvoice!,
                                        clientusername: nameUserClient.text,
                                      ));

                                      if (value) {
                                        // todo: clear
                                        // clear();
                                        AppNavigator.pop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text('حدث خطأ ما.')));
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
            },
          );
        },
        child: Text('تم التركيب للعميل'));
  }
}
