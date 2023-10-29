import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/helper/number_formatter.dart';
import 'package:crm_smart/model/chartmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../labeltext.dart';
import 'dart:ui' as myui;

import 'is_marketing_chekbox.dart';

class repeat_report extends StatefulWidget {
  const repeat_report({Key? key}) : super(key: key);

  @override
  _repeat_reportState createState() => _repeat_reportState();
}

class _repeat_reportState extends State<repeat_report> {
  List<BarModel> salesresult = [];
  List<BarModel> salestempdataclientresult = [];
  List<DataRow> rowsdata = [];

  bool loading = true;
  String type = 'datedays';
  String typeproduct = 'الكل';
  double totalval = 0;
  DateTime _selectedDatefrom = DateTime.now();
  DateTime _selectedDateto = DateTime.now();
  bool isMarketing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    List<BarModel> tempdata = [];
    rowsdata.clear();
    UserModel usermodel = Provider.of<UserProvider>(context, listen: false).currentUser;
    String fkcountry = usermodel.fkCountry.toString();
    var data;
    String isMarketingParams = '';
    if (isMarketing) {
      isMarketingParams = '&ismarketing=1';
    } else {
      isMarketingParams = '';
    }
    switch (type) {
      case "datedays":
        data = await Api().get(
          url: url +
              "reports/care_communication_report.php?fk_country=$fkcountry&from=${_selectedDatefrom.toString()}&to=${_selectedDateto.toString()}$isMarketingParams",
          //body: {'type': type}
        );
        break;
    }
    //userSum
    //List<BarModel> tempdata = genderModelFromJson(data);
    List<BarModel> tempdataclient = [];
    totalval = 0;
    for (int i = 0; i < data.length; i++) {
      tempdata.add(BarModel.fromJson(data[i]));
      
      totalval += tempdata[i].y;
      rowsdata.add(DataRow(
        cells: <DataCell>[
          DataCell(SizedBox(
            width: 15.0,
            height: 15.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: tempdata[i].colorval),
            ),
          )),
          //Text('tempdata[i].colorval')),
          DataCell(TextUtilis(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
            textstring: getnameshort(tempdata[i].x),
            underline: TextDecoration.none,
          )),
          DataCell(TextUtilis(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
            textstring: formatNumber(tempdata[i].y),
            underline: TextDecoration.none,
          )),
          DataCell(TextUtilis(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
            textstring: tempdata[i].countclient.toString(),
            underline: TextDecoration.none,
          )),
        ],
      ));
      // tempdataclient.add(BarModel.fromJson(data[i]));
    }

    setState(() {
      salesresult = tempdata;
      // salestempdataclientresult = tempdataclient;
      loading = false;
    });
  }

  List<charts.Series<BarModel, String>> _createSampleData() {
    return [
      charts.Series<BarModel, String>(
        data: salesresult,
        id: 'المبيعات',
        colorFn: (BarModel bar, _) => charts.ColorUtil.fromDartColor(bar.colorval),
        // charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (BarModel genderModel, _) => genderModel.x,
        measureFn: (BarModel genderModel, __) => genderModel.y.floor(),
        // measureFormatterFn: (BarModel genderModel,_) => ,
        labelAccessorFn: (BarModel row, __) => '${row.y}',
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(label_repeat_comm),
        ),
        body: SafeArea(
          child: Directionality(
            textDirection: myui.TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('from'),
                            TextFormField(
                              validator: (value) {
                                if (_selectedDatefrom == DateTime(1, 1, 1)) {
                                  return 'يرجى تعيين التاريخ ';
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle:
                                    const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                hintText: _selectedDatefrom == DateTime(1, 1, 1)
                                    ? 'from' //_currentDate.toString()
                                    : DateFormat('yyyy-MM-dd').format(_selectedDatefrom),
                                //_invoice!.dateinstall_task.toString(),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              readOnly: true,
                              onTap: () {
                                _selectDatefrom(context, DateTime.now());
                                // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                                //   getData();

                                // _selectDate(context, DateTime.now());
                              },
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text('to'),
                            TextFormField(
                              validator: (value) {
                                if (_selectedDateto == DateTime(1, 1, 1)) {
                                  return 'يرجى تعيين التاريخ ';
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle:
                                    const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                hintText: _selectedDateto == DateTime(1, 1, 1)
                                    ? 'to' //_currentDate.toString()
                                    : DateFormat('yyyy-MM-dd').format(_selectedDateto),
                                //_invoice!.dateinstall_task.toString(),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              readOnly: true,
                              onTap: () {
                                _selectDateto(context, DateTime.now());

                                // _selectDate(context, DateTime.now());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IsMarketingCheckbox(
                    onChange: (value) {
                      isMarketing = value;
                      getData();
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: loading
                          ? CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: SingleChildScrollView(
                                child: Column(
                                    // scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('الإجمالي '),
                                          Text(formatNumber(totalval)),
                                        ],
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height * 0.8, //BarChart
                                        child: charts.PieChart(
                                          _createSampleData(),
                                          // barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                          // barGroupingType: charts.BarGroupingType.grouped,
                                          animate: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SingleChildScrollView(
                                            child: DataTable(
                                          columns: const <DataColumn>[
                                            DataColumn(
                                              label: Text(
                                                '',
                                                style: TextStyle(fontStyle: FontStyle.normal),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'الموظف',
                                                style: TextStyle(fontStyle: FontStyle.normal),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'التواصلات',
                                                style: TextStyle(fontStyle: FontStyle.normal),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'عدد العملاء',
                                                style: TextStyle(fontStyle: FontStyle.normal),
                                              ),
                                            ),
                                          ],
                                          rows: rowsdata,
                                          dividerThickness: 3,
                                          horizontalMargin: 3,
                                          columnSpacing: 35,
                                        )),
                                      )
                                    ]),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _selectDatefrom(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDatefrom = pickedDate;
        
        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        getData();
      });
  }

  Future<void> _selectDateto(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        // initialEntryMode: DatePickerEntryMode.calendarOnly,
        // initialDatePickerMode: DatePickerMode.year,
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDateto = pickedDate;
        
        getData();
      });
  }
}
