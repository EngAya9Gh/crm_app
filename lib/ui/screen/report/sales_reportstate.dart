import 'dart:ui' as myui;

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/helper/number_formatter.dart';
import 'package:crm_smart/model/chartmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/di/di_container.dart';
import '../../../core/utils/end_points.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'is_marketing_chekbox.dart';

class sales_reportstate extends StatefulWidget {
  const sales_reportstate({Key? key}) : super(key: key);

  @override
  State<sales_reportstate> createState() => _sales_reportstateState();
}

class _sales_reportstateState extends State<sales_reportstate> {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

  List<BarModel> salesresult = [];
  List<BarModel> salestempdataclientresult = [];
  List<DataRow> rowsdata = [];
  late String iduser = '0';
  late String idregoin = '0';
  bool loading = true;
  String type = 'dateyear';
  String typeproduct = 'الكل';
  double totalval = 0;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDatemonth = DateTime.now();
  DateTime _selectedDatefrom = DateTime.now();
  DateTime _selectedDateto = DateTime.now();
  bool isMarketing = false;
  late bool haveMarketingPrivilege;
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _privilegeCubit = getIt<PrivilegeCubit>();
    haveMarketingPrivilege = _privilegeCubit.checkPrivilege('55');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<selected_button_provider>(context, listen: false)
          .selectValuebarsalestype(0);
      Provider.of<selected_button_provider>(context, listen: false)
          .selectValuebarsales(0);
      Provider.of<UserProvider>(context, listen: false).changevalueuser(null);
    });
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_)async {
    // if(  Provider.of<privilge_vm>(context,listen: false)
    //       .checkprivlge('89')==true)
    //    type='userSum';
    // if(  Provider.of<privilge_vm>(context,listen: false)
    //       .checkprivlge('90')==true)
    //    type='userSum';
    // if(  Provider.of<privilge_vm>(context,listen: false)
    //       .checkprivlge('89')==true)
    //    type='userSum';
    // });
    if (!haveMarketingPrivilege) getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    List<BarModel> tempdata = [];
    rowsdata.clear();
    UserModel usermodel =
        Provider.of<UserProvider>(context, listen: false).currentUser;
    String fkcountry = usermodel.fkCountry.toString();
    if (iduser == '0') iduser = usermodel.idUser.toString();

    if (idregoin == '0') idregoin = usermodel.fkRegoin.toString();

    String paramprivilge = '';
    if (_privilegeCubit.checkPrivilege('96'))
      paramprivilge = '&id_user=${iduser}';
    if (_privilegeCubit.checkPrivilege('97'))
      paramprivilge = '&id_regoin=${idregoin}';
    if (_privilegeCubit.checkPrivilege('98')) {
      if (iduser == '' && idregoin != '')
        paramprivilge = '&id_regoin=${idregoin}';

      if (iduser != '' && idregoin == '') paramprivilge = '&id_user=${iduser}';
    }

    if (_privilegeCubit.checkPrivilege('96') ||
        _privilegeCubit.checkPrivilege('97') ||
        _privilegeCubit.checkPrivilege('98')) {
      if (idregoin == '0') {
        type = 'userSum';
      }
      var data;
      String isMarketingParams = '';
      if (isMarketing) {
        isMarketingParams = '&ismarketing=1';
      } else {
        isMarketingParams = '';
      }
      switch (type) {
        case "userSum":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/sales_statereport.php?fk_country=$fkcountry$paramprivilge$isMarketingParams",
              body: {'type': type});
          break;
        case "dateyear":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/sales_statereport.php?fk_country=$fkcountry&year=${_selectedDate.year.toString()}$paramprivilge$isMarketingParams",
              body: {'type': type});
          break;
        case "datemonth":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/sales_statereport.php?fk_country=$fkcountry&month=${_selectedDatemonth.toString()}$paramprivilge$isMarketingParams",
              body: {'type': type});
          break;
        case "datedays":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/sales_statereport.php?fk_country=$fkcountry&from=${_selectedDatefrom.toString()}&to=${_selectedDateto.toString()}$paramprivilge$isMarketingParams",
              body: {'type': type});
          break;
      }
      List<BarModel> tempdataclient = [];
      totalval = 0;
      rowsdata = [];
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
            DataCell(TextUtilis(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.normal,
              textstring: getnamelong(tempdata[i].x),
              underline: TextDecoration.none,
            )),
            DataCell(TextUtilis(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.normal,
              textstring: formatNumber(tempdata[i].y),
              underline: TextDecoration.none,
            )),
            // DataCell( TextUtilis(
            //   color: Colors.black,
            //   fontSize: 25,
            //   fontWeight: FontWeight.normal,
            //   textstring: tempdata[i].countclient.toString(),
            //   underline: TextDecoration.none,
            // )),
          ],
        ));
      }
    }
    setState(() {
      salesresult = tempdata;
      loading = false;
    });
  }

  List<charts.Series<BarModel, String>> _createSampleData() {
    return [
      charts.Series<BarModel, String>(
        data: salesresult,
        id: 'المبيعات',
        // colorFn: (_, __) =>
        //
        //     // charts.ColorUtil.fromDartColor(
        //     // //    Colors.primaries[Random().nextInt(Colors.primaries.length)]
        //     //     Colors.primaries[Random().nextInt(Colors.primaries.length)]
        //     // ),
        //     charts.MaterialPalette.teal.shadeDefault,
        colorFn: (BarModel bar, _) =>
            charts.ColorUtil.fromDartColor(bar.colorval),
        // charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (BarModel genderModel, _) => getnameshort(genderModel.x),
        measureFn: (BarModel genderModel, __) => genderModel.y,
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
        title: Text("تقارير حالات العملاء"),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<selected_button_provider>(
                      builder: (context, selectedProvider, child) {
                    return GroupButton(
                        controller: GroupButtonController(
                          selectedIndex: selectedProvider.isbarsales,
                        ),
                        options: GroupButtonOptions(
                            buttonWidth: 75,
                            borderRadius: BorderRadius.circular(10)),
                        buttons: ['سنوي', 'شهري', 'يومي'],
                        onSelected: (_, index, isselected) {
                          switch (index) {
                            case 0:
                              type = 'dateyear';
                              if (_selectedDate != DateTime(1, 1, 1)) getData();
                              break;
                            case 1:
                              type = 'datemonth';
                              if (_selectedDatemonth != DateTime(1, 1, 1))
                                getData();
                              break;
                            case 2:
                              type = 'datedays';
                              if (_selectedDatefrom != DateTime(1, 1, 1) &&
                                  _selectedDateto != DateTime(1, 1, 1))
                                getData();
                              break;
                          }

                          // datedays
                          //setState(() {
                          //typeinstallController=index.toString();
                          selectedProvider.selectValuebarsales(index);
                          //  });
                        });
                  }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _privilegeCubit.checkPrivilege('98')
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Consumer<RegionProvider>(
                            builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text("الفرع"),
                                items: cart.listRegionFilter.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(
                                        level_one.regionName), //label of item
                                    value: level_one.regionId, //value of item
                                  );
                                }).toList(),
                                value: cart.selectedRegionId,
                                onChanged: (value) {
                                  //  setState(() {
                                  cart.changeVal(value.toString());
                                  idregoin = value.toString();
                                  iduser = '';
                                  getData();
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: _privilegeCubit.checkPrivilege('98') ||
                          _privilegeCubit.checkPrivilege('97')
                      ? //user
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                          ),
                          child: Consumer<UserProvider>(
                            builder: (context, cart, child) {
                              return Row(
                                children: [
                                  if (cart.selectedUser != null) ...{
                                    IconButton(
                                        onPressed: () {
                                          iduser = '0';
                                          idregoin = '0';
                                          cart.changevalueuser(null);
                                          getData();
                                        },
                                        icon: Icon(Icons.highlight_off)),
                                    SizedBox(width: 10),
                                  },
                                  Expanded(
                                    child: DropdownSearch<UserModel>(
                                      mode: Mode.DIALOG,
                                      filterFn: (user, filter) =>
                                          user!.getfilteruser(filter!),
                                      compareFn: (item, selectedItem) =>
                                          item?.idUser == selectedItem?.idUser,
                                      items: cart.usersSalesManagement,
                                      itemAsString: (u) => u!.userAsString(),
                                      onChanged: (data) {
                                        iduser = data!.idUser!;
                                        idregoin = '';
                                        cart.changevalueuser(data);
                                        getData();
                                        //filtershow();
                                      },
                                      selectedItem: cart.selectedUser,
                                      showSearchBox: true,
                                      dropdownSearchDecoration: InputDecoration(
                                        isCollapsed: true,
                                        hintText: 'الموظف',
                                        alignLabelWithHint: true,
                                        fillColor: Colors.grey.withOpacity(0.2),
                                        contentPadding: EdgeInsets.all(0),
                                        border: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
            IsMarketingCheckbox(
              onChange: (value) {
                isMarketing = value;
                getData();
              },
            ),
            Provider.of<selected_button_provider>(context, listen: true)
                        .isbarsales ==
                    0
                ? TextFormField(
                    validator: (value) {
                      if (_selectedDate == DateTime(1, 1, 1)) {
                        return 'يرجى تعيين التاريخ ';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: kMainColor,
                      ),
                      hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: _selectedDate == DateTime(1, 1, 1)
                          ? 'السنة' //_currentDate.toString()
                          : DateFormat('yyyy').format(_selectedDate),
                      //_invoice!.dateinstall_task.toString(),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                    readOnly: true,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Select Year"),
                            content: Container(
                              // Need to use container to add size constraint.
                              width: 300,
                              height: 300,
                              child: YearPicker(
                                firstDate: DateTime(DateTime.now().year - 3, 1),
                                lastDate:
                                    DateTime(DateTime.now().year + 100, 1),
                                initialDate: DateTime.now(),
                                // save the selected date to _selectedDate DateTime variable.
                                // It's used to set the previous selected date when
                                // re-showing the dialog.
                                selectedDate: _selectedDate,
                                onChanged: (DateTime dateTime) {
                                  setState(() {
                                    _selectedDate = dateTime;
                                  });

                                  // close the dialog when year is selected.
                                  Navigator.pop(context);
                                  getData();

                                  // Do something with the dateTime selected.
                                  // Remember that you need to use dateTime.year to get the year
                                },
                              ),
                            ),
                          );
                        },
                      );

                      // _selectDate(context, DateTime.now());
                    },
                  )
                : Provider.of<selected_button_provider>(context, listen: true)
                            .isbarsales ==
                        1
                    ? Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (_selectedDatemonth == DateTime(1, 1, 1)) {
                                  return 'يرجى تعيين التاريخ ';
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: kMainColor,
                                ),
                                hintStyle: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                hintText:
                                    _selectedDatemonth == DateTime(1, 1, 1)
                                        ? 'الشهر' //_currentDate.toString()
                                        : DateFormat('yyyy-MM')
                                            .format(_selectedDatemonth),
                                //_invoice!.dateinstall_task.toString(),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              readOnly: true,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Select month"),
                                      content: Container(
                                        // Need to use container to add size constraint.
                                        width: 300,
                                        height: 300,
                                        child: CalendarDatePicker(
                                          initialDate: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month),
                                          firstDate: DateTime(
                                              DateTime.now().year - 100, 1),
                                          lastDate: DateTime(
                                              DateTime.now().year + 100, 1),
                                          // : DateTime.now(),
                                          // save the selected date to _selectedDate DateTime variable.
                                          // It's used to set the previous selected date when
                                          // re-showing the dialog.
                                          currentDate: DateTime.now(),
                                          //_selectedDatemonth,
                                          onDateChanged: (DateTime dateTime) {
                                            setState(() {
                                              _selectedDatemonth = dateTime;
                                            });

                                            // close the dialog when year is selected.
                                            Navigator.pop(context);
                                            getData();

                                            // Do something with the dateTime selected.
                                            // Remember that you need to use dateTime.year to get the year
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );

                                // _selectDate(context, DateTime.now());
                              },
                            ),
                          ),
                        ],
                      )
                    : Provider.of<selected_button_provider>(context,
                                    listen: true)
                                .isbarsales ==
                            2
                        ? Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('from'),
                                    TextFormField(
                                      validator: (value) {
                                        if (_selectedDatefrom ==
                                            DateTime(1, 1, 1)) {
                                          return 'يرجى تعيين التاريخ ';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.date_range,
                                          color: kMainColor,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        hintText: _selectedDatefrom ==
                                                DateTime(1, 1, 1)
                                            ? 'from' //_currentDate.toString()
                                            : DateFormat('yyyy-MM-dd')
                                                .format(_selectedDatefrom),
                                        //_invoice!.dateinstall_task.toString(),
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        _selectDatefrom(
                                            context, DateTime.now());

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
                                        if (_selectedDateto ==
                                            DateTime(1, 1, 1)) {
                                          return 'يرجى تعيين التاريخ ';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.date_range,
                                          color: kMainColor,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        hintText:
                                            _selectedDateto == DateTime(1, 1, 1)
                                                ? 'to' //_currentDate.toString()
                                                : DateFormat('yyyy-MM-dd')
                                                    .format(_selectedDateto),
                                        //_invoice!.dateinstall_task.toString(),
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        _selectDateto(context, DateTime.now());
                                        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                                        //   getData();
                                        // _selectDate(context, DateTime.now());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
            Expanded(
              child: Center(
                child: loading
                    ? CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SingleChildScrollView(
                          child: Column(
                              // scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  height: 300, //BarChart
                                  child: charts.BarChart(
                                    _createSampleData(),
                                    // barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                    barGroupingType:
                                        charts.BarGroupingType.grouped,
                                    animate: true,

                                    domainAxis: charts.OrdinalAxisSpec(
                                      renderSpec: charts.GridlineRendererSpec(),
                                    ),
                                    // Set a bar label decorator.
                                    // Example configuring different styles for inside/outside:

                                    // barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                    // // Hide domain axis.
                                    // domainAxis:
                                    // new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),

                                    // behaviors: [
                                    //      new charts.SeriesLegend(
                                    //
                                    //      )
                                    //    // new charts.DatumLegend(//SeriesLegend
                                    //    //   outsideJustification:
                                    //    //       charts.OutsideJustification.start,
                                    //    //   horizontalFirst: false,
                                    //    //   desiredMaxRows: 2,
                                    //    //   cellPadding: new EdgeInsets.only(
                                    //    //       right: 4.0, bottom: 4.0, top: 4.0,left: 10),
                                    //    //   entryTextStyle: charts.TextStyleSpec(
                                    //    //       color: charts.MaterialPalette.purple.shadeDefault,
                                    //    //       fontFamily: 'Georgia',
                                    //    //       fontSize: 18),
                                    //    // )
                                    // ],
                                    //  defaultRenderer: new charts.ArcRendererConfig(
                                    //      arcWidth: 100,
                                    //      arcRendererDecorators: [
                                    //        new charts.ArcLabelDecorator(
                                    //            labelPosition: charts.ArcLabelPosition.inside)
                                    //      ]),

                                    // defaultRenderer: charts.ArcRendererConfig(
                                    //     arcRendererDecorators: [
                                    //       charts.ArcLabelDecorator(
                                    //           labelPosition: charts.ArcLabelPosition.inside)
                                    //     ])
                                  ),
                                ),
                                SingleChildScrollView(
                                    child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        '',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'الحالة',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'العدد',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                    // DataColumn(
                                    //   label: Text(
                                    //     'العدد ',
                                    //     style: TextStyle(fontStyle: FontStyle.normal),
                                    //   ),
                                    // ),
                                  ],
                                  rows: rowsdata,
                                  dividerThickness: 3,
                                  horizontalMargin: 2,
                                  columnSpacing:
                                      MediaQuery.of(context).size.width * 0.3,
                                  //       RowEditTitle(color: salesresult[i].colorval,name: salesresult[i].x,
                                  //         des2: salesresult[i].y.toString(), des: salesresult[i].countclient.toString()),
                                  //     <DataRow>[
                                  //   DataRow(
                                  //     cells: <DataCell>[
                                  //       DataCell(Text('Sarah')),
                                  //       DataCell(Text('19')),
                                  //       DataCell(Text('Student')),
                                  //       DataCell(Text('Student')),
                                  //     ],
                                  //   ),
                                  // ],
                                )
                                    // Column(
                                    //   children: [
                                    //     RowEditTitle(color: null,name: 'الموظف', des2: ' مبيعاته', des: 'عدد العملاء',),
                                    //     for(int i=0;i<salesresult.length;i++)
                                    //       RowEditTitle(color: salesresult[i].colorval,name: salesresult[i].x,
                                    //         des2: salesresult[i].y.toString(), des: salesresult[i].countclient.toString()),
                                    //   ],
                                    // ),
                                    )
                              ]),
                        ),
                      ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _selectDatefrom(
      BuildContext context, DateTime currentDate) async {
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

        if (_selectedDateto != DateTime(1, 1, 1) &&
            _selectedDatefrom != DateTime(1, 1, 1)) getData();
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

        if (_selectedDateto != DateTime(1, 1, 1) &&
            _selectedDatefrom != DateTime(1, 1, 1)) getData();
      });
  }
}
