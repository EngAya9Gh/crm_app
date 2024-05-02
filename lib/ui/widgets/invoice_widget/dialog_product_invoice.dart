import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class DialogProductInvoice extends StatefulWidget {
  const DialogProductInvoice({
    super.key,
    required this.itemProd,
    this.invoice,
  });

  final ProductsInvoice itemProd;
  final InvoiceModel? invoice;

  @override
  State<DialogProductInvoice> createState() => _DialogProductInvoiceState();
}

class _DialogProductInvoiceState extends State<DialogProductInvoice> {
  late final InvoiceVm invoiceVm;
  final globalKey = GlobalKey<FormState>();
  final TextEditingController taxUser = TextEditingController();
  final TextEditingController textPrice = TextEditingController();
  final TextEditingController taxAdmin = TextEditingController();
  final TextEditingController amount = TextEditingController();

  @override
  void initState() {
    invoiceVm = Provider.of<InvoiceVm>(context, listen: false);
    taxUser.text = widget.itemProd.rateUser!;
    textPrice.text = widget.itemProd.price!;
    taxAdmin.text = widget.itemProd.rateAdmin!;
    amount.text = widget.itemProd.amount!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      title: Center(
          child: Text(
        'تعديل المنتج',
        style: TextStyle(fontFamily: kfontfamily2),
      )),
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: globalKey,
                child: Column(
                  children: [
                    RowEdit(name: 'الكمية', des: '*'),
                    EditTextFormField(
                      vaildator: HelperFunctions.instance.requiredFiled,
                      onChanged: (val) => calculate(),
                      inputType: TextInputType.number,
                      label: 'الكمية',
                      inputformate: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: amount,
                      hintText: 'الكمية',
                    ),
                    RowEdit(name: 'السعر', des: '*'),
                    EditTextFormField(
                      vaildator: HelperFunctions.instance.requiredFiled,
                      inputType: TextInputType.number,

                      controller: textPrice,
                      label: 'السعر',
                      hintText: Provider.of<UserProvider>(context, listen: true)
                          .currentUser
                          .currency
                          .toString(),
                      //radius: 10
                    ),
                    SizedBox(height: 5),
                    RowEdit(name: 'نسبة الخصم المتاحة للموظف', des: ' '),
                    EditTextFormField(
                      onChanged: (val) => calculate(),
                      inputType: TextInputType.number,
                      controller: taxUser,
                      hintText: '%',
                    ),
                    SizedBox(height: 3),
                    RowEdit(name: 'نسبة الخصم المتاحة للمشرف', des: ' '),
                    EditTextFormField(
                      onChanged: (val) => calculate(),
                      inputType: TextInputType.number,
                      controller: taxAdmin,
                      hintText: '%',
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppElevatedButton(
                            onPressed: () {
                              _editProductInvoice();
                            },
                            child: Text('تم'),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: AppElevatedButton(
                            child: Text('حذف'),
                            onPressed: () async => _deleteProductInvoice(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _editProductInvoice() {
    if (!globalKey.currentState!.validate()) return;
    globalKey.currentState!.save();
    final ProductsInvoice editedProduct = widget.itemProd.copyWith(
      rateUser: taxUser.text,
      price: textPrice.text,
      rateAdmin: taxAdmin.text,
      amount: amount.text,
    );

    invoiceVm.editProduct(editedProduct);
    widget.invoice!.products = invoiceVm.productsInvoiceList;
    widget.invoice!.total = invoiceVm.calculateTotal().toString();
    AppNavigator.pop();
  }

  void _deleteProductInvoice() {
    invoiceVm.removeProduct(
      idInvoiceProduct: widget.itemProd.idInvoiceProduct,
      localId: widget.itemProd.localId,
    );

    widget.invoice!.products = invoiceVm.productsInvoiceList;
    widget.invoice!.total = invoiceVm.calculateTotal().toString();

    AppNavigator.pop();
  }

  void calculate() {
    setState(() {
      double totaltax = 0;
      textPrice.text = widget.itemProd.priceProduct!;
      String? taxCountry = widget.itemProd.taxtotal;

      if (taxCountry != null || taxCountry != 'null') {
        double pricewithtax = double.parse(textPrice.text) *
            double.parse(taxCountry ?? '0') /
            100;

        textPrice.text =
            (double.parse(textPrice.text) + pricewithtax).toString();
      }
      if (taxAdmin.text != '' && taxUser.text != '') {
        totaltax = double.parse(taxAdmin.text) + double.parse(taxUser.text);
      } else {
        if (taxAdmin.text != '') totaltax = double.parse(taxAdmin.text);
        if (taxUser.text != '') totaltax = double.parse(taxUser.text);
      }
      double pricewithouttax = double.parse(textPrice.text) * totaltax / 100;
      textPrice.text =
          (double.parse(textPrice.text) - pricewithouttax).toString();

      double totalprice = double.parse(textPrice.text) *
          double.parse(amount.text.isEmpty ? '1' : amount.text);
      //totalprice.floorToDouble();
      textPrice.text = totalprice.toString();
    });
  }
}
