// import 'package:crm_smart/model/calendar/event_data_source.dart';
// import 'package:crm_smart/model/clientmodel.dart';
// import 'package:crm_smart/ui/widgets/widgetcalendar/task_widget.dart';
// import 'package:crm_smart/view_model/client_vm.dart';
// import 'package:crm_smart/view_model/event_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:provider/provider.dart';
// // import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:crm_smart/model/calendar/event.dart';
// import 'dart:ui' as myui;
//
// import '../../../constants.dart';
// import '../../../view_model/datetime_vm.dart';
// import '../../../view_model/user_vm_provider.dart';
// import '../custom_widget/row_edit.dart';
//
// class CalendarWidget extends StatefulWidget {
//    CalendarWidget({required this.type,this.clientModel, Key? key}) : super(key: key);
//    String type;
//    ClientModel? clientModel;
//   @override
//   _CalendarWidgetState createState() => _CalendarWidgetState();
// }
//
// class _CalendarWidgetState extends State<CalendarWidget> {
//   @override void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//
//     });
//     }
//   @override void didChangeDependencies() {
//     // Future.delayed(Duration(milliseconds: 30)).then((_) async {
//     // });
//     super.didChangeDependencies();
//   }
//
//   DateTime _currentDate = DateTime.now();
//   final DateFormat formatter = DateFormat('yyyy-MM-dd');
//   Future<void> selectDate(BuildContext context, DateTime currentDate) async {
//     String output = formatter.format(currentDate);
//
//     final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         currentDate: currentDate,
//         initialDate: currentDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(3000));
//     if (pickedDate != null )//&& pickedDate != currentDate)
//       setState(() {
//         _currentDate = pickedDate;});
//     Provider.of<datetime_vm>(context,listen: false)
//         .setdatetimevalue1(_currentDate );
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final events = Provider.of<EventProvider>(context,listen: true).events;
//
//     Widget dialog =
//     SimpleDialog(
//       elevation: 0,
//       //backgroundColor: Colors.yellowAccent,
//       // shape: StadiumBorder(
//       //    side: BorderSide.none
//       // ),
//       titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
//       insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
//       contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
//       title: Center(child: Text('جدولة زيارات العميل',style:TextStyle(fontFamily: kfontfamily2))),
//       // titleTextStyle: TextStyle(fontFamily: kfontfamily2),
//       children: [
//         Directionality(
//           textDirection: myui.TextDirection.rtl,
//           child:  StatefulBuilder(
//
//               builder: (BuildContext context, void Function(void Function()) setState) {
//                 return   Form(
//            child: Column(
//              children: [
//                RowEdit(name: " تاريخ الزيارة ", des: '*'),
//                TextField(
//                  decoration: InputDecoration(
//                  prefixIcon: Icon(
//                    Icons.date_range,
//                    color: kMainColor,
//                  ),
//                  hintStyle: const TextStyle(
//                      color: Colors.black45,
//                      fontSize: 16, fontWeight: FontWeight.w500),
//                  hintText://_currentDate.toString(),
//                  Provider.of<datetime_vm>(context,listen: true).valuedateTime.toString(),
//                  filled: true,
//                  fillColor: Colors.grey.shade200,
//                  ),
//                  readOnly: true,
//                  onTap: () {
//                  setState((){
//                    selectDate(context,_currentDate);
//                  });
//                  },
//                ),
//                // RaisedButton(
//                //   onPressed: () => _selectDate(context,_currentDate),
//                //   child: Text('Select date'),
//                // ),
//                SizedBox(height: 6,),
//                Center(
//                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//
//                    ElevatedButton(
//                      style: ButtonStyle(
//                          backgroundColor: MaterialStateProperty.all(
//                              kMainColor)),
//                      onPressed: () async {
//                        await Provider.of<client_vm>(context, listen: false)
//                            .updateclient_vm({
//                          "date_visit_Client": _currentDate.toString(),//DateTime.now().toString(),
//
//                        }, widget.clientModel!.idClients.toString());
//                        Provider.of<EventProvider>(
//                            context, listen: false).setvalue_save();
//                        Navigator.of(context, rootNavigator: true)
//                            .pop(false);
//                      },
//                      child: Text('حفظ موعد الزيارة'),
//                    ),
//
//                  ],
//                  ),
//                ),
//              ],
//            ),
//                 );
//
//               },
//
//             ),
//         )
//
//       ],
//     );
//
//     return Selector2<user_vm_provider, client_vm , bool>(
//       selector: (_, p1, p2) => p1.isLoading || p2.isloading,
//       builder: (context, value, child) {
//
//         if(value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return SfCalendar(
//           view: CalendarView.month,
//           dataSource: EventDataSource(events),
//           initialSelectedDate: DateTime.now(),
//           cellBorderColor: Colors.transparent,
//           onLongPress: (longDetail) async{
//             
//             if(widget.clientModel !=null) {
//               print('iside if');
//               await showDialog<void>(
//                   context: context,
//                   builder: (context) => dialog);
//
//               if( Provider.of<EventProvider>(
//                   context, listen: false).is_save){
//                 final providerlong = Provider.of<EventProvider>(
//                     context, listen: false);
//
//                 providerlong.setDate(_currentDate);//longDetail.date!);
//                 providerlong.addEvents(
//                     Event(
//                         fkIdClient: widget.clientModel?.idClients,
//                         title: widget.clientModel!.nameEnterprise.toString(),
//                         description: 'description',
//                         from: _currentDate,//longDetail.date!,
//                         to: _currentDate.add(Duration(hours: 2)),
//                         idinvoice: null)
//                 );
//               }}
//           },
//           onTap: (details) {
//
//             final provider = Provider.of<EventProvider>(context, listen: false);
//             print(details.date!);
//             provider.setDate(details.date!);
//             print(details.date!);
//             showModalBottomSheet(
//                 context: context, builder: (context) => TaskWidget());
//           },
//           // onLongPress: (details) {
//           //   final provider = Provider.of<EventProvider>(context, listen: false);
//           //   provider.setDate(details.date!);
//           //   showModalBottomSheet(
//           //       context: context, builder: (context) => TaskWidget());
//           // },
//         );
//       },
//     );
//
//   }
// }
