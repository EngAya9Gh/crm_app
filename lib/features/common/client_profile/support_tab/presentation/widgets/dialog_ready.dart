import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../../view_model/reason_suspend.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
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
      title: Center(child: AppText(title)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText('تحديد الأسباب*'),
                      5.height,
                      isSuspend
                          ? Consumer<reason_suspend>(
                              builder: (context, cart, child) {
                                return CustomDropDown<String>(
                                  hint: 'السبب',
                                  items: cart.list_reason_suspend,
                                  itemAsString: (item) => item!,
                                  selectedItem: cart.selectedValuemanag,
                                  onChanged: (value) {
                                    cart.changevalue(value);
                                    Value_sales = value!;
                                  },
                                  height: 225.scaleHeight,
                                );
                              },
                            )
                          : Consumer<reason_suspend>(
                              builder: (context, cart, child) {
                                return CustomDropDown<String>(
                                  hint: 'السبب',
                                  items: cart.list_reason_sales,
                                  itemAsString: (item) => item!,
                                  selectedItem: cart.selectedValue_sales,
                                  onChanged: (value) {
                                    cart.changevalue_sales(value!);
                                    Value_sales = value;
                                  },
                                  height: 95.scaleHeight,
                                );
                              },
                            ),
                      10.height,
                      AppTextField(
                        controller: notesController,
                        hintText: "الملاحظات*",
                        isRequired: true,
                        maxLines: 3,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      10.height,
                      Center(
                        child: Consumer<InvoiceVm>(
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
