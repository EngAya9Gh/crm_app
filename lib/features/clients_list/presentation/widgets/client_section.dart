import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';


import '../../../../constants.dart';
import '../../../../model/clientmodel.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../task_management/presentation/manager/task_cubit.dart';
import '../../../task_management/presentation/widgets/add_manual_task_button.dart';
import '../pages/action_client_page.dart';
import '../../../../function_global.dart';

class ClientSection extends StatefulWidget {
  ClientSection({this.clienttransfer, required this.invoice, this.typeinvoice, required this.idclient, this.client, Key? key}) : super(key: key);
  String idclient;
  InvoiceModel? invoice;
  String? clienttransfer;
  String? typeinvoice;
  ClientModel1? client;

  //bool? itemapprove;
  @override
  _ClientSectionState createState() => _ClientSectionState();
}

class _ClientSectionState extends State<ClientSection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ClientModel1 clientModel;
  bool isUpdate = false;

  // late ClientModel clientModel = ClientModel();

  @override
  Widget build(BuildContext context) {
    // clientModel = widget.client ??
    //     Provider.of<client_vm>(context, listen: true)
    //         .listClient
    //         .firstWhere((element) => element.idClients == widget.idclient);

    return Consumer<ClientProvider>(builder: (context, state, _) {
      if (state.currentClientModel.isLoading || state.currentClientModel.isInit) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state.currentClientModel.isFailure) {
        return Scaffold(
          body: Center(
            child: IconButton(
              onPressed: () => context.read<ClientProvider>().get_byIdClient(widget.idclient.toString()),
              icon: Icon(Icons.refresh),
            ),
          ),
        );
      }
      if(!isUpdate) {
        clientModel = state.currentClientModel.data!;
      }
      print("Client name: ${clientModel.nameClient}");
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            // height: MediaQuery.of(context).size.height*0.73,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 10),
              child: SingleChildScrollView(
                child: Column(children: [
                  AddManualTaskButton(
                    list: clientPublicTypeList,
                    clientId: clientModel.idClients,
                  ),
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
                            decoration: BoxDecoration(color: kMainColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: IconButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(clientModel.mobile.toString());
                              },
                              icon: Icon(Icons.call),
                              iconSize: 15,
                              color: kWhiteColor,
                            ),
                          ),
                          (context.read<PrivilegeCubit>().checkPrivilege('133') == true)
                              ? IconButton(
                                  onPressed: () {
                                    if ((context.read<PrivilegeCubit>().checkPrivilege('147') ==
                                        true)) context.read<ClientProvider>().setTagClient();
                                  },
                                  icon: Icon(
                                    (clientModel.tag ?? false) ? CupertinoIcons.checkmark_seal_fill : CupertinoIcons.checkmark_seal,
                                    color: (clientModel.tag ?? false) ? Colors.amber : null,
                                  ),
                                  tooltip: (clientModel.tag ?? false) ? "مميز" : "غير مميز",
                                )
                              : IgnorePointer(),
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
                  GestureDetector(
                      onLongPress: () async {
                        await Clipboard.setData(ClipboardData(text: clientModel.serialNumber.toString()))
                            .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                  "تم النسخ إلى الحافظة",
                                  textDirection: TextDirection.rtl,
                                ))));
                      },
                      child: cardRow(title: 'الرقم المرجعي', value: clientModel.serialNumber.toString())),
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
                  clientModel.size_activity != null
                      ? cardRow(title: 'حجم النشاط', value: clientModel.size_activity.toString())
                      : IgnorePointer(),
                  clientModel.email != null
                      ? cardRow(title: 'البريد الالكتروني', value: clientModel.email.toString())
                      : IgnorePointer(),

                  cardRow(title: ' مدينة العميل', value: clientModel.name_city.toString()),
                  cardRow(title: ' المنطقة', value: clientModel.namemaincity.toString()),

                  clientModel.phone == '' || clientModel.phone == null
                      ? IgnorePointer()
                      : cardRow(title: ' رقم آخر', value: clientModel.phone.toString()),

                  cardRow(title: 'حالة العميل', value: clientModel.typeClient.toString()),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: clientModel.nameuserdoning.toString(), title: 'قام بتحويل حالة العميل')
                      : IgnorePointer(),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: clientModel.dateChangetype.toString(), title: 'تاريخ تحويل حالة العميل')
                      : IgnorePointer(),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: clientModel.reasonChange.toString(), title: 'تفاصيل الاستبعاد')
                      : IgnorePointer(),
                  clientModel.typeClient == 'مستبعد'
                      ? cardRow(value: clientModel.NameReason_reject.toString(), title: 'سبب الاستبعاد')
                      : IgnorePointer(),
                  clientModel.offer_price != null && clientModel.offer_price.toString().trim().isNotEmpty
                      ? cardRow(title: 'مبلغ عرض السعر', value: clientModel.offer_price.toString())
                      : IgnorePointer(),

                  clientModel.offer_price != null && clientModel.offer_price.toString().trim().isNotEmpty
                      ? cardRow(title: 'تاريخ عرض السعر', value: clientModel.date_price.toString())
                      : IgnorePointer(),

                  clientModel.offer_price != null && clientModel.offer_price.toString().trim().isNotEmpty
                      ? cardRow(
                          title: 'الموظف الذي قام بتغيير حالة العميل', value: clientModel.nameuserdoning.toString())
                      : IgnorePointer(),

                  cardRow(title: 'الموظف الذي أضاف العميل', value: getnameshort(clientModel.nameAdduser.toString())),
                  cardRow(title: 'الموظف', value: getnameshort(clientModel.nameUser.toString())),

                  cardRow(title: 'رقم الموظف', value: clientModel.mobileuser.toString()),

                  if (clientModel.reasonTransfer != null)
                    context.read<PrivilegeCubit>().checkPrivilege('150') == true && clientModel.fkusertrasfer != null
                        ? cardRow(
                            title: 'قام بتحويل العميل', value: getnameshort(clientModel.nameusertransfer.toString()))
                        : IgnorePointer()
                  else
                    clientModel.fkusertrasfer != null
                        ? cardRow(
                            title: 'قام بتحويل العميل', value: getnameshort(clientModel.nameusertransfer.toString()))
                        : IgnorePointer(),

                  context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
                          (clientModel.reasonTransfer != null) &&
                          clientModel.fkusertrasfer != null
                      ? cardRow(title: 'تحويل العميل إلى', value: clientModel.nameTransferTo.toString())
                      : IgnorePointer(),

                  context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
                          (clientModel.reasonTransfer == null) &&
                          clientModel.fkusertrasfer != null
                      ? cardRow(title: 'حالة التحويل', value: 'تم قبول التحويل')
                      : IgnorePointer(),

                  context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
                          (clientModel.reasonTransfer != null) &&
                          clientModel.fkusertrasfer != null
                      ? cardRow(title: 'حالة التحويل', value: 'معلق')
                      : IgnorePointer(),

                  // (clientModel.reasonTransfer == null) &&
                  clientModel.fkusertrasfer != null
                      ? cardRow(title: 'تاريخ التحويل', value: clientModel.dateTransfer.toString())
                      : IgnorePointer(),

                  clientModel.location.toString() == ''
                      ? IgnorePointer()
                      : cardRow(title: ' الموقع', value: clientModel.location.toString()),

                  clientModel.ismarketing == '1'
                      ? cardRow(title: ' عميل تسويق الكتروني', value: clientModel.ismarketing == '1' ? 'نعم' : '')
                      : IgnorePointer(),
                  clientModel.type_record != null && clientModel.type_record.toString().trim().isNotEmpty && clientModel.type_record!=""
                      ? cardRow(title: 'نوع التسجيل', value: clientModel.type_record.toString())
                      : IgnorePointer(),

                  clientModel.type_classification != null && clientModel.type_classification.toString().trim().isNotEmpty && clientModel.type_classification!="null"
                      ? cardRow(title: 'نوع التصنيف', value: clientModel.type_classification.toString())
                      : IgnorePointer(),
                  clientModel.reason_class != null && clientModel.reason_class.toString().trim().isNotEmpty && clientModel.reason_class!="null"
                      ? cardRow(title: 'سبب الإدخال', value: clientModel.reason_class.toString())
                      : IgnorePointer(),
                  cardRow(
                      title: 'عنوان العميل',
                      value: clientModel.address_client == null ? '' : clientModel.address_client.toString()),

                  clientModel.presystem == null || clientModel.presystem.toString().trim().isEmpty
                      ? IgnorePointer()
                      : cardRow(
                          title: 'نظام سابق',
                          value: clientModel.presystemtitle == null ? '' : clientModel.presystemtitle.toString()),

                  cardRow(
                      title: 'مصدر العميل',
                      value: clientModel.sourcclient == null ? '' : clientModel.sourcclient.toString()),
                  if (clientModel.sourcclient == 'عميل موصى به')
                    cardRow(
                        title: 'تمت التوصية من:',
                        value:
                            clientModel.NameClient_recomand == null ? '' : clientModel.NameClient_recomand.toString()),

                  clientModel.activity_type_fk == null
                      ? cardRow(title: 'نوع النشاط', value: clientModel.activity_type_title.toString())
                      : IgnorePointer(),

                  clientModel.activity_type_fk == null
                      ? cardRow(title: 'وصف النشاط', value: clientModel.descActivController.toString())
                      : IgnorePointer(),

                  widget.clienttransfer == 'transfer'
                      ? IgnorePointer()
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                  onPressed: () async => _onPressedUpdate(context),
                                  child: Text('تعديل بيانات العميل'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              clientModel.typeClient == "عرض سعر" || clientModel.typeClient == "تفاوض"
                                  ? SizedBox(
                                      width: 5,
                                    )
                                  : IgnorePointer(),
                              clientModel.reasonTransfer == null
                                  ? Expanded(
                                      child: ElevatedButton(
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
                                      ),
                                    )
                                  : IgnorePointer(),
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

                  widget.clienttransfer == null || context.read<PrivilegeCubit>().checkPrivilege('150') == true
                      ? IgnorePointer()
                      :
                  // Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('150') == true &&

                      clientModel.reasonTransfer ==
                              Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString()
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return ModalProgressHUD(
                                                inAsyncCall: Provider.of<ClientProvider>(context).isapproved,
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
                                                          String? reason_transfer = null;
                                                          //update fkuser to new user
                                                          Provider.of<ClientProvider>(context, listen: false)
                                                              .setfkUserApprove({
                                                            'approve': '1',
                                                            'reason_transfer': reason_transfer.toString(),
                                                            'fkuser': Provider.of<UserProvider>(context, listen: false)
                                                                .currentUser
                                                                .idUser
                                                                .toString(),
                                                            //user reciept
                                                            // 'nameusertransfer':
                                                            // Provider.of<user_vm_provider>(context,listen: false)
                                                            //     .currentUser.nameUser.toString(),//الموظف الذي حول العميل
                                                            'name_enterprise': clientModel.nameEnterprise,
                                                            'fk_regoin':
                                                                Provider.of<UserProvider>(context, listen: false)
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
                                                        style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                        onPressed: () {
                                                          Navigator.of(context, rootNavigator: true).pop(
                                                              false); // dismisses only the dialog and returns false
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
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                        style:
                                            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
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
                                                inAsyncCall: Provider.of<ClientProvider>(context).isapproved,
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
                                                          Provider.of<ClientProvider>(context, listen: false)
                                                              .setfkUserApprove({
                                                            'userrefuse':
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .nameUser,
                                                            'fkuserclient': clientModel.fkUser.toString(), //صاحب العميل
                                                            'reason_transfer': reason_transfer.toString(),
                                                            'fkusertrasfer': reason_transfer.toString(),
                                                            'date_transfer': reason_transfer.toString(),
                                                            'name_enterprise': clientModel.nameEnterprise,
                                                          }, widget.idclient).then((value) =>
                                                                      value != false ? clear() : error() // clear()
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
                                                          Navigator.of(context, rootNavigator: true).pop(
                                                              false); // dismisses only the dialog and returns false
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
                                  ),
                                ],
                              ),
                            )
                          : IgnorePointer(),
                  widget.invoice != null
                      ? widget.invoice!.isApprove == null
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
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
                                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                        onPressed: () async {
                                                          // Navigator.of(context,
                                                          //     rootNavigator: true)
                                                          //     .pop(true);
                                                          // update client to approved client
                                                          Provider.of<invoice_vm>(context, listen: false).setApproveclient_vm({
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
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .nameUser,
                                                            "iduser_approve":
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .idUser //معتمد الاشتراك
                                                          }, widget.invoice!.idInvoice).then((value) =>
                                                                      value != false ? clear() : error() // clear()
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
                                                          Navigator.of(context, rootNavigator: true).pop(
                                                              false); // dismisses only the dialog and returns false
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
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: ElevatedButton(
                                        style:
                                            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
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
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .nameUser,
                                                            "iduser_approve":
                                                                Provider.of<UserProvider>(context, listen: false)
                                                                    .currentUser
                                                                    .idUser //معتمد الاشتراك
                                                          }, widget.invoice!.idInvoice).then((value) =>
                                                                      value != false ? clear() : error() // clear()
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
                                                          Navigator.of(context, rootNavigator: true).pop(
                                                              false); // dismisses only the dialog and returns false
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
                                  ),
                                ],
                              ),
                            )
                          : IgnorePointer()
                      : IgnorePointer(), //:IgnorePointer(),

                  //approve finance
                  widget.invoice != null
                      ? widget.invoice!.isApprove != 1 &&
                              widget.invoice!.isApproveFinance == null &&
                              Provider.of<PrivilegeCubit>(context, listen: true).checkPrivilege('111') == true &&
                              widget.typeinvoice == 'f'
                          ? Center(
                              child: ElevatedButton(
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
                                                          Provider.of<UserProvider>(context, listen: false)
                                                              .currentUser
                                                              .nameUser,
                                                      "iduser_FApprove":
                                                          Provider.of<UserProvider>(context, listen: false)
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
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                  onPressed: () {
                                                    Navigator.of(context, rootNavigator: true).pop(false); // dismisses only the dialog and returns false
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
                                  child: Text('Approve')))
                          : IgnorePointer()
                      : IgnorePointer(),
                ]),
              ),
            ),
          ),
      );
    });
  }

  _onPressedUpdate(BuildContext context) async {
    isUpdate = true;
    print(clientModel.serialNumber);
    ClientModel result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ActionClientPage(client: clientModel.mapToClientModel()),
      ),
    );


    setState(() {
      clientModel = result.mapToClientModel1();
    });
    print(result.serialNumber);
    print(clientModel.serialNumber);
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

//region Extension

extension ClientModelExtension on ClientModel1 {
  ClientModel mapToClientModel() {
    return ClientModel(
      idClients: idClients,
      nameClient: nameClient,
      nameEnterprise: nameEnterprise,
      typeJob: typeJob,
      city: city,
      location: location,
      // fkRegoin: fkRegoin,
      fkCountry: fkcountry,
      dateCreate: dateCreate,
      typeClient: typeClient,
      fkUser: fkUser,
      dateTransfer: dateTransfer,
      mobile: mobile,
      dateChangeType: dateChangetype,
      reasonChange: reasonChange,
      reasonTransfer: reasonTransfer,
      nameCountry: nameCountry,
      nameUser: nameUser,
      nameRegion: name_regoin,
      total: total,
      amountPaid: amount_paid,
      offerPrice: offer_price,
      datePrice: date_price,
      userDo: user_do,
      isApprove: isApprove,
      nameUserDoing: nameuserdoning,
      nameUserTransfer: nameusertransfer,
      fkUserTrasfer: fkusertrasfer,
      mobileUser: mobileuser,
      totalPaid: total_paid,
      isMarketing: ismarketing,
      addressClient: address_client,
      descriptionActiveController: descActivController,
      preSystem: presystem,
      preSystemTitle: presystemtitle,
      sourceClient: sourcclient,
      activityTypeFk: activity_type_fk,
      activityTypeTitle: activity_type_title,
      phone: phone,
      userAdd: user_add,
      nameAdduser: nameAdduser,
      dateVisitClient: date_visit_Client,
      tag: tag,
      // doneVisit: doneVisit,
      // doneTransfer: doneTransfer,
      nameCity: name_city,
      nameMainCity: namemaincity,
      idMainCity: id_maincity,
      // customerId: customerId,
      // userAddEmail: userAddEmail,
      // dateReceive: dateReceive,
      email: email,
      sizeActivity: size_activity,
      serialNumber: serialNumber,
      // fkClientSource: fkClientSource,
      // nameReasonReject: nameReasonReject,
      // nameClientRecommend: nameClientRecommend,
      // rejectId: rejectId,
    );
  }
}

extension ClientModel1Extension on ClientModel {
  ClientModel1 mapToClientModel1() {
    return ClientModel1(
      idClients: idClients,
      nameClient: nameClient,
      nameEnterprise: nameEnterprise,
      typeJob: typeJob,
      city: city,
      location: location,
      fkRegoin: fkRegion,
      // Note: Assuming you meant to use fkRegion
      fkcountry: fkCountry,
      dateCreate: dateCreate,
      typeClient: typeClient,
      fkUser: fkUser,
      dateTransfer: dateTransfer,
      mobile: mobile,
      dateChangetype: dateChangeType,
      reasonChange: reasonChange,
      reasonTransfer: reasonTransfer,
      nameCountry: nameCountry,
      nameUser: nameUser,
      name_regoin: nameRegion,
      // Note: Assuming you meant to use nameRegion
      total: total,
      amount_paid: amountPaid,
      offer_price: offerPrice,
      date_price: datePrice,
      user_do: userDo,
      isApprove: isApprove,
      nameuserdoning: nameUserDoing,
      nameusertransfer: nameUserTransfer,
      fkusertrasfer: fkUserTrasfer,
      mobileuser: mobileUser,
      total_paid: totalPaid,
      ismarketing: isMarketing,
      address_client: addressClient,
      descActivController: descriptionActiveController,
      presystem: preSystem,
      presystemtitle: preSystemTitle,
      sourcclient: sourceClient,
      activity_type_fk: activityTypeFk,
      activity_type_title: activityTypeTitle,
      phone: phone,
      user_add: userAdd,
      nameAdduser: nameAdduser,
      date_visit_Client: dateVisitClient,
      tag: tag,
      // doneVisit: doneVisit,
      // doneTransfer: doneTransfer,
      name_city: nameCity,
      namemaincity: nameMainCity,
      id_maincity: idMainCity,
      // customerId: IDcustomer, // Note: Assuming you meant to use IDcustomer
      // userAddEmail: userAddEmail,
      // dateReceive: dateReceive,
      email: email,
      size_activity: sizeActivity,
      serialNumber: serialNumber,
      // fkClientSource: fkClientSource,
      // nameReasonReject: NameReason_reject,
      // nameClientRecommend: NameClient_recomand,
      // rejectId: fk_rejectClient, // Note: Assuming you meant to use fk_rejectClient
    );
  }
}

//endregion
