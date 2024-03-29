import 'dart:ui' as myui;

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/helper/number_formatter.dart';
import 'package:crm_smart/model/chartmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/utils/end_points.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'is_marketing_chekbox.dart';

class deptsales extends StatefulWidget {
  const deptsales({Key? key}) : super(key: key);

  @override
  State<deptsales> createState() => _deptsalesState();
}

class _deptsalesState extends State<deptsales> {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  String labelxx = '';
  List<InvoiceModel> listInvoicesAccept = []; //مشتركين
  List<BarModel> salesresult = [];
  List<BarModel> salestempdataclientresult = [];
  List<DataRow> rowsdata = [];
  late String iduser = '';
  late String idregoin = '';
  bool loading = true;
  String type = 'allregoin';
  String typeproduct = 'الكل';
  double totalval = 0;
  bool isMarketing = false;
  late bool haveMarketingPrivilege;

  @override
  void initState() {
    haveMarketingPrivilege =
        context.read<PrivilegeCubit>().checkPrivilege('55');
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
    String paramprivilge = '';
    if (context.read<PrivilegeCubit>().checkPrivilege('92')) {
      labelxx = 'user';
      iduser = usermodel.idUser.toString();
      paramprivilge = '&id_user=${iduser}';
    }
    if (context.read<PrivilegeCubit>().checkPrivilege('93')) {
      labelxx = 'regoin';
      idregoin = usermodel.fkRegoin.toString();
      paramprivilge = '&id_regoin=${idregoin}';
    }
    if (context.read<PrivilegeCubit>().checkPrivilege('94')) {
      if (iduser == '' && idregoin == '') {
        type = 'allregoin';
        labelxx = 'الفرع';
      }
      if (iduser == '' && idregoin != '') {
        type = 'regoin';
        paramprivilge = '&id_regoin=${idregoin}';
      }
      if (iduser != '' && idregoin == '') {
        type = 'users';
        paramprivilge = '&id_user=${iduser}';
      }
    }

    if (context.read<PrivilegeCubit>().checkPrivilege('92') ||
        context.read<PrivilegeCubit>().checkPrivilege('93') ||
        context.read<PrivilegeCubit>().checkPrivilege('94')) {
      if (idregoin == '0') {
        type = 'allregoin';
        labelxx = 'الفرع';
      }

      String isMarketingParams = '';
      if (isMarketing) {
        isMarketingParams = '&ismarketing=1';
      } else {
        isMarketingParams = '';
      }
      var data;
      switch (type) {
        case "allregoin":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/debt_report.php?fk_country=$fkcountry$isMarketingParams",
              body: {'type': type});
          break;
        case "users":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/debt_report.php?fk_country=$fkcountry&id_user=$iduser$isMarketingParams",
              body: {'type': type});
          break;
        case "regoin":
          data = await Api().post(
              url: EndPoints.baseUrls.url +
                  "reports/debt_report.php?fk_country=$fkcountry&id_regoin=$idregoin$isMarketingParams",
              body: {'type': type});
          break;
      }
      List<BarModel> tempdataclient = [];

      totalval = 0;
      rowsdata = [];
      if (type == 'allregoin') {
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
              DataCell(TextUtilis(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.normal,
                textstring: tempdata[i].countclient.toString(),
                underline: TextDecoration.none,
              )),
            ],
          ));
        }
      } else {
        listInvoicesAccept = [];
        for (int i = 0; i < data.length; i++) {
          listInvoicesAccept.add(InvoiceModel.fromJson(data[i]));
          totalval += double.parse(listInvoicesAccept[i].total.toString()) -
              double.parse(listInvoicesAccept[i].amountPaid.toString());
        }
      }
    }
    totalval = double.parse(totalval.toStringAsFixed(2).toString());
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
        // insideLabelStyleAccessorFn:
        // displayName: 'll',
      ),
      //   charts.Series<BarModel, String>(
      //     data: salesresult,
      //     id: 'العملاء',
      //     colorFn:   (_, __) =>
      //         // charts.ColorUtil.fromDartColor(
      //         //     Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      //     //Colors.primaries[Random().nextInt(Colors.primaries.length)],//
      //      charts.MaterialPalette.blue.shadeDefault,//charts.MaterialPalette.indigo.shadeDefault,
      //     domainFn:  (BarModel genderModel, _) => genderModel.x,
      //     measureFn: (BarModel genderModel, _) => genderModel.y,
      //     displayName: "Income",
      // )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تقارير ديون العملاء "),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                context.read<PrivilegeCubit>().checkPrivilege('94')
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
                                  labelxx = 'regoin';
                                  getData();
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: context.read<PrivilegeCubit>().checkPrivilege('94') ||
                          context.read<PrivilegeCubit>().checkPrivilege('93')
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
                                          iduser = '';
                                          labelxx = '';
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
                                        labelxx = 'user';
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
            Center(
              child: loading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Column(
                          // scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('إجمالي الديون'),
                                Text(formatNumber(totalval)),
                              ],
                            ),
                            // Container(
                            //   height: 100, //BarChart
                            //   child: charts.BarChart(
                            //     _createSampleData(),
                            //     // barRendererDecorator: new charts.BarLabelDecorator<String>(),
                            //     barGroupingType: charts.BarGroupingType.grouped,
                            //     animate: true,
                            //     // barRendererDecorator: (
                            //     //     charts.BarLabelDecorator<String>(
                            //     //       insideLabelStyleSpec: fl.TextStyleSpec(
                            //     //           fontSize: 12, color: fl.Color.black),
                            //     //       labelPosition: fl.BarLabelPosition.inside,
                            //     //       labelAnchor:fl. BarLabelAnchor.middle,
                            //     //     )),
                            //     // vertical: false,
                            //     // barGroupingType: charts.BarGroupingType.grouped,
                            //     // defaultRenderer: charts.BarRendererConfig(
                            //     //   groupingType: charts.BarGroupingType.grouped,
                            //     //   strokeWidthPx: 1.0,
                            //     // ),
                            //     domainAxis: charts.OrdinalAxisSpec(
                            //       renderSpec: charts.GridlineRendererSpec(),
                            //     ),
                            //     // Set a bar label decorator.
                            //     // Example configuring different styles for inside/outside:
                            //
                            //     // barRendererDecorator: new charts.BarLabelDecorator<String>(),
                            //     // // Hide domain axis.
                            //     // domainAxis:
                            //     // new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
                            //
                            //     // behaviors: [
                            //     //      new charts.SeriesLegend(
                            //     //
                            //     //      )
                            //     //    // new charts.DatumLegend(//SeriesLegend
                            //     //    //   outsideJustification:
                            //     //    //       charts.OutsideJustification.start,
                            //     //    //   horizontalFirst: false,
                            //     //    //   desiredMaxRows: 2,
                            //     //    //   cellPadding: new EdgeInsets.only(
                            //     //    //       right: 4.0, bottom: 4.0, top: 4.0,left: 10),
                            //     //    //   entryTextStyle: charts.TextStyleSpec(
                            //     //    //       color: charts.MaterialPalette.purple.shadeDefault,
                            //     //    //       fontFamily: 'Georgia',
                            //     //    //       fontSize: 18),
                            //     //    // )
                            //     // ],
                            //     //  defaultRenderer: new charts.ArcRendererConfig(
                            //     //      arcWidth: 100,
                            //     //      arcRendererDecorators: [
                            //     //        new charts.ArcLabelDecorator(
                            //     //            labelPosition: charts.ArcLabelPosition.inside)
                            //     //      ]),
                            //
                            //     // defaultRenderer: charts.ArcRendererConfig(
                            //     //     arcRendererDecorators: [
                            //     //       charts.ArcLabelDecorator(
                            //     //           labelPosition: charts.ArcLabelPosition.inside)
                            //     //     ])
                            //   ),
                            // ),
                            labelxx == 'الفرع'
                                ? Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: SingleChildScrollView(
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
                                            'الفرع',
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'الديون',
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'عدد الفواتير ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                      ],
                                      rows: rowsdata,
                                      dividerThickness: 3,
                                      horizontalMargin: 2,
                                      columnSpacing: 20,
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
                                        ),
                                  )
                                : labelxx == 'user' || labelxx == 'regoin'
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0, right: 30, top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'عدد الفواتير',
                                                  style: TextStyle(
                                                      fontFamily: kfontfamily2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  listInvoicesAccept.length
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: kfontfamily2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.67,
                                            child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listInvoicesAccept.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      child: CardInvoiceClient(
                                                        type: '',
                                                        invoice:
                                                            listInvoicesAccept[
                                                                index],
                                                        //itemClient :  itemClient,
                                                      ));
                                                }),
                                          ),
                                        ],
                                      )
                                    : Container()
                          ]),
                    ),
            ),
          ]),
        ),
      ),
    );
  }
}
