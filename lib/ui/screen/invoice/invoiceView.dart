import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/enums/client/type_client_enum.dart';
import '../../../core/common/enums/devices_state_enum.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/client_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../widgets/custom_widget/card_row.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/widgetlogo.dart';
import 'addInvoice.dart';
import 'add_payement.dart';
import 'edit_invoice.dart';
import 'invoice_file_gallery_page.dart';
import 'prepare_button.dart';
import 'reject_dialog.dart';

class InvoiceView extends StatefulWidget {
  InvoiceView({
    this.type,
    this.showActions = true,
    required this.invoice,
    Key? key,
  }) : super(key: key);

  InvoiceModel invoice;
  String? type;
  bool showActions;

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  ClientModel? clientmodel;
  late PrivilegeCubit _privilegeCubit;
  late final InvoiceVm invoiceVm;

  @override
  void initState() {
    invoiceVm = context.read<InvoiceVm>();
    invoiceVm.setCurrentInvoice(widget.invoice);

    _privilegeCubit = context.read<PrivilegeCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ClientProvider>(context, listen: false).get_byIdClient(
          widget.invoice.fkIdClient.toString(), (value) => clientmodel = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = invoiceVm.listInvoicesAccept;

    if (list.any((element) => element.idInvoice == widget.invoice.idInvoice))
      widget.invoice = list.firstWhereOrNull(
              (element) => element.idInvoice == widget.invoice.idInvoice) ??
          widget.invoice;

    return Scaffold(
      appBar: widget.type == 'approved'
          ? null
          : AppBar(
              elevation: 1,
            ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Directionality(
          textDirection: myui.TextDirection.rtl, // TextDirection.rtl,
          child: Consumer<InvoiceVm>(builder: (context, value, child) {
            final invoice = value.currentInvoice;

            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AddManualTaskButton(
                      list: invoicePublicTypeList,
                      invoiceId: widget.invoice.idInvoice,
                    ),
                    _product('اسم المنتج', 'الكمية', 'السعر'),

                    for (ProductsInvoice product in invoice!.products!)
                      _product(
                        product.nameProduct.toString(),
                        product.amount.toString(),
                        product.price.toString(),
                      ),

                    Container(
                      color: Colors.amberAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'المبلغ الإجمالي   ',
                            style: TextStyle(fontFamily: kfontfamily3),
                          ),
                          //Spacer(),
                          Text(
                            invoice.total.toString(),
                            style: TextStyle(fontFamily: kfontfamily2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    CardRow(
                        title: 'اسم العميل',
                        value: invoice.nameClient.toString()),
                    CardRow(
                        title: 'اسم المؤسسة',
                        value: invoice.name_enterprise.toString()),
                    CardRow(
                        title: 'حالة الفاتورة',
                        value: invoice.stateclient.toString()),
                    CardRow(
                        title: 'فرع الفاتورة',
                        value: invoice.name_regoin_invoice.toString()),

                    invoice.invoice_source != null
                        ? CardRow(
                            title: 'مصدر الفاتورة',
                            value: invoice.invoice_source!.toString())
                        : Container(),

                    CardRow(
                        title: 'اسم الموظف',
                        value: invoice.nameUser.toString()),
                    CardRow(
                        title: 'فرع الموظف',
                        value: invoice.name_regoin_invoice.toString()),

                    CardRow(
                      title: 'تاريخ عقد الإشتراك',
                      value: invoice.date_approve,
                    ),

                    CardRow(
                        title: 'المبلغ المدفوع',
                        value: invoice.amountPaid.toString()),
                    CardRow(
                        title: ' المبلغ المتبقي',
                        value:
                            ((num.tryParse(invoice.total?.toString() ?? "0") ??
                                        0) -
                                    (num.tryParse(
                                            invoice.amountPaid?.toString() ??
                                                "0") ??
                                        0))
                                .toStringAsFixed(2)),

                    invoice.renewYear != '0' && invoice.renewYear != null
                        ? CardRow(
                            title: ' التجديد السنوي',
                            value: invoice.renewYear.toString())
                        : Container(),
                    invoice.renew2year != '0' && invoice.renew2year != null
                        ? CardRow(
                            title: 'تجديد الموارد البشرية',
                            value: invoice.renew2year.toString())
                        : Container(),

                    invoice.renewPlus.toString() == '' ||
                            invoice.renewPlus == null
                        ? Container()
                        : CardRow(
                            title: 'تجديد الفرع الإضافي',
                            value: invoice.renewPlus.toString()),

                    invoice.typeInstallation.toString() == '' ||
                            invoice.typeInstallation == null ||
                            invoice.typeInstallation.toString() == 'null'
                        ? Container()
                        : CardRow(
                            title: 'نوع التركيب',
                            value: invoice.typeInstallation.toString() == '0'
                                ? 'ميداني'
                                : (invoice.typeInstallation.toString() == '2'
                                    ? 'عميل موصى به'
                                    : 'اونلاين'),
                          ),

                    CardRow(
                        title: ' طريقة الدفع',
                        value: invoice.typePay.toString() == '0'
                            ? 'نقدا'
                            : 'تحويل'),
                    //nameuserApprove

                    CardRow(
                        title: ' العملة',
                        value: invoice.currency_name == null
                            ? 'SAR'
                            : invoice.currency_name.toString() == '0'
                                ? 'USD'
                                : 'SAR'),

                    invoice.nameuserApprove != null
                        ? CardRow(
                            title: 'معتمد الفاتورة',
                            value: (invoice.nameuserApprove.toString()))
                        : Container(),

                    invoice.nameuserApprove != null
                        ? CardRow(
                            title: 'تاريخ اعتماد الفاتورة',
                            value: invoice.date_approve.toString())
                        : Container(),
                    invoice.date_lastuserupdate != null
                        ? CardRow(
                            title: 'تاريخ آخر تعديل',
                            value: invoice.date_lastuserupdate != null
                                ? invoice.date_lastuserupdate.toString()
                                : '')
                        : Container(),
                    invoice.date_lastuserupdate != null
                        ? CardRow(
                            title: 'آخر تعديل من قبل',
                            value: invoice.date_lastuserupdate != null
                                ? (invoice.lastuserupdateName.toString())
                                : '')
                        : Container(),

                    if (invoice.stateclient ==
                        TypeClientEnum.withdrawn.value) ...[
                      invoice.date_change_back != null
                          ? CardRow(
                              title: 'تاريخ الإنسحاب',
                              value: invoice.date_change_back.toString())
                          : Container(),
                      invoice.date_change_back != null
                          ? CardRow(
                              title: 'تم الإنسحاب عن طريق',
                              value: (invoice.nameuserback.toString()))
                          : Container(),
                      invoice.fkuser_back != null
                          ? CardRow(
                              title: 'المبلغ المسترجع',
                              value: invoice.value_back.toString())
                          : Container(),
                      invoice.fkuser_back != null
                          ? CardRow(
                              title: 'سبب الإنسحاب',
                              value: invoice.desc_reason_back.toString(),
                              isExpanded: true,
                            )
                          : Container(),
                    ],

                    invoice.numbarnch.toString().trim().isNotEmpty &&
                            invoice.numbarnch != null
                        ? CardRow(
                            title: 'عدد الفروع',
                            value: invoice.numbarnch.toString())
                        : Container(),
                    //invoice!.nummostda != null||
                    invoice.nummostda.toString().trim().isNotEmpty &&
                            invoice.nummostda != null
                        ? CardRow(
                            title: 'عدد المستودعات ',
                            value: invoice.nummostda.toString())
                        : Container(),
                    invoice.numusers.toString().trim().isNotEmpty &&
                            invoice.numusers != null
                        ? CardRow(
                            title: 'عدد المستخدمين',
                            value: invoice.numusers.toString())
                        : Container(),
                    invoice.address_invoice.toString() == ''
                        ? CardRow(
                            title: 'عنوان الفاتورة',
                            value: invoice.address_invoice.toString())
                        : Container(),

                    _privilegeCubit.checkPrivilege('76')
                        ? invoice.clientusername != null &&
                                invoice.clientusername.toString().isNotEmpty
                            ? CardRow(
                                title: 'يوزر العميل',
                                value: invoice.clientusername == null
                                    ? ''
                                    : invoice.clientusername.toString())
                            : Container()
                        : Container(),

                    invoice.imagelogo != null &&
                            invoice.imagelogo.toString().isNotEmpty
                        ? widgetlogo(
                            title: 'شعار المؤسسة',
                            value: invoice.imagelogo.toString())
                        : Container(),

                    invoice.participal != null
                        ? Column(
                            children: [
                              CardRow(
                                  value: invoice.participal!.name_participate
                                      .toString(),
                                  title: 'اسم المتعاون'),
                              CardRow(
                                  value: invoice.rate_participate.toString(),
                                  title: 'نسبة المتعاون'),
                              CardRow(
                                  value: invoice
                                      .participal!.numberbank_participate
                                      .toString(),
                                  title: 'رقم بنك المتعاون'),
                              CardRow(
                                  value: invoice.participal!.mobile_participate
                                      .toString(),
                                  title: 'رقم موبايل المتعاون'),
                            ],
                          )
                        : Container(),
                    invoice.agent_distibutor != null
                        ? Column(
                            children: [
                              CardRow(
                                  value: invoice.agent_distibutor!.nameAgent
                                      .toString(),
                                  title:
                                      invoice.agent_distibutor!.typeAgent == '1'
                                          ? 'اسم الوكيل'
                                          : 'اسم الموزع'),
                              if (invoice.rate_participate != null)
                                CardRow(
                                    value: invoice.rate_participate.toString(),
                                    title:
                                        invoice.agent_distibutor!.typeAgent ==
                                                '1'
                                            ? 'نسبة الوكيل'
                                            : 'نسبة الموزع'),
                              CardRow(
                                  value: invoice.agent_distibutor!.mobileAgent
                                      .toString(),
                                  title:
                                      invoice.agent_distibutor!.typeAgent == '1'
                                          ? 'رقم موبايل الوكيل'
                                          : 'رقم موبايل الموزع'),
                            ],
                          )
                        : Container(),

                    if (invoice.participal == null &&
                        invoice.agent_distibutor == null &&
                        invoice.type_seller == "3")
                      CardRow(value: "موظف", title: "نوع البائع"),

                    if (widget.showActions) ...{
                      Consumer<InvoiceVm>(
                        builder: (context, value, child) {
                          if (_isAllowedToChangeDeviceState()) {
                            return PrepareButton();
                          }
                          return SizedBox.shrink();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _privilegeCubit.checkPrivilege('141') &&
                                        invoice.isApprove == null ||
                                    _privilegeCubit.checkPrivilege('31') ==
                                            true &&
                                        invoice.isApprove != null
                                ? Expanded(
                                    child: CustomButton(
                                      text: 'تعديل الفاتورة',
                                      onTap: () async {
                                        if (clientmodel != null)
                                          AppNavigator.push(AddInvoice(
                                            invoice: invoice,
                                            itemClient: clientmodel!,
                                          ));
                                      },
                                    ),
                                  )
                                : Container(), // widget.type == 'approved'

                            if (_privilegeCubit.checkPrivilege('41') &&
                                invoice.isApprove != null) ...{
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomButton(
                                  text: 'الاجراءات',
                                  onTap: () async {
                                    if (clientmodel != null)
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) {
                                          return RejectDialog(
                                            invoice: invoice,
                                            clientModel: clientmodel!,
                                          );
                                        },
                                      );
                                  },
                                ),
                              ),
                            },
                            if (_privilegeCubit.checkPrivilege('32')) ...{
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomButton(
                                    text: 'حذف الفاتورة',
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('التأكيد'),
                                            content:
                                                Text('هل تريد حذف الفاتورة'),
                                            actions: <Widget>[
                                              new TextButton(
                                                onPressed: () =>
                                                    AppNavigator.pop(),
                                                child: Text('لا'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  AppNavigator.pop();
                                                  invoiceVm.deleteInvoice(
                                                      invoice.idInvoice!);
                                                  AppNavigator.pop();
                                                },
                                                child: Text('نعم'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                              ),
                            },
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_privilegeCubit.checkPrivilege('116') ||
                              (_privilegeCubit.checkPrivilege('189') &&
                                  invoice.isdoneinstall == null))
                            Expanded(
                              child: CustomButton(
                                text: 'اضافة دفعة للفاتورة',
                                onTap: () async {
                                  AppNavigator.push(add_payement(
                                    invoiceModel: invoice,
                                  ));
                                },
                              ),
                            ),
                          if (_privilegeCubit.checkPrivilege('115') ||
                              (_privilegeCubit.checkPrivilege('182') &&
                                  invoice.isApprove == null)) ...{
                            SizedBox(width: 5),
                            Expanded(
                              child: CustomButton(
                                text: 'تغيير بيانات الفاتورة',
                                onTap: () async {
                                  AppNavigator.push(EditInvoice(
                                    invoiceModel: invoice,
                                  ));
                                },
                              ),
                            ),
                          },
                        ],
                      ),
                      if (widget.type == 'approved') ...[
                        if (invoice.isApprove == null)
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  AppColors.kMainColor)),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ModalProgressHUD(
                                              inAsyncCall:
                                                  Provider.of<InvoiceVm>(
                                                          context)
                                                      .isapproved,
                                              child: AlertDialog(
                                                title: Text(''),
                                                content: Text('تأكيد العملية'),
                                                actions: <Widget>[
                                                  AppElevatedButton(
                                                    onPressed: () {
                                                      AppNavigator.pop(
                                                          result: false);
                                                    },
                                                    child: Text('لا'),
                                                  ),
                                                  AppElevatedButton(
                                                    onPressed: () async {
                                                      _setApproveClient(
                                                        context: context,
                                                        invoice: invoice,
                                                        isApprove: '1',
                                                      );
                                                    },
                                                    child: Text('نعم'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                        //Navigator.pop(context);
                                      },
                                      child: Text('Approve')),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: AppElevatedButton(
                                      backgroundColor: Colors.redAccent,
                                      onPressed: () async {
                                        _setApproveClient(
                                          context: context,
                                          invoice: invoice,
                                          isApprove: '0',
                                        );
                                      },
                                      child: Text('Refuse')),
                                ),
                              ],
                            ),
                          ),
                      ],
                      SizedBox(height: 10),
                      CustomButton(
                        text: 'مرفقات الفاتورة',
                        icon: Icons.file_present_rounded,
                        onTap: () {
                          AppNavigator.push(InvoiceFileGalleryPage());
                        },
                      ),
                      SizedBox(height: 20),
                    },
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _product(String name, String amount, String price) {
    return Column(
      children: [
        Row(
          children: [
            //Expanded flex 1
            Expanded(
              flex: 1,
              child: Text(
                name,
                style: TextStyle(fontFamily: kfontfamily2),
              ),
            ),

            // Spacer(),
            Text(
              amount,
              style: TextStyle(fontFamily: kfontfamily2),
            ),
            SizedBox(width: 13),
            Text(
              price,
              style: TextStyle(fontFamily: kfontfamily2),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  bool _isAllowedToChangeDeviceState() {
    return _privilegeCubit.checkPrivilege('191') &&
        invoiceVm.currentInvoice!.hasDevices == true &&
        DevicesStateEnum.isSalesTeam(invoiceVm.currentInvoice!.deviceState);
  }

  void _setApproveClient({
    required BuildContext context,
    required InvoiceModel invoice,
    required String isApprove,
  }) {
    invoiceVm.setApproveclient_vm({
      "isApprove": isApprove,
    }, invoice.idInvoice).then((value) {
      return value != false ? clear() : error();
    });
  }

  clear() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }

  error() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }
}
