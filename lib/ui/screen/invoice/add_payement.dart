import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/enums.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../widgets/custom_widget/card_row.dart';

class AddPayement extends StatelessWidget {
  AddPayement({required this.invoiceModel, Key? key}) : super(key: key);
  InvoiceModel invoiceModel;
  final TextEditingController amount_paidController = TextEditingController();
  final TextEditingController paymentDate = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'إضافة دفعة للفاتورة'),
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<InvoiceVm>(context, listen: true).isloadingdone,
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(child: AppText('اضافة دفعة')),
                20.height,
                CardRow(
                    title: 'اجمالي فاتورة العميل ',
                    value: invoiceModel.total.toString()),
                CardRow(
                    title: 'المبلغ المدفوع ',
                    value: invoiceModel.amountPaid.toString()),
                if (invoiceModel.amountPaid == null ||
                    invoiceModel.amountPaid == '')...[
                  CardRow(
                      title: 'المبلغ المتبقي ',
                      value: '0'.toString()),
                ] else
                  CardRow(
                      title: 'المبلغ المتبقي ',
                      value: (double.parse(invoiceModel.total.toString()) -
                              double.parse(invoiceModel.amountPaid.toString()))
                        .toStringAsFixed(2)
                        .toString()),
                10.height,
                AppText('*اجمالي المبلغ المدفوع'),
                5.height,
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: AppTextField(
                    hintText: 'اجمالي المبلغ المدفوع',
                    controller: amount_paidController,
                    inputType: TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value.toString().trim().isEmpty) {
                        return 'empty field';
                      }
                      if (double.tryParse(value.toString()) == null) {
                        return 'من فضلك ادخل عدد';
                      }
                      return null;
                    },
                  ),
                ),
                10.height,
                AppText('التاريخ'),
                5.height,
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: paymentDate,
                    style2: true,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: AppElevatedButton(
                    text: 'اتمام العملية',
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        Provider.of<InvoiceVm>(context, listen: false)
                            .add_payment({
                          "total_paid": (double.parse(
                                      amount_paidController.text.toString()) +
                                  double.parse(
                                      invoiceModel.amountPaid.toString()))
                              .toStringAsFixed(2)
                              .toString(),
                          "amount_paid": amount_paidController.text.toString(),

                          "id_invoice": invoiceModel.idInvoice,

                          "payment_date": paymentDate.text,
                          //"date_changetype":,
                        }, invoiceModel.idInvoice).then((value) =>
                                value != false ? clear(context) : error());
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clear(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }

  void error() {}
}
