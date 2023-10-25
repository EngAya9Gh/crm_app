import 'dart:io';
import 'dart:ui' as myui;

import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/widgetlogo.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as rt;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../labeltext.dart';
import '../../widgets/app_photo_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import 'add_payement.dart';
import 'edit_invoice.dart';
import 'invoice_file_gallery_page.dart';

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

  @override
  void initState() {
    context.read<invoice_vm>().setCurrentInvoice(widget.invoice);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ClientProvider>(context, listen: false)
          .get_byIdClient(widget.invoice.fkIdClient.toString(), (value) => clientmodel = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<invoice_vm>(context, listen: true).listInvoicesAccept;

    if (list.any((element) => element.idInvoice == widget.invoice.idInvoice))
      widget.invoice =
          list.firstWhereOrNull((element) => element.idInvoice == widget.invoice.idInvoice) ?? widget.invoice;

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
          child:
              //invoice!=null?
              Consumer<invoice_vm>(builder: (context, value, child) {
            final invoice = value.currentInvoice;

            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _product('اسم المنتج', 'الكمية', 'السعر'),
                    for (int index = 0; index < invoice!.products!.length; index++)
                      _product(invoice.products![index].nameProduct.toString(),
                          invoice.products![index].amount.toString(), invoice.products![index].price.toString()),
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

                    cardRow(title: 'اسم العميل', value: invoice.nameClient.toString()),
                    cardRow(title: 'اسم المؤسسة', value: invoice.name_enterprise.toString()),
                    cardRow(title: 'حالة الفاتورة', value: invoice.stateclient.toString()),
                    cardRow(title: 'فرع الفاتورة', value: invoice.name_regoin_invoice.toString()),

                    cardRow(title: 'اسم الموظف', value: invoice.nameUser.toString()),
                    cardRow(title: 'فرع الموظف', value: invoice.name_regoin_invoice.toString()),
                    //cardRow(title: 'حالة الفاتورة', value: invoice.amountPaid.toString()),

                    invoice.date_approve.toString() == null
                        ? cardRow(title: 'تاريخ عقد الإشتراك', value: invoice.date_approve.toString())
                        : Container(),

                    cardRow(title: 'المبلغ المدفوع', value: invoice.amountPaid.toString()),
                    cardRow(
                        title: ' المبلغ المتبقي',
                        value: ((num.tryParse(invoice.total?.toString() ?? "0") ?? 0) -
                                (num.tryParse(invoice.amountPaid?.toString() ?? "0") ?? 0))
                            .toStringAsFixed(2)),

                    invoice.renewYear != '0' && invoice.renewYear != null
                        ? cardRow(title: ' التجديد السنوي', value: invoice.renewYear.toString())
                        : Container(),
                    invoice.renew2year != '0' && invoice.renew2year != null
                        ? cardRow(title: 'تجديد الموارد البشرية', value: invoice.renew2year.toString())
                        : Container(),

                    invoice.renewPlus.toString() == '' || invoice.renewPlus == null
                        ? Container()
                        : cardRow(title: 'تجديد الفرع الإضافي', value: invoice.renewPlus.toString()),

                    cardRow(title: ' طريقة الدفع', value: invoice.typePay.toString() == '0' ? 'نقدا' : 'تحويل'),
                    //nameuserApprove

                    cardRow(
                        title: ' العملة',
                        value: invoice.currency_name == null
                            ? 'SAR'
                            : invoice.currency_name.toString() == '0'
                                ? 'USD'
                                : 'SAR'),

                    invoice.nameuserApprove != null
                        ? cardRow(title: 'معتمد الفاتورة', value: getnameshort(invoice.nameuserApprove.toString()))
                        : Container(),

                    invoice.nameuserApprove != null
                        ? cardRow(title: 'تاريخ اعتماد الفاتورة', value: invoice.date_approve.toString())
                        : Container(),
                    invoice.date_lastuserupdate != null
                        ? cardRow(
                            title: 'تاريخ آخر تعديل',
                            value: invoice.date_lastuserupdate != null ? invoice.date_lastuserupdate.toString() : '')
                        : Container(),
                    invoice.date_lastuserupdate != null
                        ? cardRow(
                            title: 'آخر تعديل من قبل',
                            value: invoice.date_lastuserupdate != null
                                ? getnameshort(invoice.lastuserupdateName.toString())
                                : '')
                        : Container(),

                    invoice.date_change_back != null
                        ? cardRow(title: 'تاريخ الإنسحاب', value: invoice.date_change_back.toString())
                        : Container(),
                    invoice.date_change_back != null
                        ? cardRow(title: 'تم الإنسحاب عن طريق', value: getnameshort(invoice.nameuserback.toString()))
                        : Container(),
                    invoice.fkuser_back != null
                        ? cardRow(title: 'المبلغ المسترجع', value: invoice.value_back.toString())
                        : Container(),
                    invoice.fkuser_back != null
                        ? cardRow(
                            title: 'سبب الإنسحاب',
                            value: invoice.desc_reason_back.toString(),
                            isExpanded: true,
                          )
                        : Container(),
                    invoice.numbarnch.toString().trim().isNotEmpty && invoice.numbarnch != null
                        ? cardRow(title: 'عدد الفروع', value: invoice.numbarnch.toString())
                        : Container(),
                    //invoice!.nummostda != null||
                    invoice.nummostda.toString().trim().isNotEmpty && invoice.nummostda != null
                        ? cardRow(title: 'عدد المستودعات ', value: invoice.nummostda.toString())
                        : Container(),
                    invoice.numusers.toString().trim().isNotEmpty && invoice.numusers != null
                        ? cardRow(title: 'عدد المستخدمين', value: invoice.numusers.toString())
                        : Container(),
                    invoice.address_invoice.toString() == ''
                        ? cardRow(title: 'عنوان الفاتورة', value: invoice.address_invoice.toString())
                        : Container(),

                    Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('76') == true
                        ? invoice.clientusername != null && invoice.clientusername.toString().isNotEmpty
                            ? cardRow(
                                title: 'يوزر العميل',
                                value: invoice.clientusername == null ? '' : invoice.clientusername.toString())
                            : Container()
                        : Container(),

                    invoice.imagelogo != null && invoice.imagelogo.toString().isNotEmpty
                        ? widgetlogo(title: 'شعار المؤسسة', value: invoice.imagelogo.toString())
                        : Container(),

                    invoice.participal != null
                        ? Column(
                            children: [
                              cardRow(value: invoice.participal!.name_participate.toString(), title: 'اسم المتعاون'),
                              cardRow(value: invoice.rate_participate.toString(), title: 'نسبة المتعاون'),
                              cardRow(
                                  value: invoice.participal!.numberbank_participate.toString(),
                                  title: 'رقم بنك المتعاون'),
                              cardRow(
                                  value: invoice.participal!.mobile_participate.toString(),
                                  title: 'رقم موبايل المتعاون'),
                            ],
                          )
                        : Container(),
                    invoice.agent_distibutor != null
                        ? Column(
                            children: [
                              cardRow(
                                  value: invoice.agent_distibutor!.nameAgent.toString(),
                                  title: invoice.agent_distibutor!.typeAgent == '1' ? 'اسم الوكيل' : 'اسم الموزع'),
                              if (invoice.rate_participate != null)
                                cardRow(
                                    value: invoice.rate_participate.toString(),
                                    title: invoice.agent_distibutor!.typeAgent == '1' ? 'نسبة الوكيل' : 'نسبة الموزع'),
                              cardRow(
                                  value: invoice.agent_distibutor!.mobileAgent.toString(),
                                  title: invoice.agent_distibutor!.typeAgent == '1'
                                      ? 'رقم موبايل الوكيل'
                                      : 'رقم موبايل الموزع'),
                            ],
                          )
                        : Container(),

                    if (invoice.participal == null && invoice.agent_distibutor == null && invoice.type_seller == "3")
                      cardRow(value: "موظف", title: "نوع البائع"),

                    if (widget.showActions) ...{
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('141') == true &&
                                        invoice.isApprove == null ||
                                    Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('31') == true &&
                                        invoice.isApprove != null
                                ? CustomButton(
                                    text: 'تعديل الفاتورة',
                                    onTap: () async {
                                      if (clientmodel != null)
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    addinvoice(invoice: invoice, itemClient: clientmodel!)));
                                    },
                                  )
                                : Container(), // widget.type == 'approved'
                            //     ? invoice.isApprove == null
                            Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('41') == true
                                ? invoice.isApprove != null
                                    ? CustomButton(
                                        text: 'الاجراءات',
                                        onTap: () async {
                                          if (clientmodel != null)
                                            showDialog<void>(
                                              context: context,
                                              builder: (context) => RejectDialog(
                                                invoice: invoice,
                                                clientModel: clientmodel!,
                                              ),
                                            );
                                        },
                                      )
                                    : Container()
                                : Container(),
                            Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('32') == true
                                ? CustomButton(
                                    //width: MediaQuery.of(context).size.width * 0.2,
                                    text: 'حذف الفاتورة',
                                    onTap: () async {
                                      bool result = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('التأكيد'),
                                            content: Text('هل تريد حذف الفاتورة'),
                                            actions: <Widget>[
                                              new TextButton(
                                                onPressed: () {
                                                  Navigator.of(context, rootNavigator: true)
                                                      .pop(false); // dismisses only the dialog and returns false
                                                },
                                                child: Text('لا'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.of(context, rootNavigator: true).pop(true);
                                                  // dismisses only the dialog and returns true
                                                  // if(itemProd.idInvoice!=null)
                                                  print('das');
                                                  DateTime _currentDate = DateTime.now();
                                                  final rt.DateFormat formatter = rt.DateFormat('yyyy-MM-dd');
                                                  // Provider.of<invoice_vm>(context, listen: false)
                                                  //     .addlistinvoicedeleted(DeletedinvoiceModel(
                                                  //   fkClient: invoice.fkIdClient.toString(),
                                                  //   fkUser: Provider.of<user_vm_provider>(context, listen: false)
                                                  //       .currentUser
                                                  //       .idUser,
                                                  //   //cuerrent user
                                                  //   dateDelete: formatter.format(_currentDate),
                                                  //   //city:itemProd.
                                                  //   nameClient: invoice.nameClient.toString(),
                                                  //   nameEnterprise: clientmodel.nameEnterprise,
                                                  //   mobileclient: clientmodel.mobile,
                                                  //   //mobileuser:widget.itemClient. ,
                                                  //   // nameUser: widget.itemProd
                                                  //   //     .nameUser, //موظف المبيعات
                                                  //   nameUser: Provider.of<user_vm_provider>(context, listen: false)
                                                  //       .currentUser
                                                  //       .nameUser, //name user that doing delete
                                                  // ));
                                                  Provider.of<invoice_vm>(context, listen: false).delete_invoice({
                                                    "id_invoice": invoice.idInvoice.toString(),
                                                    'fk_regoin': invoice.fk_regoin.toString(),
                                                    'fkcountry': invoice.fk_country.toString(),
                                                    "fkUserdo": Provider.of<UserProvider>(context, listen: false)
                                                        .currentUser
                                                        .idUser
                                                        .toString(),
                                                    "name_enterprise": clientmodel?.nameEnterprise.toString(),
                                                    "nameUserdo": Provider.of<UserProvider>(context, listen: false)
                                                        .currentUser
                                                        .nameUser
                                                        .toString(),
                                                  }, invoice.idInvoice);
                                                  Navigator.pop(context);
                                                },
                                                child: Text('نعم'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    })
                                : Container(),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('116') == true
                              ? CustomButton(
                                  //width: MediaQuery.of(context).size.width * 0.2,
                                  text: 'اضافة دفعة للفاتورة',
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => add_payement(
                                                  invoiceModel: invoice,
                                                ) // support_view(type: 'only',)
                                            ));
                                  },
                                )
                              : Container(),
                          SizedBox(width: 5),
                          Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('115') == true
                              ? CustomButton(
                                  //width: MediaQuery.of(context).size.width * 0.2,
                                  text: 'تغيير بيانات الفاتورة',
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => edit_invoice(
                                                  invoiceModel: invoice,
                                                ) // support_view(type: 'only',)
                                            ));
                                  },
                                )
                              : Container(),
                        ],
                      ),
                      widget.type == 'approved'
                          ? invoice.isApprove == null
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return ModalProgressHUD(
                                                  inAsyncCall: Provider.of<invoice_vm>(context).isapproved,
                                                  child: AlertDialog(
                                                    title: Text(''),
                                                    content: Text('تأكيد العملية'),
                                                    actions: <Widget>[
                                                      new ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                        onPressed: () {
                                                          Navigator.of(context, rootNavigator: true).pop(
                                                              false); // dismisses only the dialog and returns false
                                                        },
                                                        child: Text('لا'),
                                                      ),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                        onPressed: () async {
                                                          // Navigator.of(context,
                                                          //     rootNavigator: true)
                                                          //     .pop(true);
                                                          // update client to approved client
                                                          Provider.of<invoice_vm>(context, listen: false)
                                                              .setApproveclient_vm({
                                                            "id_clients": invoice.fkIdClient,
                                                            'date_approve': DateTime.now().toString(),
                                                            //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                            "fk_user": invoice.fkIdUser, //صاحب العميل
                                                            "fk_regoin": invoice.fk_regoin,
                                                            "regoin": invoice.name_regoin,
                                                            "fk_country": invoice.fk_country,
                                                            "isApprove": "1",
                                                            "name_enterprise": invoice.name_enterprise,
                                                            "fkusername": invoice.nameUser, //موظف المبيعات
                                                            //"message":"",//
                                                            "nameuserApproved":
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .nameUser,
                                                            "iduser_approve":
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .idUser //معتمد الاشتراك
                                                          }, invoice.idInvoice).then((value) =>
                                                                      value != false ? clear() : error() // clear()
                                                                  // _scaffoldKey.currentState!.showSnackBar(
                                                                  //     SnackBar(content: Text('هناك مشكلة ما')))
                                                                  );
                                                          //Navigator.of(context,rootNavigator: true).pop();
                                                          // Navigator.pop(context);
                                                          // Navigator.pushAndRemoveUntil(context,
                                                          //     CupertinoPageRoute(builder: (context)=>Home()),
                                                          //         (route) => true
                                                          // );//this is active
                                                          //  Navigator.pushReplacement(context,
                                                          //      CupertinoPageRoute(builder:
                                                          //          (context)=>ApprovePage()));
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
                                      SizedBox(
                                        width: 4,
                                      ),
                                      ElevatedButton(
                                          style:
                                              ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                                          onPressed: () async {
                                            Provider.of<invoice_vm>(context, listen: false).setApproveclient_vm({
                                              "id_clients": invoice.fkIdClient,
                                              //'idApproveClient':widget.itemapprove!.idApproveClient,
                                              "fk_user": invoice.fkIdUser,
                                              "fk_regoin": invoice.fk_regoin,
                                              "regoin": invoice.name_regoin,
                                              "fk_country": invoice.fk_country,
                                              "isApprove": "0",
                                              "name_enterprise": invoice.name_enterprise,
                                              "fkusername": invoice.nameUser, //موظف المبيعات
                                              //"message":"",//
                                              "nameuserApproved": Provider.of<UserProvider>(context, listen: false)
                                                  .currentUser
                                                  .nameUser,
                                              "iduser_approve": Provider.of<UserProvider>(context, listen: false)
                                                  .currentUser
                                                  .idUser //معتمد الاشتراك
                                            }, invoice.idInvoice).then(
                                                (value) => value != false ? clear() : error() // clear()
                                                // _scaffoldKey.currentState!.showSnackBar(
                                                //     SnackBar(content: Text('هناك مشكلة ما'))
                                                // )
                                                );
                                            // Navigator.pushAndRemoveUntil(context,
                                            //     CupertinoPageRoute(builder: (context)=>Home()),
                                            //         (route) => true
                                            // );
                                            // bool result = await showDialog(
                                            //   context: context,
                                            //   builder: (context) {
                                            //     return AlertDialog(
                                            //       title: Text(''),
                                            //       content: Text('تأكيد العملية  '),
                                            //       actions: <Widget>[
                                            //         new ElevatedButton(
                                            //           style: ButtonStyle(
                                            //               backgroundColor: MaterialStateProperty.all(
                                            //                   kMainColor)),
                                            //           onPressed: () {
                                            //             Navigator.of(context,
                                            //                 rootNavigator: true)
                                            //                 .pop(
                                            //                 false); // dismisses only the dialog and returns false
                                            //           },
                                            //           child: Text('لا'),
                                            //         ),
                                            //         ElevatedButton(
                                            //           style: ButtonStyle(
                                            //               backgroundColor: MaterialStateProperty.all(
                                            //                   kMainColor)),
                                            //           onPressed: () async {
                                            //
                                            //             // Navigator.of(context,
                                            //             //     rootNavigator: true)
                                            //             //     .pop(true);
                                            //             Navigator.of(context,rootNavigator: true).pop();
                                            //
                                            //             // Navigator.pushReplacement(context,
                                            //             //     CupertinoPageRoute(builder:
                                            //             //         (context)=>ApprovePage()));
                                            //
                                            //             Navigator.pushAndRemoveUntil(context,
                                            //                 CupertinoPageRoute(builder: (context)=>Home()),
                                            //                     (route) => false
                                            //             );
                                            //           },
                                            //           child: Text('نعم'),
                                            //         ),
                                            //       ],
                                            //     );
                                            //   },
                                            // );
                                            //send notification
                                            //Navigator.pop(context);
                                          },
                                          child: Text('Refuse')),
                                    ],
                                  ),
                                )
                              : Container()
                          : Container(),
                      SizedBox(height: 10),
                      CustomButton(
                        text: 'مرفقات الفاتورة',
                        icon: Icons.file_present_rounded,
                        onTap: () async {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => InvoiceFileGalleryPage()));
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

  clear() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }

  error() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }
}

class RejectDialog extends StatefulWidget {
  const RejectDialog({
    Key? key,
    required this.invoice,
    required this.clientModel,
  });

  final InvoiceModel invoice;
  final ClientModel clientModel;

  @override
  State<RejectDialog> createState() => _RejectDialogState();
}

class _RejectDialogState extends State<RejectDialog> {
  final TextEditingController valueBackController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();
  late ClientType typeclient_provider;
  late InvoiceModel _invoice;
  File? selectedFile;

  @override
  void initState() {
    _invoice = widget.invoice;
    if (_invoice.desc_reason_back?.isNotEmpty ?? false)
      descresaonController.text = _invoice.desc_reason_back.toString();
    if (_invoice.value_back?.isNotEmpty ?? false) valueBackController.text = _invoice.value_back.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      typeclient_provider = Provider.of<ClientType>(context, listen: false);
      typeclient_provider.getreasons('client');

      typeclient_provider.selectedValueOut = _invoice.reason_back == null ? null : _invoice.reason_back.toString();
      // typeclient_provider.changevalueOut(typeclient_provider.selectedValueOut.toString());
      String val = (_invoice.date_change_back?.isNotEmpty ?? false)
          ? _invoice.date_change_back.toString()
          : formatter.format(DateTime.now());
      _currentDate = DateTime.parse(val);
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(_currentDate);
    });
    super.initState();
  }

  @override
  void dispose() {
    valueBackController.dispose();
    descresaonController.dispose();
    super.dispose();
  }

  clear_back() {
    descresaonController.text = '';
    valueBackController.text = '';
  }

  DateTime _currentDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3000));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;
      });
    Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(_currentDate);
  }

  final _globalKey = GlobalKey<FormState>();

  pickImage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(
        onPickFile: (context, file) {
          selectedFile = file;
          _invoice = _invoice.copyWith(attachFileStatus: AttachFileStatus.init);
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      title: Center(child: Text('تحويل العميل إلى منسحب', style: TextStyle(fontFamily: kfontfamily2))),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Form(
                key: _globalKey,
                child: Column(
                  children: [
                    RowEdit(name: "اسباب الإنسحاب", des: '*'),
                    Consumer<ClientType>(
                      builder: (context, cart, child) {
                        print("cart.type_of_out ${cart.type_of_out}");
                        print("cart.selectedValueOut ${cart.selectedValueOut}");
                        return DropdownButton(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.type_of_out.map((levelOne) {
                            return DropdownMenuItem(
                              child: Text(levelOne.nameReason), //label of item
                              value: levelOne.idReason, //value of item
                            );
                          }).toList(),
                          value: cart.selectedValueOut,
                          onChanged: (value) {
                            cart.changevalueOut(value.toString());
                          },
                        );
                      },
                    ),
                    SizedBox(height: 3),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return label_empty;
                        }
                      },
                      hintText: "وصف سبب الإنسحاب",
                      paddcustom: EdgeInsets.all(8),
                      maxline: 5,
                      controller: descresaonController,
                    ),
                    SizedBox(height: 3),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return label_empty;
                        }
                      },
                      hintText: 'المبلغ المسترجع',
                      controller: valueBackController,
                    ),
                    SizedBox(height: 3),
                    RowEdit(name: "تاريخ الإنسحاب", des: '*'),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: kMainColor,
                        ),
                        hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                        hintText: //_currentDate.toString(),
                            Provider.of<datetime_vm>(context, listen: true).valuedateTime.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          _selectDate(context, _currentDate);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: selectedFile != null
                          ? Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(selectedFile!, fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () => pickImage(),
                                              borderRadius: BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(Icons.attachment_rounded,
                                                    color: Colors.grey.shade700, size: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            deleteFile();
                                          },
                                          borderRadius: BorderRadius.circular(90),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            margin: EdgeInsets.only(top: 10, left: 15),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.delete_rounded,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : (_invoice.file_reject?.isNotEmpty ?? false)
                              ? InkWell(
                                  onTap: () => AppPhotoViewer(urls: [urlfile + _invoice.file_reject!]).show(context),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: FancyImageShimmerViewer(
                                            imageUrl: urlfile + _invoice.file_reject!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () => pickImage(),
                                                borderRadius: BorderRadius.circular(90),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  margin: EdgeInsets.only(top: 10, right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade50,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.attachment_rounded,
                                                    color: Colors.grey.shade700,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  deleteImageReject();
                                                },
                                                borderRadius: BorderRadius.circular(90),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  margin: EdgeInsets.only(top: 10, right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade50,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.delete_rounded,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () => pickImage(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.attachment_rounded, color: Colors.grey.shade700, size: 35),
                                      SizedBox(height: 0),
                                      Text(
                                        'Attach file',
                                        style: context.textTheme.titleMedium?.copyWith(
                                            fontFamily: kfontfamily2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                    ),
                    SizedBox(height: 6),
                    Consumer<invoice_vm>(
                      builder: (context, value, child) {
                        if (value.isloading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return (_invoice.file_reject?.isNotEmpty ?? false)
                            ? (Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('145') == true
                                ? Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                      onPressed: () async {
                                        // if (selectedFile == null && (_invoice.file_reject?.isEmpty ?? true)) {
                                        //   ScaffoldMessenger.of(context).showSnackBar (SnackBar(content: Text("من فضلك قم ياختيار ملف")));
                                        //   return;
                                        // }
                                        if (_globalKey.currentState!.validate()) {
                                          _globalKey.currentState!.save();

                                          await Provider.of<invoice_vm>(context, listen: false).deleteBack(
                                              _invoice.idInvoice.toString(), _invoice.file_reject.toString());

                                          clear_back();

                                          Navigator.of(context, rootNavigator: true).pop(false);
                                        }
                                      },
                                      child: Text('حذف الطلب'),
                                    ),
                                  )
                                : SizedBox.shrink())
                            : Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                      onPressed: () async {
                                        if (selectedFile == null && (_invoice.file_reject?.isEmpty ?? true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(content: Text("من فضلك قم ياختيار ملف")));
                                          return;
                                        }
                                        if (_globalKey.currentState!.validate()) {
                                          _globalKey.currentState!.save();

                                          await Provider.of<invoice_vm>(context, listen: false).set_state_back({
                                            'type_back': 'back',
                                            'fk_regoin': _invoice.fk_regoin.toString(),
                                            'fkcountry': _invoice.fk_country.toString(),
                                            "fkUserdo": Provider.of<UserProvider>(context, listen: false)
                                                .currentUser
                                                .idUser
                                                .toString(),
                                            "name_enterprise": widget.clientModel.nameEnterprise.toString(),
                                            "nameUserdo": Provider.of<UserProvider>(context, listen: false)
                                                .currentUser
                                                .nameUser
                                                .toString(),
                                            "fk_client": _invoice.fkIdClient.toString(),
                                            "reason_back": typeclient_provider.selectedValueOut.toString(),
                                            "fkuser_back": Provider.of<UserProvider>(context, listen: false)
                                                .currentUser
                                                .idUser
                                                .toString(),
                                            "desc_reason_back": descresaonController.text.toString(),
                                            "date_change_back": _currentDate.toString(),
                                            "value_back": valueBackController.text.toString(),
                                          }, _invoice.idInvoice.toString(), selectedFile);
                                          Navigator.of(context, rootNavigator: true).pop(false);
                                        }
                                      },
                                      child: Text('انسحاب'),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                      onPressed: () async {
                                        if (selectedFile == null && (_invoice.file_reject?.isEmpty ?? true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(content: Text("من فضلك قم ياختيار ملف")));
                                          return;
                                        }
                                        if (_globalKey.currentState!.validate()) {
                                          _globalKey.currentState!.save();

                                          await Provider.of<invoice_vm>(context, listen: false).set_state_back({
                                            'type_back': 'return',
                                            'fk_regoin': _invoice.fk_regoin.toString(),
                                            'fkcountry': _invoice.fk_country.toString(),
                                            "fkUserdo": Provider.of<UserProvider>(context, listen: false)
                                                .currentUser
                                                .idUser
                                                .toString(),
                                            "name_enterprise": widget.clientModel.nameEnterprise.toString(),
                                            "nameUserdo": Provider.of<UserProvider>(context, listen: false)
                                                .currentUser
                                                .nameUser
                                                .toString(),
                                            "fk_client": _invoice.fkIdClient.toString(),
                                            "reason_back": typeclient_provider.selectedValueOut.toString(),
                                            "fkuser_back": Provider.of<UserProvider>(context, listen: false)
                                                .currentUser
                                                .idUser
                                                .toString(),
                                            "desc_reason_back": descresaonController.text.toString(),
                                            "date_change_back": _currentDate.toString(),
                                            "value_back": valueBackController.text.toString(),
                                          }, _invoice.idInvoice.toString(), selectedFile);
                                          Navigator.of(context, rootNavigator: true).pop(false);
                                        }
                                      },
                                      child: Text('ارجاع'),
                                    ),
                                  ],
                                ),
                              );
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

  void deleteFile() {
    setState(() {
      selectedFile = null;
    });
  }

  void deleteImageReject() {
    setState(() {
      _invoice = _invoice.copyWith(deleteRejectImage: true);
    });
  }
}
