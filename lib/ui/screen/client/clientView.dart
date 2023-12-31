import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/addClient.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';

class ClientView extends StatefulWidget {
  ClientView(
      {this.clienttransfer, required this.invoice, this.typeinvoice, required this.idclient, this.client, Key? key})
      : super(key: key);
  String idclient;
  InvoiceModel? invoice;
  String? clienttransfer;
  String? typeinvoice;
  ClientModel? client;

  //bool? itemapprove;
  @override
  _ClientViewState createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // late ClientModel clientModel = ClientModel();

  @override
  Widget build(BuildContext context) {
    // clientModel = widget.client ??
    //     Provider.of<client_vm>(context, listen: true)
    //         .listClient
    //         .firstWhere((element) => element.idClients == widget.idclient);

    return Consumer<client_vm>(
        builder: (context, state, _) {
          if (state.currentClientModel.isLoading || state.currentClientModel.isInit) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state.currentClientModel.isFailure) {
            return Scaffold(
              body: Center(
                child: IconButton(
                  onPressed: () => context.read<client_vm>().get_byIdClient(widget.idclient.toString()),
                  icon: Icon(Icons.refresh),
                ),
              ),
            );
          }
          final ClientModel  clientModel = state.currentClientModel.data! ;

          return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            // height: MediaQuery.of(context).size.height*0.73,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 10),
              child: SingleChildScrollView(
                child: Column(children: [
                  // InkWell(
                  //     onTap: ()async{
                  //       await FlutterPhoneDirectCaller.callNumber(clientModel.mobile.toString());
                  //     },
                  //     child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            //color: kMainColor,
                            decoration:
                                BoxDecoration(color: kMainColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: IconButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(clientModel.mobile.toString());
                              },
                              icon: Icon(Icons.call),
                              iconSize: 15,
                              color: kWhiteColor,
                            ),
                          ),
                          (Provider.of<privilge_vm>(context, listen: false)
                              .checkprivlge('133') == true)?
                            IconButton(
                              onPressed: () {
                                context.read<client_vm>().setTagClient();
                              },
                              icon: Icon(
                                (clientModel!.tag ?? false)
                                    ? CupertinoIcons.checkmark_seal_fill
                                    : CupertinoIcons.checkmark_seal,
                                color: (clientModel.tag ?? false) ? Colors.amber : null,
                              ),
                              tooltip: (clientModel.tag ?? false) ? "مميز" : "غير مميز",
                            ):Container(),
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(clientModel.mobile.toString());
                        },
                        child: Text(
                          clientModel.mobile.toString(),
                          style: TextStyle(fontFamily: kfontfamily2, color: kMainColor),
                        ),
                      ),
                      // Text(clientModel.mobile.toString(),
                      //   style: TextStyle(
                      //       fontFamily: kfontfamily2,
                      //       color: Colors.black
                      //   ),
                      // ),
                    ],
                  ),
                  //cardRow(  title:'رقم الهاتف',value:clientModel.mobile.toString())
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  cardRow(title: 'تاريخ الاضافة', value: clientModel.dateCreate.toString()),
                  cardRow(
                    title: 'المؤسسة',
                    value: clientModel.nameEnterprise.toString(),
                    isExpanded: true,
                  ),
                  cardRow(
                    title: 'اسم العميل',
                    value: clientModel.nameClient.toString(),
                    isExpanded: true,
                  ),
                  cardRow(title: ' الفرع', value: clientModel.name_regoin.toString()),

                  cardRow(title: ' نوع النشاط', value: clientModel.activity_type_title?.toString() ?? "لا يوجد"),
                  cardRow(title: ' مدينة العميل', value: clientModel.name_city.toString()),
                  cardRow(title: ' المنطقة', value: clientModel.namemaincity.toString()),

                  clientModel.phone == '' || clientModel.phone == null
                      ? Container()
                      : cardRow(title: ' رقم آخر', value: clientModel.phone.toString()),

                  cardRow(title: 'حالة العميل', value: clientModel.typeClient.toString()),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: 'قام بتحويل حالة العميل', title: clientModel.nameuserdoning.toString())
                      : Container(),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: 'تاريخ تحويل حالة العميل', title: clientModel.dateChangetype.toString())
                      : Container(),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: 'سبب الاستبعاد', title: clientModel.reasonChange.toString())
                      : Container(),

                  clientModel.offer_price != null && clientModel.offer_price.toString().trim().isNotEmpty
                      ? cardRow(title: 'مبلغ عرض السعر', value: clientModel.offer_price.toString())
                      : Container(),

                  clientModel.offer_price != null && clientModel.offer_price.toString().trim().isNotEmpty
                      ? cardRow(title: 'تاريخ عرض السعر', value: clientModel.date_price.toString())
                      : Container(),

                  clientModel.offer_price != null && clientModel.offer_price.toString().trim().isNotEmpty
                      ? cardRow(title: 'الموظف الذي قام بتغيير حالة العميل', value: clientModel.nameuserdoning.toString())
                      : Container(),

                  cardRow(title: 'الموظف الذي أضاف العميل', value: getnameshort(clientModel.nameAdduser.toString())),
                  cardRow(title: 'الموظف', value: getnameshort(clientModel.nameUser.toString())),

                  cardRow(title: 'رقم الموظف', value: clientModel.mobileuser.toString()),

                  (clientModel.reasonTransfer == null) && clientModel.fkusertrasfer != null
                      ? cardRow(title: 'قام بتحويل العميل', value: getnameshort(clientModel.nameusertransfer.toString()))
                      : Container(),

                  (clientModel.reasonTransfer == null) && clientModel.fkusertrasfer != null
                      ? cardRow(title: 'تاريخ التحويل', value: clientModel.dateTransfer.toString())
                      : Container(),

                  clientModel.location.toString() == ''
                      ? Container()
                      : cardRow(title: ' الموقع', value: clientModel.location.toString()),

                  clientModel.ismarketing == '1'
                      ? cardRow(title: ' عميل تسويق الكتروني', value: clientModel.ismarketing == '1' ? 'نعم' : '')
                      : Container(),

                  cardRow(
                      title: 'عنوان العميل',
                      value: clientModel.address_client == null ? '' : clientModel.address_client.toString()),

                  clientModel.presystem == null || clientModel.presystem.toString().trim().isEmpty
                      ? Container()
                      : cardRow(
                          title: 'نظام سابق',
                          value: clientModel.presystemtitle == null ? '' : clientModel.presystemtitle.toString()),

                  cardRow(
                      title: 'مصدر العميل',
                      value: clientModel.sourcclient == null ? '' : clientModel.sourcclient.toString()),

                  clientModel.activity_type_fk == null
                      ? cardRow(title: 'نوع النشاط', value: clientModel.activity_type_title.toString())
                      : Container(),

                  clientModel.activity_type_fk == null
                      ? cardRow(title: 'وصف النشاط', value: clientModel.descActivController.toString())
                      : Container(),

                  widget.clienttransfer == 'transfer'
                      ? Container()
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => editclient(
                                              itemClient: clientModel,
                                              fkclient: clientModel.idClients.toString(),
                                              fkuser: clientModel.fkUser.toString())));
                                },
                                child: Text('تعديل بيانات العميل'),
                              ),
                              clientModel.typeClient == "عرض سعر" || clientModel.typeClient == "تفاوض"
                                  ? SizedBox(
                                      width: 5,
                                    )
                                  : Container(),
                              clientModel.reasonTransfer == null
                                  ? ElevatedButton(
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) => transferClient(
                                                      name_enterprise: clientModel.nameEnterprise.toString(),
                                                      idclient: clientModel.idClients.toString(),
                                                      type: "client",
                                                    ),
                                                fullscreenDialog: true));
                                      },
                                      child: Text('تحويل العميل'),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  // Provider.of<privilge_vm>(context,listen: true)
                  //     .checkprivlge('2')==true ||
                  //     Provider.of<privilge_vm>(context,listen: true)
                  //         .checkprivlge('7')==true?

                  widget.clienttransfer == null
                      ? Container()
                      : Center(
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
                                          inAsyncCall: Provider.of<client_vm>(context).isapproved,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AlertDialog(
                                              titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 15.0),
                                              insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                              contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                                              title: Center(child: Text('Confirmation')),
                                              content: Text(' هل تريد تأكيد العملية؟  '),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  style:
                                                      ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                  onPressed: () async {
                                                    String? reason_transfer = null;
                                                    //update fkuser to new user
                                                    Provider.of<client_vm>(context, listen: false).setfkUserApprove({
                                                      'approve': '1',
                                                      'reason_transfer': reason_transfer.toString(),
                                                      'fkuser': Provider.of<user_vm_provider>(context, listen: false)
                                                          .currentUser
                                                          .idUser
                                                          .toString(), //user reciept
                                                      // 'nameusertransfer':
                                                      // Provider.of<user_vm_provider>(context,listen: false)
                                                      //     .currentUser.nameUser.toString(),//الموظف الذي حول العميل
                                                      'name_enterprise': clientModel.nameEnterprise,
                                                      'fk_regoin': Provider.of<user_vm_provider>(context, listen: false)
                                                          .currentUser
                                                          .fkRegoin
                                                          .toString(),
                                                      //'idclient':
                                                    }, widget.idclient).then(
                                                        (value) => value != false ? clear() : error());
                                                  },
                                                  child: Text('نعم'),
                                                ),
                                                new ElevatedButton(
                                                  style:
                                                      ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                  onPressed: () {
                                                    Navigator.of(context, rootNavigator: true)
                                                        .pop(false); // dismisses only the dialog and returns false
                                                  },
                                                  child: Text('لا'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    //Navigator.pop(context);
                                  },
                                  child: Text('قبول تحويل العميل')),
                              SizedBox(
                                width: 4,
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                                  onPressed: () async {
                                    // Navigator.pushAndRemoveUntil(context,
                                    //     CupertinoPageRoute(builder: (context)=>Home()),
                                    //         (route) => true
                                    // );
                                    String? reason_transfer = null;
                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ModalProgressHUD(
                                          inAsyncCall: Provider.of<client_vm>(context).isapproved,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AlertDialog(
                                              titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 15.0),
                                              insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                              contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                                              title: Center(child: Text('Confirmation')),
                                              content: Text(' هل تريد تأكيد العملية؟  '),
                                              actions: <Widget>[
                                                new ElevatedButton(
                                                  style:
                                                      ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                  onPressed: () async {
                                                    Provider.of<client_vm>(context, listen: false).setfkUserApprove({
                                                      'userrefuse': Provider.of<user_vm_provider>(context, listen: false)
                                                          .currentUser
                                                          .nameUser,
                                                      'fkuserclient': clientModel.fkUser.toString(), //صاحب العميل
                                                      'reason_transfer': reason_transfer.toString(),
                                                      'fkusertrasfer': reason_transfer.toString(),
                                                      'date_transfer': reason_transfer.toString(),
                                                      'name_enterprise': clientModel.nameEnterprise,
                                                    }, widget.idclient).then(
                                                        (value) => value != false ? clear() : error() // clear()
                                                        // _scaffoldKey.currentState!.showSnackBar(
                                                        //     SnackBar(content: Text('هناك مشكلة ما'))
                                                        // )
                                                        );
                                                  },
                                                  child: Text('نعم'),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                  onPressed: () {
                                                    Navigator.of(context, rootNavigator: true)
                                                        .pop(false); // dismisses only the dialog and returns false
                                                  },
                                                  child: Text('لا'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text('رفض تحويل العميل')),
                            ],
                          ),
                        ),
                  widget.invoice != null
                      ? widget.invoice!.isApprove == null
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
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 15.0),
                                                  insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                                  contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                                                  title: Center(child: Text('Confirmation')),
                                                  content: Text(' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
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
                                                          "id_clients": widget.invoice!.fkIdClient,
                                                          //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                          'date_approve': DateTime.now().toString(),
                                                          "fk_user": widget.invoice!.fkIdUser, //صاحب العميل
                                                          "fk_regoin": widget.invoice!.fk_regoin,
                                                          "regoin": widget.invoice!.name_regoin,
                                                          "fk_country": widget.invoice!.fk_country,
                                                          "isApprove": "1",
                                                          "name_enterprise": widget.invoice!.name_enterprise,
                                                          "fkusername": widget.invoice!.nameUser, //موظف المبيعات
                                                          //"message":"",//
                                                          "nameuserApproved":
                                                              Provider.of<user_vm_provider>(context, listen: false)
                                                                  .currentUser
                                                                  .nameUser,
                                                          "iduser_approve":
                                                              Provider.of<user_vm_provider>(context, listen: false)
                                                                  .currentUser
                                                                  .idUser //معتمد الاشتراك
                                                        }, widget.invoice!.idInvoice).then(
                                                                (value) => value != false ? clear() : error() // clear()
                                                                // _scaffoldKey.currentState!.showSnackBar(
                                                                //     SnackBar(content: Text('هناك مشكلة ما')))
                                                                );
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context, rootNavigator: true)
                                                            .pop(false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
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
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                                      onPressed: () async {
                                        // Navigator.pushAndRemoveUntil(context,
                                        //     CupertinoPageRoute(builder: (context)=>Home()),
                                        //         (route) => true
                                        // );
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ModalProgressHUD(
                                              inAsyncCall: Provider.of<invoice_vm>(context).isapproved,
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 15.0),
                                                  insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                                  contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                                                  title: Center(child: Text('Confirmation')),
                                                  content: Text(' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                      onPressed: () async {
                                                        Provider.of<invoice_vm>(context, listen: false)
                                                            .setApproveclient_vm({
                                                          "id_clients": widget.invoice!.fkIdClient,
                                                          //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                          "fk_user": widget.invoice!.fkIdUser,
                                                          "fk_regoin": widget.invoice!.fk_regoin,
                                                          "regoin": widget.invoice!.name_regoin,
                                                          "fk_country": widget.invoice!.fk_country,
                                                          "isApprove": "0",
                                                          "name_enterprise": widget.invoice!.name_enterprise,
                                                          "fkusername": widget.invoice!.nameUser, //موظف المبيعات
                                                          //"message":"",//
                                                          "nameuserApproved":
                                                              Provider.of<user_vm_provider>(context, listen: false)
                                                                  .currentUser
                                                                  .nameUser,
                                                          "iduser_approve":
                                                              Provider.of<user_vm_provider>(context, listen: false)
                                                                  .currentUser
                                                                  .idUser //معتمد الاشتراك
                                                        }, widget.invoice!.idInvoice).then(
                                                                (value) => value != false ? clear() : error() // clear()
                                                                // _scaffoldKey.currentState!.showSnackBar(
                                                                //     SnackBar(content: Text('هناك مشكلة ما'))
                                                                // )
                                                                );
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context, rootNavigator: true)
                                                            .pop(false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        //send notification
                                        //Navigator.pop(context);
                                      },
                                      child: Text('Refuse')),
                                ],
                              ),
                            )
                          : Container()
                      : Container(), //:Container(),

                  //approve finance
                  widget.invoice != null
                      ? widget.invoice!.isApprove != 1 &&
                              widget.invoice!.isApproveFinance == null &&
                              Provider.of<privilge_vm>(context, listen: true).checkprivlge('111') == true &&
                              widget.typeinvoice == 'f'
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
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 15.0),
                                                  insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                                  contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                                                  title: Center(child: Text('Confirmation')),
                                                  content: Text(' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                      onPressed: () async {
                                                        // Navigator.of(context,
                                                        //     rootNavigator: true)
                                                        //     .pop(true);
                                                        // update client to approved client
                                                        Provider.of<invoice_vm>(context, listen: false)
                                                            .setApproveFclient_vm({
                                                          "id_clients": widget.invoice!.fkIdClient,
                                                          //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                          'Date_FApprove': DateTime.now().toString(),
                                                          "fk_user": widget.invoice!.fkIdUser, //صاحب العميل
                                                          "fk_regoin": widget.invoice!.fk_regoin,
                                                          "regoin": widget.invoice!.name_regoin,
                                                          "fk_country": widget.invoice!.fk_country,
                                                          "isApproveFinance": "1",
                                                          "name_enterprise": widget.invoice!.name_enterprise,
                                                          "fkusername": widget.invoice!.nameUser, //موظف المبيعات
                                                          //"message":"",//
                                                          "nameuserApproved":
                                                              Provider.of<user_vm_provider>(context, listen: false)
                                                                  .currentUser
                                                                  .nameUser,
                                                          "iduser_FApprove":
                                                              Provider.of<user_vm_provider>(context, listen: false)
                                                                  .currentUser
                                                                  .idUser //معتمد الاشتراك
                                                        }, widget.invoice!.idInvoice).then(
                                                                (value) => value != false ? clear() : error() // clear()
                                                                // _scaffoldKey.currentState!.showSnackBar(
                                                                //     SnackBar(content: Text('هناك مشكلة ما')))
                                                                );
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context, rootNavigator: true)
                                                            .pop(false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        //Navigator.pop(context);
                                      },
                                      child: Text('Approve')),

                                ],
                              ),
                            )
                          : Container()
                      : Container(),
                ]),
              ),
            ),
          ));
        }
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
