// import 'package:crm_smart/model/calendar/event_data_source.dart';
// import 'package:crm_smart/model/clientmodel.dart';
// import 'package:crm_smart/ui/widgets/widgetcalendar/task_widget.dart';
// import 'package:crm_smart/view_model/client_vm.dart';
// import 'package:crm_smart/view_model/event_provider.dart';
// import 'package:crm_smart/view_model/invoice_vm.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:crm_smart/model/calendar/event.dart';
// import 'dart:ui' as myui;
//
// import '../../../constants.dart';
// import '../../../view_model/datetime_vm.dart';
// import '../../../view_model/user_vm_provider.dart';
// import '../custom_widget/row_edit.dart';
//
// class CalendarWidget_install extends StatefulWidget {
//   CalendarWidget_install({required this.type,this.clientModel, Key? key}) : super(key: key);
//   String type;
//   ClientModel? clientModel;
//   @override
//   _CalendarWidget_installState createState() => _CalendarWidget_installState();
// }
//
// class _CalendarWidget_installState extends State<CalendarWidget_install> {
//   @override void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//
//     });
//   }
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
//     return Selector2<user_vm_provider, invoice_vm , bool>(
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
//
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
