import 'dart:ui' as myui;

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/reason_suspend.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogReady extends StatefulWidget {
  const DialogReady({
    required this.invoice,
    required this.type_ready,
    Key? key,
  }) : super(key: key);
  final String type_ready;
  final InvoiceModel invoice;

  @override
  State<DialogReady> createState() => _DialogReadyState();
}

class _DialogReadyState extends State<DialogReady> {
  String title = '';
  String Value_sales = '';

  // late InvoiceModel _invoice;

  @override
  void initState() {
    // TODO: implement initState

    widget.type_ready == 'suspend' ? 'تعليق العميل' : 'تحويل العميل لغير جاهز';
    super.initState();
  }

  final _globalKey = GlobalKey<FormState>();
  final TextEditingController descresaonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      title: Center(
          child: Text(title, style: TextStyle(fontFamily: kfontfamily2))),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Form(
                key: _globalKey,
                child: Column(
                  children: [
                    RowEdit(name: "تحديد الأسباب", des: '*'),
                    widget.type_ready == 'suspend'
                        ? Consumer<reason_suspend>(
                            builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text(''),
                                items:
                                    cart.list_reason_suspend.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one),
                                    value: level_one,
                                  );
                                }).toList(),
                                value: cart.selectedValuemanag,
                                onChanged: (value) {
                                  cart.changevalue(value.toString());
                                  Value_sales = value.toString();
                                  //typeclientvalue = value.toString();
                                  // filtershow();
                                },
                              );
                            },
                          )
                        : Consumer<reason_suspend>(
                            builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text(''),
                                items: cart.list_reason_sales.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one),
                                    value: level_one,
                                  );
                                }).toList(),
                                value: cart.selectedValue_sales,
                                onChanged: (value) {
                                  cart.changevalue_sales(value.toString());
                                  Value_sales = value.toString();
                                  // filtershow();
                                },
                              );
                            },
                          ),
                    SizedBox(height: 3),
                    EditTextFormField(
                      controller: descresaonController,
                      vaildator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                        return null;
                      },
                      hintText: "الملاحظات*",
                      paddcustom: EdgeInsets.all(8),
                      maxline: 5,
                    ),
                    Consumer<invoice_vm>(
                      builder: (context, value, child) {
                        if (value.isloading) return CustomLoadingIndicator();
                        return widget.type_ready == 'suspend'
                            ? _buildSuspendAlertDialog(context)
                            : Directionality(
                                textDirection: myui.TextDirection.rtl,
                                child: _buildNotReadyAlertDialog(context),
                              );
                        // ModalProgressHUD(
                        //         inAsyncCall: Provider.of<invoice_vm>(context,
                        //                 listen: true)
                        //             .isloadingdone,
                        //         child: Directionality(
                        //           textDirection: myui.TextDirection.rtl,
                        //           child: _buildNotReadyAlertDialog(context),
                        //         ),
                        //       );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildSuspendAlertDialog(BuildContext context) {
    return Directionality(
      textDirection: myui.TextDirection.rtl,
      child: AlertDialog(
        title: Text('التأكيد'),
        content: Text('هل تريد تحويل العميل لمعلق'),
        actions: <Widget>[
          Consumer<invoice_vm>(
            builder: (context, val, _) {
              return Column(
                children: [
                  SizedBox(height: 10),
                  if (val.isloadingdone)
                    Center(child: CircularProgressIndicator())
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(false);
                            },
                            child: Text('لا'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
                            onPressed: () async {
                              if (Value_sales == '')
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'من فضلك اختر سبب من القائمة ')));
                              else {
                                if (!_globalKey.currentState!.validate())
                                  return;

                                Provider.of<invoice_vm>(context, listen: false)
                                    .setisload();
                                final currentUser =
                                    context.read<UserProvider>().currentUser;
                                var body = {
                                  'TypeReadyClient': 'suspend',
                                  'notes_ready': descresaonController.text,
                                  'reason_suspend': Value_sales,
                                  'nameUser': currentUser.nameUser.toString(),
                                  'date_temp': widget
                                      .invoice.date_not_readyinstall
                                      .toString(),
                                  'date_ready_prev': widget
                                      .invoice.date_readyinstall
                                      .toString(),
                                  'date_not_readyinstall':
                                      DateTime.now().toString(),
                                  'user_not_ready_install':
                                      currentUser.idUser.toString(),
                                  'ready_install': '0', //suspend client
                                };
                                if (widget.invoice.count_delay_ready != null)
                                  body.addAll({
                                    'count_delay_ready': widget
                                        .invoice.count_delay_ready
                                        .toString()
                                  });

                                await Provider.of<invoice_vm>(context,
                                        listen: false)
                                    .set_ready_install(
                                        body, widget.invoice.idInvoice)
                                    .then((value) => clear());
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true);
                              }
                            },
                            child: Text('نعم'),
                          ),
                        ),
                      ],
                    )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotReadyAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('التأكيد'),
      content: Text('هل تريد تحويل العميل إلى غير جاهز للتركيب '),
      actions: <Widget>[
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kMainColor)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(false);
                    },
                    child: Text('لا'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AppElevatedButton(
                    isLoading: Provider.of<invoice_vm>(context, listen: true)
                        .isloadingdone,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kMainColor)),
                    onPressed: () async {
                      if (Value_sales == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('من فضلك اختر سبب من القائمة ')));
                        return;
                      }

                      if (!_globalKey.currentState!.validate()) return;

                      Provider.of<invoice_vm>(context, listen: false)
                          .setisload();
                      final currentUser =
                          context.read<UserProvider>().currentUser;

                      var body = {
                        'TypeReadyClient': 'notReady',
                        'notes_ready': descresaonController.text,
                        'reason_notReady': Value_sales,
                        'nameUser': currentUser.nameUser.toString(),
                        'date_temp':
                            widget.invoice.date_not_readyinstall.toString(),
                        'date_ready_prev':
                            widget.invoice.date_readyinstall.toString(),
                        'date_not_readyinstall': DateTime.now().toString(),
                        'user_not_ready_install': currentUser.idUser.toString(),
                        'ready_install': '0', //suspend client
                      };
                      if (widget.invoice.count_delay_ready != null)
                        body.addAll({
                          'count_delay_ready':
                              widget.invoice.count_delay_ready.toString()
                        });

                      await Provider.of<invoice_vm>(context, listen: false)
                          .set_ready_install(body, widget.invoice.idInvoice)
                          .then((value) => clear());
                      Navigator.of(context, rootNavigator: true).pop(true);
                    },
                    child: Text('نعم'),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  clear() {}
}
