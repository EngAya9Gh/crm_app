import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/custom_widget/RowWidget.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/custom_widget/text_form.dart';

class add_payement extends StatelessWidget {
  add_payement({required this.invoiceModel, Key? key}) : super(key: key);
  InvoiceModel invoiceModel;
  final TextEditingController amount_paidController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<invoice_vm>(context, listen: true).isloadingdone,
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: EdgeInsets.only(top: 100, right: 20, left: 20),
            child: Column(
              children: [
                Text(
                  'اضافة دفع',
                  style: TextStyle(fontFamily: kfontfamily2),
                ),
                cardRow(
                    title: 'اجمالي فاتورة العميل ',
                    value: invoiceModel.total.toString()),
                cardRow(
                    title: 'المبلغ المدفوع ',
                    value: invoiceModel.amountPaid.toString()),
                cardRow(
                    title: 'المبلغ المتبقي ',
                    value: (double.parse(invoiceModel.total.toString()) -
                            double.parse(invoiceModel.amountPaid.toString()))
                        .toStringAsFixed(2)
                        .toString()),
                SizedBox(
                  height: 10,
                ),
                RowEdit(name: 'اجمالي المبلغ المدفوع', des: 'required'),
                EditTextFormField(
                  obscureText: false,
                  hintText: 'اجمالي المبلغ المدفوع',
                  vaild: (value) {
                    if (value.toString().trim().isEmpty) {
                      return 'empty field';
                    }
                    if (double.tryParse(value.toString()) == null)
                      return 'من فضلك ادخل عدد';
                  },
                  controller: amount_paidController, //اسم المؤسسة
                  //label: label_client,
                  onChanged: (val) {
                    // nameprod = val;
                  },
                  inputType: TextInputType.number,
                  // inputformate: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                ),
                SizedBox(
                  height: 5,
                ),
                CustomButton(
                  text: 'اتمام العملية',
                  onTap: () async {
                    if (_globalKey.currentState!.validate()) {
                      Provider.of<invoice_vm>(context, listen: false)
                          .update_invoiceclient_vm({
                        "name_enterprise": invoiceModel.name_enterprise,
                        "name_client": invoiceModel.nameClient.toString(),

                        "amount_paid": (double.parse(
                                    amount_paidController.text.toString()) +
                                double.parse(
                                    invoiceModel.amountPaid.toString()))
                            .toStringAsFixed(2)
                            .toString(),
                        'fk_regoin': invoiceModel.fk_regoin.toString(),
                        'fkcountry': invoiceModel.fk_country.toString(),

                        "lastuserupdate": Provider.of<user_vm_provider>(context,
                                listen: false)
                            .currentUser
                            .idUser
                            .toString(),
                        "lastnameuser": Provider.of<user_vm_provider>(context,
                                listen: false)
                            .currentUser
                            .nameUser
                            .toString(),

                        "id_invoice": invoiceModel.idInvoice,

                        'date_lastuserupdate': DateTime.now().toString(),
                        //"date_changetype":,
                      }, invoiceModel.idInvoice, null, null).then(
                              (value) => value != false ? clear(context ) : error());
                    }
                    ;
                  },
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
