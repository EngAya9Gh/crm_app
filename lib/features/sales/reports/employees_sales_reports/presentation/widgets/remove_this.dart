//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../../api/api.dart';
// import '../../../../../../core/common/widgets/custom_circular_chart.dart';
// import '../../../../../../core/utils/end_points.dart';
// import '../../../../../../model/chartmodel.dart';
// import '../../../../../../model/usermodel.dart';
// import '../../../../../../provider/selected_button_provider.dart';
// import '../../../../../../ui/widgets/custom_widget/text_uitil.dart';
// import '../../../../../../view_model/user_vm_provider.dart';
// import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
//
// class BarChartAPI extends StatefulWidget {
//   const BarChartAPI({Key? key}) : super(key: key);
//
//   @override
//   State<BarChartAPI> createState() => _BarChartAPIState();
// }
//
// class _BarChartAPIState extends State<BarChartAPI> {
//   List<BarModel> salesresult = [];
//   List<BarModel> salestempdataclientresult = [];
//   List<DataRow> rowsdata = [];
//
//   bool loading = true;
//   String type = 'datemonth';
//   String typeproduct = 'برامج';
//   double totalval = 0;
//   DateTime _selectedDate = DateTime.now();
//   DateTime _selectedDatemonth = DateTime.now();
//   DateTime _selectedDatefrom = DateTime.now();
//   DateTime _selectedDateto = DateTime.now();
//   bool isMarketing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       Provider.of<selected_button_provider>(context, listen: false)
//           .selectValuebarsalestype(2);
//       Provider.of<selected_button_provider>(context, listen: false)
//           .selectValuebarsales(1);
//       Provider.of<UserProvider>(context, listen: false).changevalueuser(null);
//     });
//     getData();
//   }
//
//   Future<void> getData() async {
//
//     List<BarModel> tempdata = [];
//     rowsdata.clear();
//     var data;
//       List<BarModel> tempdataclient = [];
//       totalval = 0;
//       rowsdata = [];
//       for (int i = 0; i < data.length; i++) {
//         tempdata.add(BarModel.fromJson(data[i]));
//
//         totalval += tempdata[i].y;
//         rowsdata.add(DataRow(
//           cells: <DataCell>[
//             DataCell(SizedBox(
//               width: 15.0,
//               height: 15.0,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(color: tempdata[i].colorval),
//               ),
//             )),
//             //Text('tempdata[i].colorval')),
//             DataCell(TextUtilis(
//               color: Colors.black,
//               fontSize: 25,
//               fontWeight: FontWeight.normal,
//               textstring: getnameshort(tempdata[i].x),
//               underline: TextDecoration.none,
//             )),
//             DataCell(TextUtilis(
//               color: Colors.black,
//               fontSize: 25,
//               fontWeight: FontWeight.normal,
//               textstring: formatNumber(tempdata[i].y),
//               underline: TextDecoration.none,
//             )),
//             DataCell(TextUtilis(
//               color: Colors.black,
//               fontSize: 25,
//               fontWeight: FontWeight.normal,
//               textstring: tempdata[i].countclient.toString(),
//               underline: TextDecoration.none,
//             )),
//           ],
//         ));
//         // tempdataclient.add(BarModel.fromJson(data[i]));
//       }
//     }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 8.0, bottom: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Consumer<selected_button_provider>(
//                   builder: (context, selectedProvider, child) {
//                 return GroupButton(
//                     onSelected: (_, index, isselected) {
//                     buttons: ['سنوي', 'شهري', 'يومي'];
//                     });
//               }),
//
//               Consumer<selected_button_provider>(
//                   builder: (context, selectedProvider, child) {
//                 return GroupButton(
//                     buttons: ['الكل', 'أجهزة', 'برامج'],
//                     onSelected: (_, index, isselected) {
//
//         IsMarketingCheckbox_last(
//           onChange: (value) {
//             isMarketing = value;
//             getData();
//           },
//         ),
//         Provider.of<selected_button_provider>(context, listen: true)
//                     .isbarsales ==
//                 0
//             ? TextFormField(
//                 validator: (value) {
//                   if (_selectedDate == DateTime(1, 1, 1)) {
//                     return 'يرجى تعيين التاريخ ';
//                   }
//                 },
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(
//                     Icons.date_range,
//                     color: kMainColor,
//                   ),
//                   hintStyle: const TextStyle(
//                       color: Colors.black45,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500),
//                   hintText: _selectedDate == DateTime(1, 1, 1)
//                       ? 'السنة' //_currentDate.toString()
//                       : DateFormat('yyyy').format(_selectedDate),
//                   //_invoice!.dateinstall_task.toString(),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text("Select Year"),
//                         content: Container(
//                           // Need to use container to add size constraint.
//                           width: 300,
//                           height: 300,
//                           child: YearPicker(
//                             firstDate: DateTime(DateTime.now().year - 3, 1),
//                             lastDate:
//                                 DateTime(DateTime.now().year + 100, 1),
//                             initialDate: DateTime.now(),
//                             // save the selected date to _selectedDate DateTime variable.
//                             // It's used to set the previous selected date when
//                             // re-showing the dialog.
//                             selectedDate: _selectedDate,
//                             onChanged: (DateTime dateTime) {
//                               setState(() {
//                                 _selectedDate = dateTime;
//                               });
//
//                               // close the dialog when year is selected.
//                               Navigator.pop(context);
//                               getData();
//
//                               // Do something with the dateTime selected.
//                               // Remember that you need to use dateTime.year to get the year
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   );
//
//                   // _selectDate(context, DateTime.now());
//                 },
//               )
//             : Provider.of<selected_button_provider>(context, listen: true)
//                         .isbarsales ==
//                     1
//                 ? Row(
//                     children: [
//                       Flexible(
//                         child: TextFormField(
//                           validator: (value) {
//                             if (_selectedDatemonth == DateTime(1, 1, 1)) {
//                               return 'يرجى تعيين التاريخ ';
//                             }
//                           },
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(
//                               Icons.date_range,
//                               color: kMainColor,
//                             ),
//                             hintStyle: const TextStyle(
//                                 color: Colors.black45,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500),
//                             hintText:
//                                 _selectedDatemonth == DateTime(1, 1, 1)
//                                     ? 'الشهر' //_currentDate.toString()
//                                     : DateFormat('yyyy-MM')
//                                         .format(_selectedDatemonth),
//                             //_invoice!.dateinstall_task.toString(),
//                             filled: true,
//                             fillColor: Colors.grey.shade200,
//                           ),
//                           readOnly: true,
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text("Select month"),
//                                   content: Container(
//                                     // Need to use container to add size constraint.
//                                     width: 300,
//                                     height: 300,
//                                     child: CalendarDatePicker(
//                                       initialDate: DateTime(
//                                           DateTime.now().year,
//                                           DateTime.now().month),
//                                       firstDate: DateTime(
//                                           DateTime.now().year - 100, 1),
//                                       lastDate: DateTime(
//                                           DateTime.now().year + 100, 1),
//                                       // : DateTime.now(),
//                                       // save the selected date to _selectedDate DateTime variable.
//                                       // It's used to set the previous selected date when
//                                       // re-showing the dialog.
//                                       currentDate: DateTime.now(),
//                                       //_selectedDatemonth,
//                                       onDateChanged: (DateTime dateTime) {
//                                         setState(() {
//                                           _selectedDatemonth = dateTime;
//                                         });
//
//                                         // close the dialog when year is selected.
//                                         Navigator.pop(context);
//                                         getData();
//
//                                         // Do something with the dateTime selected.
//                                         // Remember that you need to use dateTime.year to get the year
//                                       },
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//
//                             // _selectDate(context, DateTime.now());
//                           },
//                         ),
//                       ),
//                     ],
//                   )
//                 : Provider.of<selected_button_provider>(context,
//                                 listen: true)
//                             .isbarsales ==
//                         2
//                     ? Row(
//                         children: [
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('from'),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (_selectedDatefrom ==
//                                         DateTime(1, 1, 1)) {
//                                       return 'يرجى تعيين التاريخ ';
//                                     }
//                                   },
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.date_range,
//                                       color: kMainColor,
//                                     ),
//                                     hintStyle: const TextStyle(
//                                         color: Colors.black45,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500),
//                                     hintText: _selectedDatefrom ==
//                                             DateTime(1, 1, 1)
//                                         ? 'from' //_currentDate.toString()
//                                         : DateFormat('yyyy-MM-dd')
//                                             .format(_selectedDatefrom),
//                                     //_invoice!.dateinstall_task.toString(),
//                                     filled: true,
//                                     fillColor: Colors.grey.shade200,
//                                   ),
//                                   readOnly: true,
//                                   onTap: () {
//                                     _selectDatefrom(
//                                         context, DateTime.now());
//                                     // _selectDate(context, DateTime.now());
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Flexible(
//                             child: Column(
//                               children: [
//                                 Text('to'),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (_selectedDateto ==
//                                         DateTime(1, 1, 1)) {
//                                       return 'يرجى تعيين التاريخ ';
//                                     }
//                                   },
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.date_range,
//                                       color: kMainColor,
//                                     ),
//                                     hintStyle: const TextStyle(
//                                         color: Colors.black45,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500),
//                                     hintText:
//                                         _selectedDateto == DateTime(1, 1, 1)
//                                             ? 'to' //_currentDate.toString()
//                                             : DateFormat('yyyy-MM-dd')
//                                                 .format(_selectedDateto),
//                                     //_invoice!.dateinstall_task.toString(),
//                                     filled: true,
//                                     fillColor: Colors.grey.shade200,
//                                   ),
//                                   readOnly: true,
//                                   onTap: () {
//                                     _selectDateto(context, DateTime.now());
//                                     // if(_selectedDateto!=DateTime(1, 1, 1)
//                                     //     &&_selectedDatefrom!=DateTime(1, 1, 1))
//                                     //   getData();
//                                     // _selectDate(context, DateTime.now());
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )
//                     : Container(),
//         Expanded(
//           child: Center(
//             child: loading
//                 ? CircularProgressIndicator()
//                 : Padding(
//                     padding: const EdgeInsets.only(top: 35.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                           // scrollDirection: Axis.horizontal,
//                           children: [
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text('إجمالي المبيعات'),
//                                 Text(formatNumber(totalval)),
//                               ],
//                             ),
//                             Container(
//                               height: 300, //BarChart
//                               child: CustomCircularChart(
//                                   dataList: salesresult),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: SingleChildScrollView(
//                                   child: DataTable(
//                                 columns: const <DataColumn>[
//                                   DataColumn(
//                                     label: Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontStyle: FontStyle.normal),
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'الموظف',
//                                       style: TextStyle(
//                                           fontStyle: FontStyle.normal),
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'المبيعات',
//                                       style: TextStyle(
//                                           fontStyle: FontStyle.normal),
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'عدد الفواتير',
//                                       style: TextStyle(
//                                           fontStyle: FontStyle.normal),
//                                     ),
//                                   ),
//                                 ],
//                                 rows: rowsdata,
//                                 dividerThickness: 3,
//                                 horizontalMargin: 3,
//                                 columnSpacing: 20,
//                               )
//                                   ),
//                             )
//                           ]),
//                     ),
//                   ),
//           ),
//         ),
//       ]),
//     );
//   }
//
//   Future<void> _selectDatefrom(
//       BuildContext context, DateTime currentDate) async {
//     DateTime? pickedDate = await showDatePicker(
//         context: context,
//         currentDate: currentDate,
//         initialDate: currentDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(3010));
//     if (pickedDate != null)
//       setState(() {
//         // Navigator.pop(context);
//         _selectedDatefrom = pickedDate;
//
//         if (_selectedDateto != DateTime(1, 1, 1) &&
//             _selectedDatefrom != DateTime(1, 1, 1)) getData();
//       });
//   }
//
//   Future<void> _selectDateto(BuildContext context, DateTime currentDate) async {
//     DateTime? pickedDate = await showDatePicker(
//         // initialEntryMode: DatePickerEntryMode.calendarOnly,
//         // initialDatePickerMode: DatePickerMode.year,
//         context: context,
//         currentDate: currentDate,
//         initialDate: currentDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(3010));
//     if (pickedDate != null)
//       setState(() {
//         // Navigator.pop(context);
//         _selectedDateto = pickedDate;
//
//         if (_selectedDateto != DateTime(1, 1, 1) &&
//             _selectedDatefrom != DateTime(1, 1, 1)) getData();
//       });
//   }
// }
