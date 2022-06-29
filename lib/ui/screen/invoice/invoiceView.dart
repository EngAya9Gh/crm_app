import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
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
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as rt;
import 'dart:ui' as myui;
import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../labeltext.dart';

class InvoiceView extends StatefulWidget {
  InvoiceView({this.type, required this.invoice,
    //required this.clientmodel,
    Key? key})
      : super(key: key);
  //String idinvoice;
  //bool?  itemapprove;
  InvoiceModel? invoice;
  String? type;
  //&&  type=='approved'
  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {


  final TextEditingController resaonController = TextEditingController();
  final TextEditingController valueBackController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();
  late typeclient typeclient_provider;
  late ClientModel clientmodel;

  Widget _product(String name,String price ) {
   return    Column(
        children: [
          Row(

            children: [
              //Expanded flex 1
              Text(name,
                style: TextStyle(fontFamily: kfontfamily2),),
              Spacer(),
              Text( price,style: TextStyle(fontFamily: kfontfamily2),),
            ],
          ),
          Divider(thickness: 1,color: Colors.grey,),

        ],
      );
  }

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {

     await Provider.of<invoice_vm>(context,listen: false).getinvoices();
      clientmodel=Provider.of<client_vm>(context,listen: false)
          .listClient.firstWhere(
              (element) => element.idClients==widget.invoice!.fkIdClient);

     // await Provider.of<invoice_vm>(context, listen: false)
     //      .get_invoiceclientlocal(widget.invoice!.fkIdClient,'');

      typeclient_provider = Provider.of<typeclient>(context, listen: false);
      typeclient_provider.getreasons('client');

      typeclient_provider.selectedValueOut=widget.invoice!.reason_back==null?
      null:widget.invoice!.reason_back.toString();
      String val=widget.invoice!.stateclient.toString()=="منسحب"
          ? widget.invoice!.date_change_back.toString()
          : formatter.format(DateTime.now());
      _currentDate=DateTime.parse(val);
       Provider.of<datetime_vm>(context,listen: false)
           .setdatetimevalue(_currentDate,null);
    });
    super.initState();
  }
  @override void dispose() {
    resaonController.dispose();
    valueBackController.dispose();
    descresaonController.dispose();
    super.dispose();
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
    if (pickedDate != null )//&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;});
    Provider.of<datetime_vm>(context,listen: false).setdatetimevalue(_currentDate,null);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.invoice!.path.toString());
    print(widget.invoice!.imageRecord.toString());
    print(widget.invoice!.imagelogo.toString());
    // widget.invoice=Provider.of<invoice_vm>(context,listen: true)
    //     .listinvoiceClient
    //     .firstWhere((element) => element.idInvoice==widget.invoice!.idInvoice
    // ,orElse: null);
    //
    // if( widget.invoice==null)
         widget.invoice=Provider.of<invoice_vm>(context,listen: true)
        .listInvoicesAccept
        .firstWhere((element) => element.idInvoice==widget.invoice!.idInvoice
        ,orElse: null);

    final _globalKey = GlobalKey<FormState>();
    Widget dialog =
    SimpleDialog(
      elevation: 0,
      //backgroundColor: Colors.yellowAccent,
      // shape: StadiumBorder(
      //    side: BorderSide.none
      // ),
      titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
      insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
      contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      title: Center(child: Text('تحويل العميل إلى منسحب',style:TextStyle(fontFamily: kfontfamily2))),
      // titleTextStyle: TextStyle(fontFamily: kfontfamily2),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(

            builder: (BuildContext context, void Function(void Function()) setState) {
              return   Form(
                key: _globalKey,
                child: Column(
                  children: [
                    RowEdit(name: "اسباب الإنسحاب", des: 'required'),
                    Consumer<typeclient>(
                      builder: (context, cart, child){
                        return DropdownButton(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.type_of_out.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.nameReason), //label of item
                              value: level_one.idReason, //value of item
                            );
                          }).toList(),
                          value:cart.selectedValueOut,
                          onChanged:(value) {
                            //  setState(() {
                            print('vvvvvvvvvvvvvvvvvvvvvv');
                            print(value);
                            cart.changevalueOut(value.toString());

                            // });
                          },
                        );},
                    ),
                    SizedBox(height: 3,),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return label_empty;
                        }
                      },
                      hintText: "وصف سبب الإنسحاب",
                      //obscureText: false,
                      //  con: descresaonController, read: false,
                      //radius: 5,
                      paddcustom: EdgeInsets.all(8),
                      maxline: 5,
                      controller: descresaonController,
                    ),
                    SizedBox(height: 3,),
                    EditTextFormField(
                      //read: false,
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return label_empty;
                        }
                      },
                      hintText: 'المبلغ المسترجع',
                      //obscureText: false,
                      controller: valueBackController,
                      //radius: 5,
                    ),
                    SizedBox(height: 3,),
                    RowEdit(name: "تاريخ الإنسحاب", des: 'required'),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: kMainColor,
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16, fontWeight: FontWeight.w500),
                        hintText://_currentDate.toString(),
                        Provider.of<datetime_vm>(context,listen: true).valuedateTime.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: () {
                        setState((){
                          _selectDate(context,_currentDate);
                        });
                      },
                    ),
                    // RaisedButton(
                    //   onPressed: () => _selectDate(context,_currentDate),
                    //   child: Text('Select date'),
                    // ),
                    SizedBox(height: 6,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    kMainColor)),
                            onPressed: () async {
                              print('2121211111111111111111');
                              print(typeclient_provider.selectedValueOut);
                              // dismisses only the dialog and returns false
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();

                                await Provider.of<invoice_vm>(context, listen: false)
                                    .set_state_back({
                                  'fk_regoin':widget.invoice!.fk_regoin.toString(),
                                  'fkcountry':widget.invoice!.fk_country.toString(),
                                  "fkUserdo":
                                  Provider.of<user_vm_provider>(context, listen: false)
                                      .currentUser
                                      .idUser.toString(),
                                  "name_enterprise": clientmodel.nameEnterprise
                                      .toString(),
                                  "nameUserdo":
                                  Provider.of<user_vm_provider>(context, listen: false).currentUser
                                      .nameUser.toString(),
                                  "fk_client":widget.invoice!.fkIdClient.toString(),
                                  "reason_back": typeclient_provider.selectedValueOut,
                                  "fkuser_back": Provider
                                      .of<user_vm_provider>(context, listen: false).currentUser.idUser.toString(),
                                  "desc_reason_back": descresaonController.text,
                                  "date_change_back": _currentDate.toString(),//DateTime.now().toString(),
                                  "value_back": valueBackController.text,
                                }, widget.invoice!.idInvoice.toString());
                                Navigator.of(context, rootNavigator: true)
                                    .pop(false);
                              }},
                            child: Text('حفظ'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            },

          ),
        )

      ],
    );
    return Scaffold(
        appBar: widget.type=='approved'? null:AppBar(elevation: 1,),
        body:
        Padding(
          padding: EdgeInsets.only(top:15,left: 10,right: 10),
          child: Directionality(
            textDirection: myui.TextDirection.rtl,// TextDirection.rtl,
            child:
            //invoice!=null?
            Container(
              // height: MediaQuery.of(context).size.height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int index=0;index<widget.invoice!.products!.length;index++)
                    _product(widget.invoice!.products![index].nameProduct.toString(),
                        widget.invoice!.products![index].price.toString()),
                    Container(
                      color: Colors.amberAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('المبلغ الإجمالي   ',
                            style: TextStyle(fontFamily: kfontfamily3),),
                          //Spacer(),
                          Text(
                            widget.invoice!.total.toString(),
                            style: TextStyle(fontFamily: kfontfamily2),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    widget.invoice!.date_approve.toString()==null?
                    cardRow(
                        title: 'تاريخ عقد الإشتراك',
                        value: widget.invoice!.date_approve.toString()):Container(),

                    cardRow(
                        title: 'المبلغ المدفوع',
                        value: widget.invoice!.amountPaid.toString()),
                    cardRow(
                        title: ' المبلغ المتبقي',
                        value: (double.parse(widget.invoice!.total.toString()) -
                            double.parse(widget.invoice!.amountPaid.toString()))
                            .toStringAsFixed(2).toString()),
                    cardRow(
                        title: ' التجديد السنوي',
                        value: widget.invoice!.renewYear.toString()),
                    cardRow(
                        title: ' طريقة الدفع',
                        value: widget.invoice!.typePay.toString()=='0'?'نقدا':'تحويل'),
                    //nameuserApprove
                    widget.invoice!.nameuserApprove!=null? cardRow(
                        title: 'معتمد الفاتورة',
                        value: getnameshort(widget.invoice!.nameuserApprove.toString())):Container(),

                    widget.invoice!.nameuserApprove!=null?  cardRow(
                        title: 'تاريخ اعتماد الفاتورة',
                        value: widget.invoice!.date_approve.toString()):Container(),
                    cardRow(
                        title: 'تاريخ آخر تعديل',
                        value: widget.invoice!.date_lastuserupdate != null
                            ? widget.invoice!.date_lastuserupdate.toString()
                            : ''),
                    cardRow(
                        title: 'آخر تعديل من قبل',
                        value: widget.invoice!.date_lastuserupdate != null?
                        getnameshort(  widget.invoice!.lastuserupdateName.toString()):''),
                   widget.invoice!.date_change_back!=null?
                   cardRow(
                        title: 'تاريخ الإنسحاب',
                        value: widget.invoice!.date_change_back.toString() ):Container(),
                    widget.invoice!.date_change_back!=null?
                    cardRow(
                        title: 'تم الإنسحاب عن طريق',
                        value:
                        getnameshort(widget.invoice!.nameuserback.toString())):Container(),
                    widget.invoice!.fkuser_back!=null?
                    cardRow(
                        title: 'المبلغ المسترجع',
                        value: widget.invoice!.value_back.toString() ):Container(),
                    widget.invoice!.fkuser_back!=null?  cardRow(
                        title: 'سبب الإنسحاب',
                        value:
                         widget.invoice!.desc_reason_back.toString(),isExpanded: true,):Container(),
                    widget.invoice!.numbarnch.toString().trim().isNotEmpty?
                    cardRow(
                        title: 'عدد الفروع',
                        value:   widget.invoice!.numbarnch.toString()
                           ):Container(),
                    //widget.invoice!.nummostda != null||
                        widget.invoice!.nummostda.toString().trim().isNotEmpty?
                    cardRow(
                        title: 'عدد المستودعات ',
                        value: widget.invoice!.nummostda.toString()):Container(),
                    widget.invoice!.numusers.toString().trim().isNotEmpty?
                    cardRow(
                        title: 'عدد المستخدمين',
                        value:  widget.invoice!.numusers.toString()
                             ):Container(),
                    widget.invoice!.imagelogo != null&& widget.invoice!.imagelogo.toString().isNotEmpty?
                    widgetlogo(
                        title: 'شعار المؤسسة',
                        value: widget.invoice!.imagelogo.toString()
                    ):Container(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Provider.of<privilge_vm>(context,listen: true)
                              .checkprivlge('31')==true?
                          CustomButton(
                            text: 'تعديل الفاتورة',
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => addinvoice(
                                          invoice: widget.invoice,
                                          itemClient:  clientmodel)));
                            },
                          ):Container(),
                          Provider.of<privilge_vm>(context,listen: true)
                              .checkprivlge('41')==true ?
                          widget.invoice!.isApprove!=null ?
                          CustomButton(
                            //width: MediaQuery.of(context).size.width * 0.2,
                            text: 'خيارات إضافية',
                            onTap: () async {
                              showDialog<void>(
                                  context: context,
                                  builder: (context) => dialog);
                            },
                          ):Container():Container(),
                          Provider.of<privilge_vm>(context,listen: true)
                              .checkprivlge('32')==true?
                          CustomButton(
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
                                        new FlatButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop(
                                                false); // dismisses only the dialog and returns false
                                          },
                                          child: Text('لا'),
                                        ),
                                        FlatButton(
                                          onPressed: () async {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop(true);
                                            // dismisses only the dialog and returns true
                                            // if(itemProd.idInvoice!=null)
                                            DateTime _currentDate = DateTime.now();
                                            final rt.DateFormat formatter =
                                            rt.DateFormat('yyyy-MM-dd');
                                            Provider.of<invoice_vm>(context,
                                                listen: false)
                                                .addlistinvoicedeleted(
                                                DeletedinvoiceModel(
                                                  fkClient: widget.invoice!.fkIdClient.toString(),
                                                  fkUser: Provider.of<user_vm_provider>
                                                    (context, listen: false).currentUser
                                                      .idUser, //cuerrent user
                                                  dateDelete:
                                                  formatter.format(_currentDate),
                                                  //city:itemProd.
                                                  nameClient:
                                                  widget.invoice!.nameClient.toString(),
                                                  nameEnterprise:
                                                   clientmodel.nameEnterprise,
                                                  mobileclient:
                                                   clientmodel.mobile,
                                                  //mobileuser:widget.itemClient. ,
                                                  // nameUser: widget.itemProd
                                                  //     .nameUser, //موظف المبيعات
                                                  nameUser: Provider.of<user_vm_provider>
                                                    (context, listen: false).currentUser
                                                      .nameUser, //name user that doing delete
                                                ));
                                            Provider.of<invoice_vm>(context,
                                                listen: false)
                                                .delete_invoice({
                                              "id_invoice":
                                              widget.invoice!.idInvoice
                                                  .toString(),
                                              'fk_regoin':widget.invoice!.fk_regoin.toString(),
                                              'fkcountry':widget.invoice!.fk_country.toString(),
                                              "fkUserdo":
                                              Provider.of<user_vm_provider>
                                                (context, listen: false).currentUser
                                                  .idUser.toString(),
                                              "name_enterprise": clientmodel.nameEnterprise
                                                  .toString(),
                                              "nameUserdo":
                                              Provider.of<user_vm_provider>(context, listen: false).
                                              currentUser
                                                  .nameUser.toString(),
                                            }, widget.invoice!.idInvoice);
                                            Navigator.pop(context);


                                          },
                                          child: Text('نعم'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                              }):Container(),
                        ],
                      ),),

                    widget.type=='approved'?
                    widget.invoice!.isApprove==null?
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(kMainColor)),
                              onPressed: () async{

                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(''),
                                      content: Text('تأكيد العملية'),
                                      actions: <Widget>[
                                        new ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  kMainColor)),
                                          onPressed: () {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop(
                                                false); // dismisses only the dialog and returns false
                                          },
                                          child: Text('لا'),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  kMainColor)),
                                          onPressed: () async {
                                            // Navigator.of(context,
                                            //     rootNavigator: true)
                                            //     .pop(true);
                                            // update client to approved client
                                            Provider.of<invoice_vm>(context, listen: false)
                                                .setApproveclient_vm({
                                              "id_clients":widget.invoice!.fkIdClient,
                                              //'idApproveClient':widget.itemapprove!.idApproveClient,
                                              "fk_user":widget.invoice!.fkIdUser,//صاحب العميل
                                              "fk_regoin":widget.invoice!.fk_regoin,
                                              "regoin":widget.invoice!.name_regoin,
                                              "fk_country":widget.invoice!.fk_country,
                                              "isApprove": "1",
                                              "name_enterprise":widget.invoice!.name_enterprise,
                                              "fkusername":widget.invoice!.nameUser, //موظف المبيعات
                                              //"message":"",//
                                              "nameuserApproved":
                                              Provider.of<user_vm_provider>(context,listen: false)
                                                  .currentUser.nameUser,
                                              "iduser_approve":  Provider.of<user_vm_provider>(context,listen: false)
                                                  .currentUser.idUser//معتمد الاشتراك
                                            }, widget.invoice!.idInvoice).then((value) => value!=false?
                                            clear() : error()// clear()
                                              // _scaffoldKey.currentState!.showSnackBar(
                                              //     SnackBar(content: Text('هناك مشكلة ما')))
                                            );
                                            //Navigator.of(context,rootNavigator: true).pop();
                                            // Navigator.pop(context);
                                            // Navigator.pushAndRemoveUntil(context,
                                            //     MaterialPageRoute(builder: (context)=>Home()),
                                            //         (route) => true
                                            // );//this is active
                                            //  Navigator.pushReplacement(context,
                                            //      MaterialPageRoute(builder:
                                            //          (context)=>ApprovePage()));
                                          },
                                          child: Text('نعم'),
                                        ),
                                      ],
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
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.redAccent)),
                              onPressed: ()  async{
                                Provider.of<invoice_vm>(context, listen: false)
                                    .setApproveclient_vm({
                                  "id_clients":widget.invoice!.fkIdClient,
                                  //'idApproveClient':widget.itemapprove!.idApproveClient,
                                  "fk_user":widget.invoice!.fkIdUser,
                                  "fk_regoin":widget.invoice!.fk_regoin,
                                  "regoin":widget.invoice!.name_regoin,
                                  "fk_country":widget.invoice!.fk_country,
                                  "isApprove": "0",
                                  "name_enterprise":widget.invoice!.name_enterprise,
                                  "fkusername":widget.invoice!.nameUser, //موظف المبيعات
                                  //"message":"",//
                                  "nameuserApproved":Provider.of<user_vm_provider>(context,listen: false)
                                      .currentUser.nameUser,
                                  "iduser_approve": Provider.of<user_vm_provider>(context,listen: false)
                                      .currentUser.idUser//معتمد الاشتراك
                                }, widget.invoice!.idInvoice)
                                    .then((value) =>
                                value!=false?
                                clear()
                                    : error()// clear()
                                  // _scaffoldKey.currentState!.showSnackBar(
                                  //     SnackBar(content: Text('هناك مشكلة ما'))
                                  // )
                                );
                                // Navigator.pushAndRemoveUntil(context,
                                //     MaterialPageRoute(builder: (context)=>Home()),
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
                                //             //     MaterialPageRoute(builder:
                                //             //         (context)=>ApprovePage()));
                                //
                                //             Navigator.pushAndRemoveUntil(context,
                                //                 MaterialPageRoute(builder: (context)=>Home()),
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
                    ):Container():Container(),
                  ],
                ),
              ),
            ),
        ),),
    );
  }

  // clear() {
  //   // Provider.of<approve_vm>(context,listen: false)
  //   //     .removeApproveClient(widget.itemapprove!.idApproveClient);
  //   // setState(() {
  //   //   widget.itemapprove=null;
  //   // });
  // }


  clear() {

    Navigator.of(context,rootNavigator: true).pop();
    Navigator.pop(context);
  }

  error() {
    Navigator.of(context,rootNavigator: true).pop();    Navigator.pop(context);
  }

}