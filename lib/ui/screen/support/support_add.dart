import 'package:crm_smart/constants.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;

class support_add extends StatefulWidget {
  support_add({required this.idinvoice, Key? key}) : super(key: key);
  String? idinvoice;

  @override
  _support_addState createState() => _support_addState();
}

class _support_addState extends State<support_add> {
  TextEditingController _textsupport = TextEditingController();
  TextEditingController _textnameuserclient = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late InvoiceModel? _invoice = null;
  String? fk_client;
  bool valueresoan = false;
  @override
  void dispose() {
    _textsupport.dispose();
    _textnameuserclient.dispose();
    _timeController.dispose();
    super.dispose();
  }
 late TimeOfDay timinit;
  @override
  void initState() {
    timinit=TimeOfDay.now();
    // if (widget.idinvoice != '') {
    //   // _invoice = Provider
    //   //     .of<invoice_vm>(context, listen: false)
    //   //     .listinvoices
    //   //     .firstWhere(
    //   //         (element) =>
    //   //     element.idInvoice == widget.idinvoice);
    //   // _textsupport.text = _invoice!.reason_date.toString();
    // _timeController.text = DateTime.now().hour.toString()+':'
    // + DateTime.now().minute.toString();
        // formatDate(
        // DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        // [hh, ':', nn, " ", am]).toString();

      WidgetsBinding.instance!.addPostFrameCallback((_)async {

      //_ticketModel=_list.firstWhere((element) => element.fkClient)
        Provider.of<datetime_vm>(context,listen: false)
            .setdatetimevalue(DateTime(1, 1, 1),TimeOfDay(hour: -1, minute: 00));

      //  Provider.of<typeclient>(context,listen: false).getreasons('ticket');
      });


    print('init support');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //   _invoice = Provider
    //       .of<invoice_vm>(context, listen: false)
    //       .listinvoices
    //       .firstWhere(
    //           (element) =>
    //       element.idInvoice == widget.idinvoice);
    // });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _invoice = Provider.of<invoice_vm>(context, listen: true)
        .listinvoices
        .firstWhere((element) => element.idInvoice == widget.idinvoice);

    final _globalKey = GlobalKey<FormState>();

    Widget dialog =
    SimpleDialog(
        titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
        insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
        contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        title: Center(child: Text('إعادة جدولة',style:TextStyle(fontFamily: kfontfamily2))),
        children:[
          ModalProgressHUD(
            inAsyncCall:   Provider.of<invoice_vm>(context,listen: true)
                .isloading,
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                selectedTime == TimeOfDay(hour: -1, minute: 00);
              return
                 Directionality(
                 textDirection: myui.TextDirection.rtl,
                 child:   Form(
                   key: _globalKey,
                   child:Column(
                     children: [
                       Row(children: [
                         Flexible(
                           child: TextFormField(
                             decoration: InputDecoration(
                               prefixIcon: Icon(
                                 Icons.date_range,
                                 color: kMainColor,
                               ),
                               hintStyle:
                               const TextStyle(
                                   color: Colors.black45,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500),
                               hintText:
                               // _invoice!.daterepaly == null
                               //     &&
                               Provider.of<datetime_vm>(context,listen: true).valuedateTime
                                   == DateTime(1, 1, 1)
                                   ? 'تعيين التاريخ' //_currentDate.toString()
                                   :
                               //_currentDate.toString(),
                               DateFormat('yyyy-MM-dd').format(
                                   Provider.of<datetime_vm>(context,listen: true)
                                       .valuedateTime),

                               //_invoice!.daterepaly.toString(),
                               filled: true,
                               fillColor: Colors.grey.shade200,
                             ),
                             readOnly:  true,
                             onTap: () {
                               setState((){
                                 _selectDate(context,
                                     DateTime.now());
                                 print('before on tap '+_currentDate.toString());
                               });
                             },
                           ),
                         ),
                         SizedBox(width: 10,),
                         Flexible(
                           child: TextFormField(
                             validator: (value) {
                               if (selectedTime
                                   == TimeOfDay(hour: -1, minute: 00)) {
                                 return 'يرجى تعيين الوقت ';
                               }},
                             decoration: InputDecoration(
                               prefixIcon: Icon(
                                 Icons.date_range,
                                 color: kMainColor,
                               ),
                               hintStyle: const TextStyle(
                                   color: Colors.black45,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500),
                               hintText: _invoice!.daterepaly ==null
                                   &&     Provider.of<datetime_vm>(context,listen: true)
                .selectedTime == TimeOfDay(hour: -1, minute: 00)
                                   ?   'الوقت ' //_currentDate.toString()
                                   :
                  Provider.of<datetime_vm>(context,listen: true).
                  selectedTime.minute.toString()
                                   +' : '+ Provider.of<datetime_vm>(context,listen: true)
                  .selectedTime.hour.toInt().toString(),
                               //_invoice!.dateinstall_task.toString(),
                               filled: true,
                               fillColor: Colors.grey.shade200,

                             ),
                             // / controller: _timeController,
                             readOnly: true,
                             onTap: () {
                                setState((){
                               _selectTime(context,timinit);
                                });
                             },
                           ),
                         ),
                       ],),

                       SizedBox(height: 5,),
                       EditTextFormField(
                         maxline: 4,
                         paddcustom: EdgeInsets.all(10),
                         hintText:
                         'أسباب إعادة الجدولة',
                         obscureText: false,
                         controller: _textsupport,
                         vaild: (value) {
                           if (value.toString().trim().isEmpty) {
                             return 'الحقل فارغ';
                           }
                         },
                       ),
                       SizedBox(height: 10,),
                       CustomButton(
                         text: "تثبيت",
                         onTap:() async {
                   DateTime datetask = DateTime(
                   _currentDate.year, _currentDate.month,
                   _currentDate.day,
                   selectedTime.hour, selectedTime.minute);
                   if (_globalKey.currentState!
                               .validate()) {
                     Navigator.of(context, rootNavigator: true)
                         .pop(false);
                             _globalKey.currentState!.save();
                             Provider.of<invoice_vm>(context, listen: false)
                                 .setdate_vm({
                               // 'fk_invoice':,
                               // 'fk_idClient':,
                               // 'fk_idUser':,
                               // 'type_date':,
                               // 'date_install':,
                               'fk_client':_invoice!.fkIdClient.toString(),
                               'fk_regoin':_invoice!.fk_regoin.toString(),
                               'fkcountry':_invoice!.fk_country.toString(),
                               "namedatareplay":
                               Provider.of<user_vm_provider>(context, listen: false)
                                   .currentUser
                                   .nameUser.toString(),
                               "name_enterprise": _invoice!.name_enterprise.toString()
                                   .toString(),
                               'daterepaly': datetask.toString(),
                               'fkuserdatareplay':Provider.of<user_vm_provider>
                                 (context,listen: false)
                                   .currentUser.idUser,
                               'reason_date': _textsupport.text.toString()
                             }, _invoice!.idInvoice).then((value) => clear());
                           }

                         },
                       ),

                     ],
                   ),
                 ),
               );
              },),
          ),

        ]);
    print('builld');
    return SafeArea(
      child: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            buildcardExpansion('فاتورة  '+_invoice!.dateCreate.toString(),'',
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5),
                  child: Column(
              children: [
                  _invoice!.dateinstall_done == null&&_invoice!.dateinstall_task==null
                ?RowEdit(name: 'تحديد موعد التركيب والتدريب ', des: ''):Container(),
                  SizedBox(
                    height: 10,
                  ),
                  _invoice!.dateinstall_done == null &&
                      _invoice!.dateinstall_task==null
                      ? //تم التركيب
                  Form(
                    key: _globalKey,
                    child: Row(
                      children: [
                        //  SizedBox(width: 3,),
                        Flexible(
                          child: TextFormField(
                            validator:  (value) {
                  if (_currentDate == DateTime(1, 1, 1)) {
                       return 'يرجى تعيين التاريخ ';
                  }},
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: kMainColor,
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              hintText: _invoice!.dateinstall_task ==null
                                  &&  _currentDate == DateTime(1, 1, 1)
                                  ? 'التاريخ' //_currentDate.toString()
                                  :DateFormat('yyyy-MM-dd').format(_currentDate),
                              //_invoice!.dateinstall_task.toString(),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, DateTime.now());
                            },
                          ),
                        ),
                        SizedBox(width: 10,),
                        Flexible(
                          child: TextFormField(
                            validator: (value) {
                                      if (selectedTime == TimeOfDay(hour: -1, minute: 00))
                                      {
                                        return 'يرجى تعيين الوقت ';
                                      }},
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: kMainColor,
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              hintText: _invoice!.dateinstall_task ==null
                                  &&  selectedTime == TimeOfDay(hour: -1, minute: 00)
                                  ?   'الوقت ' //_currentDate.toString()
                                  :
                              selectedTime.minute.toString()
                                  +' : '+ selectedTime.hour.toInt().toString(),
                              //_invoice!.dateinstall_task.toString(),
                              filled: true,
                              fillColor: Colors.grey.shade200,

                            ),
                           // / controller: _timeController,
                            readOnly: true,
                            onTap: () {
                               _selectTime(context,timinit);
                            },
                          ),
                        ),

                        _invoice!.dateinstall_task == null//first time for set date for client
                            ? IconButton(
                            onPressed: () {

                              // if( selectedTime != TimeOfDay(hour: -10, minute: 00)
                              //     && _currentDate!= DateTime(1, 1, 1)) {
                                if(_globalKey.currentState!.validate()){
                                  _globalKey.currentState!.save();
                              DateTime datetask = DateTime(
                                    _currentDate.year, _currentDate.month,
                                    _currentDate.day,
                                    selectedTime.hour, selectedTime.minute);

                                Provider.of<invoice_vm>(context,
                                    listen: false)
                                    .setdate_vm({
                                  'dateinstall_task': datetask.toString(),
                                  //_invoice.dateinstall_task.toString()
                                  'fkusertask':Provider.of<user_vm_provider>(context,listen: false)
                                      .currentUser.idUser,
                                  // 'nameusertask':Provider.of<user_vm_provider>(context,listen: false)
                                  //     .currentUser!.nameUser,
                                }, _invoice!.idInvoice).then(
                                        (value) => clear()  );
                                // _invoice!.dateinstall_task =
                                //     _currentDate.toString();
                                 _currentDate = DateTime(1, 1, 1);
                                  selectedTime = TimeOfDay(hour: -1, minute: 00);
                              } else {

                                }},
                            icon: Icon(Icons.check,
                                size: 50, color: kMainColor))
                            : Container(),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ) :  Container(),

                Provider.of<privilge_vm>(context,listen: true)
                    .checkprivlge('42')==true ?
                  _invoice!.dateinstall_task != null &&
                      _invoice!.dateinstall_done == null
                      ? ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(kMainColor)),
                    onPressed: () async {
                      await showDialog<void>(
                          context: context,
                          builder: (context) => dialog
                      );
                      // setState(() {
                      //   valueresoan=true;
                      //
                      // });
                    },
                    child: Text('إعادة تعيين تاريخ التركيب'),
                  )
                      : Container():Container(),

                  SizedBox(
                    height: 20,
                  ),
                _invoice!.dateinstall_done == null
                      ? Container()
                      : cardRow(
                      title: ' تاريخ التركيب ',
                      value: DateFormat('yyyy-MM-dd HH:mm').format(
                          DateTime.parse( _invoice!.dateinstall_done.toString()))
                  ),

                  _invoice!.dateinstall_done == null
                      ? Container()
                      : cardRow(
                      title: ' تم التركيب من قبل ',
                      value: getnameshort(
                          _invoice!.nameuserinstall.toString())),
//////////////////////////////////////////////////////////////////////////////////////////
                  _invoice!.daterepaly != null
                      ? cardRow(
                      title: ' تاريخ إعادة الجدولة',
                      value:DateFormat('yyyy-MM-dd HH:mm').format(
                          DateTime.parse( _invoice!.daterepaly.toString())))
                      : Container(),
                  _invoice!.daterepaly != null
                      ? cardRow(
                      title: ' قام بإعادة الجدولة',
                      value: _invoice!.nameuserreplay.toString())
                      : Container(),
                  _invoice!.daterepaly != null
                      ? cardRow(
                      title: ' سبب إعادة الجدولة',
                      value: _invoice!.reason_date.toString(),isExpanded: true,)
                      : Container(),
                  ///////////////////////////////////////////////
                  _invoice!.dateinstall_task != null
                      ? cardRow(
                      title: ' تاريخ جدولة التركيب ',
                      value: DateFormat('yyyy-MM-dd HH:mm').format(
                          DateTime.parse(
                              _invoice!.dateinstall_task.toString()))
                      // DateFormat.yMMMd().
                      // format(DateTime.parse(_invoice!.dateinstall_task.toString()))
                      )
                      : Container(),
                  _invoice!.dateinstall_task != null
                      ? cardRow(
                      title: ' قام بجدولة التركيب ',
                      value: _invoice!.nameusertask.toString())
                      : Container(),
                  cardRow(
                      title: 'طريقة التركيب ',
                      value: _invoice!.typeInstallation.toString() == '0'
                          ? 'ميداني'
                          : 'اونلاين'),
                  cardRow(
                      title: 'هل تم التركيب للعميل ',
                      value: _invoice!.dateinstall_done == null
                          ? 'بالانتظار'
                          : 'تم التركيب'),
                Provider.of<privilge_vm>(context,listen: true)
                    .checkprivlge('43')==true ?
                  _invoice!.dateinstall_done == null
                      ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(kMainColor)),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return ModalProgressHUD(
                                inAsyncCall: Provider.of<invoice_vm>(context,listen: true)
                                .isloadingdone,
                                child: Directionality(
                                  textDirection: myui. TextDirection.rtl,
                                  child: AlertDialog(
                                  title: Text('التأكيد'),
                                  content: Text('هل تريد تأكيد عملية التركيب'),
                                  actions: <Widget>[
                                    Column(
                                      children: [
                                        EditTextFormField(
                                          maxline: 4,
                                          paddcustom: EdgeInsets.all(10),
                                          hintText:
                                          ' يوزر العميل',
                                          obscureText: false,
                                          controller: _textnameuserclient,
                                          vaild: (value) {
                                            if (value.toString().trim().isEmpty) {
                                              return 'الحقل فارغ';
                                            }
                                          },
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all(
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
                                                backgroundColor:
                                                MaterialStateProperty.all(
                                                    kMainColor)),
                                            onPressed: () async {
                                              await Provider.of<config_vm>(context, listen: false).getAllConfig();
                                              List<ConfigModel> _listconfg =
                                                  Provider.of<config_vm>(context, listen: false)
                                                      .listofconfig;

                                              ConfigModel   peroid =
                                              _listconfg.firstWhere((element) =>
                                              element.name_config == 'period_commincation3');//تواصل دوري
                                              DateTime datanext=DateTime.now();
                                              int peroidtime= int.parse(peroid.value_config);
                                              datanext=Jiffy().add(days: peroidtime).dateTime;
                                              print(datanext.toString());
                                             await Provider.of<invoice_vm>(context,
                                                  listen: false)
                                                  .setdatedone_vm({
                                               'clientusername':_textnameuserclient.text,
                                               'datanext':datanext.toString(),
                                                'dateinstall_done':
                                                DateTime.now().toString(),
                                                'userinstall':
                                                Provider.of<user_vm_provider>(
                                                    context,
                                                    listen: false).currentUser.idUser.toString(),
                                                'isdoneinstall': '1',
                                                'fkIdClient': _invoice!.fkIdClient,
                                                'nameuserinstall':
                                                Provider.of<user_vm_provider>(
                                                    context,
                                                    listen: false).currentUser.nameUser.toString(),
                                                'name_enterprise':
                                                _invoice!.name_enterprise,
                                                'fkcountry': _invoice!.fk_country,
                                                'fk_regoin': _invoice!.fk_regoin
                                              }, _invoice!.idInvoice).then(
                                                      (value) => clear());
                                              Navigator.of(context,
                                                  rootNavigator: true)
                                                  .pop(true);
                                            },
                                            child: Text('نعم'),
                                          ),
                                        ],)
                                      ],
                                    ),

                                  ],
                              ),
                                ),
                            );
                          },
                        );
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> second()));
                      },
                      child: Text('تم التركيب للعميل'))
                      : Container():Container(),
              ],
            ),
                )),
          ),
        ),
      ),
    );
  }

  late DateTime _currentDate = DateTime(1, 1, 1);
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);
  late double _height;
  late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;
  Future<Null> _selectTime(BuildContext context,TimeOfDay stime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: stime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text =selectedTime.toString();
        print('ssdsds');
        print(TimeOfDay.now());
        print(selectedTime.toString());
            // Utils.toTime(selectedTime)
            // formatDate(
            // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            // [hh, ':', nn, " ", am]).toString();
      });
    Provider.of<datetime_vm>(context,listen: false)
        .setdatetimevalue(_currentDate,selectedTime);

  }   
  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    //String output = formatter.format(currentDate);
    // DateFormat('yyyy-MM-dd – kk:mm').format(now);
     DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        // _invoice.dateinstall_task=pickedDate.toString() ;
        _currentDate = pickedDate;
        print(_currentDate.toString());
        
        final time = Duration(hours: DateTime.now().hour,
            minutes: DateTime.now().minute,seconds: DateTime.now().second);
       print('timme');
       print(DateFormat.Hms().format(_currentDate));
       _currentDate.add(Duration(hours: DateTime.now().hour));
        print(time.toString());
        print(_currentDate.toString());
       // _currentDate.add(Duration(hours: selectedTime.hour));

        // _invoice!.dateinstall_task = _currentDate.toString();
        //_invoice!.daterepaly = _currentDate.toString();
        //_currentDate.hour=DateTime.now().hour;
      });
    Provider.of<datetime_vm>(context,listen: false).setdatetimevalue(
        _currentDate,selectedTime);
  }

  clear() {

    _currentDate = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context,listen: false).setdatetimevalue(
        DateTime(1, 1, 1),TimeOfDay(hour: -1, minute: 00)
    );
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('تم التثبيت بنجاح')));
  }
  clear2() {
    Navigator.of(context, rootNavigator: true)
        .pop(false);
    _currentDate = DateTime(1, 1, 1);
    selectedTime = TimeOfDay(hour: -1, minute: 00);
    Provider.of<datetime_vm>(context,listen: false).setdatetimevalue(
        DateTime(1, 1, 1),TimeOfDay(hour: -1, minute: 00)
    );
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('تم التثبيت بنجاح')));
  }

  error() {
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('يوجد مشكلة ما  ')));
  }
}
