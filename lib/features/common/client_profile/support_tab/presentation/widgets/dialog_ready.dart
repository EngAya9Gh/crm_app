import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/app_card_row.dart';
import '../../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../../view_model/reason_suspend.dart';
import 'not_ready_alert_dialog.dart';
import 'suspend_alert_dialog.dart';

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
  bool isSuspend = false;

  // late InvoiceModel _invoice;

  @override
  void initState() {
    isSuspend = widget.type_ready == 'suspend';
    super.initState();
  }

  final _globalKey = GlobalKey<FormState>();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      title: Center(
          child:
              Text(title, style: TextStyle(fontFamily: AppFonts.fontFamily2))),
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Form(
                key: _globalKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  child: Column(
                    children: [
                      AppCardRow(title: "تحديد الأسباب", value: '*'),
                      isSuspend
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
                                  },
                                );
                              },
                            )
                          : Consumer<reason_suspend>(
                              builder: (context, cart, child) {
                                return DropdownButton(
                                  isExpanded: true,
                                  hint: Text(''),
                                  items:
                                      cart.list_reason_sales.map((level_one) {
                                    return DropdownMenuItem(
                                      child: Text(level_one),
                                      value: level_one,
                                    );
                                  }).toList(),
                                  value: cart.selectedValue_sales,
                                  onChanged: (value) {
                                    cart.changevalue_sales(value.toString());
                                    Value_sales = value.toString();
                                  },
                                );
                              },
                            ),
                      SizedBox(height: 3),
                      EditTextFormField(
                        controller: notesController,
                        vaildator: InputValidator.requiredFiled,
                        hintText: "الملاحظات*",
                        paddcustom: EdgeInsets.all(8),
                        maxline: 5,
                      ),
                      Consumer<InvoiceVm>(
                        builder: (context, value, child) {
                          if (value.isloading) return AppLoader();
                          return isSuspend
                              ? SuspendAlertDialog(
                                  invoiceModel: widget.invoice,
                                  typeReady: widget.type_ready,
                                  formKey: _globalKey,
                                  notesController: notesController,
                                )
                              : NotReadyAlertDialog(
                                  invoiceModel: widget.invoice,
                                  typeReady: widget.type_ready,
                                  formKey: _globalKey,
                                  notesController: notesController,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
