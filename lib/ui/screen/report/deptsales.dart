
import 'package:charts_flutter/flutter.dart' as fl;
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/chartmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/custom_widget/rowtitle.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;
import '../../../constants.dart';

class deptsales extends StatefulWidget {
  const deptsales({Key? key}) : super(key: key);

  @override
  State<deptsales> createState() => _deptsalesState();
}
class _deptsalesState extends State<deptsales> {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  String labelxx='';
  List<InvoiceModel> listInvoicesAccept=[];//مشتركين
  List<BarModel> salesresult = [];
  List<BarModel> salestempdataclientresult = [];
  List<DataRow> rowsdata=[];
  late String iduser ='';
  late String idregoin='';
  bool loading = true;
  String type = 'allregoin';
  String typeproduct = 'الكل';
  double totalval=0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      Provider.of<selected_button_provider>(context,listen: false)
          .selectValuebarsalestype(0);
      Provider.of<selected_button_provider>(context,listen: false)
          .selectValuebarsales(0);
    Provider.of<user_vm_provider>(context,listen: false).changevalueuser(null);
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
    getData();
  }

  Future<void> getData() async {

    setState(() {
      loading=true;
    });
    List<BarModel> tempdata = [];
    rowsdata.clear();
    UserModel usermodel=Provider.of<user_vm_provider>(context, listen: false)
        .currentUser;
    String fkcountry = usermodel.fkCountry.toString();
    String paramprivilge='';
    if(Provider.of<privilge_vm>(context,listen: false)
        .checkprivlge('92')==true ){
      labelxx='user';
      iduser=usermodel.idUser.toString();
      paramprivilge='&id_user=${iduser}';
    }
    if(Provider.of<privilge_vm>(context,listen: false)
        .checkprivlge('93')==true ){
      labelxx='regoin';
      idregoin=usermodel.fkRegoin.toString();
      paramprivilge='&id_regoin=${idregoin}';
    }
    if(Provider.of<privilge_vm>(context,listen: false)
        .checkprivlge('94')==true ) {
      if(iduser==''&&idregoin=='') {
      type='allregoin';
      labelxx='الفرع';
      }
      if(iduser==''&&idregoin!='') {
        type='regoin';
        paramprivilge = '&id_regoin=${idregoin}';
      }
      if(iduser!=''&&idregoin==''){
        type='users';
        paramprivilge='&id_user=${iduser}';
      }
    }

    if(Provider.of<privilge_vm>(context,listen: false)
        .checkprivlge('92')==true ||
        Provider.of<privilge_vm>(context,listen: false)
            .checkprivlge('93')==true ||
        Provider.of<privilge_vm>(context,listen: false)
            .checkprivlge('94')==true ) {
      print(type);
      if(idregoin=='0'){
        type='allregoin';
        labelxx='الفرع';
      }
      print(paramprivilge);
      var data;
      switch (type) {
        case "allregoin":
          data = await Api().post(
              url: url + "reports/debt_report.php?fk_country=$fkcountry",
              body: {'type': type});
          break;
        case "users":
          data = await Api().post(
              url: url +
                  "reports/debt_report.php?fk_country=$fkcountry&id_user=$iduser",
              body: {'type': type});
          break;
        case "regoin":
          data = await Api().post(
              url: url +
                  "reports/debt_report.php?fk_country=$fkcountry&id_regoin=$idregoin",
              body: {'type': type});
          break;
      }
      List<BarModel> tempdataclient = [];

      totalval=0;rowsdata=[];
      if(type=='allregoin'){
      for (int i = 0; i < data.length; i++) {
        tempdata.add(BarModel.fromJson(data[i]));
        print(tempdata[i].y.toStringAsFixed(2).toString());
        totalval+=tempdata[i].y;
        rowsdata.add(
            DataRow(
              cells: <DataCell>[
                DataCell( SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child:  DecoratedBox(
                    decoration:  BoxDecoration(
                        color: tempdata[i].colorval
                    ),
                  ),
                )),
                DataCell( TextUtilis(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  textstring:getnamelong(tempdata[i].x),
                  underline: TextDecoration.none,
                )),
                DataCell( TextUtilis(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  textstring: tempdata[i].y.toStringAsFixed(2),
                  underline: TextDecoration.none,
                )),
                DataCell( TextUtilis(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  textstring: tempdata[i].countclient.toString(),
                  underline: TextDecoration.none,
                )),
              ],
            ));
      }}
      else{
        listInvoicesAccept=[];
        for (int i = 0; i < data.length; i++) {
          listInvoicesAccept.add(InvoiceModel.fromJson(data[i]));
          totalval+=double.parse(listInvoicesAccept[i].total.toString())-
              double.parse( listInvoicesAccept[i].amountPaid.toString());
        }
      }
    }
    totalval=double.parse( totalval.toStringAsFixed(2).toString());
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
        colorFn: (BarModel bar,_) =>charts.ColorUtil.fromDartColor(bar.colorval),
        // charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (BarModel genderModel, _) =>getnameshort(genderModel.x),
        measureFn: (BarModel genderModel,__) =>  genderModel.y,
        // measureFormatterFn: (BarModel genderModel,_) => ,
        labelAccessorFn:  (BarModel row, __) => '${row.y}',
        fillPatternFn: (_,__)=>charts.FillPatternType.solid,
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
      body:
      SafeArea(
        child: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Provider.of<privilge_vm>(context,listen: true)
                        .checkprivlge('94')==true?
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0,right: 8),
                        child: Consumer<regoin_vm>(
                          builder: (context, cart, child){
                            return
                              DropdownButton(
                                isExpanded: true,
                                hint: Text("الفرع"),
                                items: cart.listregoinfilter.map((level_one) {
                                  return DropdownMenuItem(

                                    child: Text(level_one.name_regoin), //label of item
                                    value: level_one.id_regoin, //value of item
                                  );
                                }).toList(),
                                value:cart.selectedValueLevel,
                                onChanged:(value) {
                                  //  setState(() {
                                  cart.changeVal(value.toString());
                                  idregoin=value.toString();
                                  iduser='';
                                  labelxx='regoin';
                                  getData();
                                },
                              );
                          },
                        ),
                      ),
                    )
                        :Container(),
                    Expanded(
                      child:
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('94')==true||
                          Provider.of<privilge_vm>(context,listen: true)
                              .checkprivlge('93')==true ? //user
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,),
                        child:
                        Consumer<user_vm_provider>(
                          builder: (context, cart, child){
                            return  DropdownSearch<UserModel>(

                              mode: Mode.DIALOG,
                              // label: " الموظف ",
                              //hint: 'الموظف',
                              //onFind: (String filter) => cart.getfilteruser(filter),
                              filterFn: (user, filter) => user!.getfilteruser(filter!),
                              //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                              // itemAsString: (UserModel u) => u.userAsStringByName(),
                              items: cart.userall,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                iduser=data!.idUser!;
                                idregoin='';
                                cart.changevalueuser(data);
                                labelxx='user';
                                getData();
                                //filtershow();
                              } ,
                              selectedItem: cart.selecteduser,
                              showSearchBox: true,
                              dropdownSearchDecoration:
                              InputDecoration(
                                //filled: true,
                                isCollapsed: true,
                                hintText: 'الموظف',
                                alignLabelWithHint: true,
                                fillColor:  Colors.grey.withOpacity(0.2),
                                //labelText: "choose a user",
                                contentPadding: EdgeInsets.all(0),
                                //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                // focusedBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(10),
                                //     borderSide: const BorderSide(color: Colors.white)),
                                border:
                                UnderlineInputBorder(
                                    borderSide: const BorderSide(  color: Colors.grey)
                                ),
                                // OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(10),
                                //     borderSide: const BorderSide( color: Colors.white)),
                              ),
                              // InputDecoration(border: InputBorder.none),

                            );

                          },
                        ),
                      ):Container(),
                    ),
                  ],
                ),
                Center(
                  child: loading
                      ? CircularProgressIndicator()
                      : Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Column(
                      // scrollDirection: Axis.horizontal,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('إجمالي الديون'),
                              Text(
                                  totalval.toStringAsFixed(2)),
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
                      labelxx=='الفرع'?
                      Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SingleChildScrollView(
                                child:
                                DataTable(

                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        '',
                                        style: TextStyle(fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'الفرع',
                                        style: TextStyle(fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'الديون',
                                        style: TextStyle(fontStyle: FontStyle.normal),
                                      ),
                                    ),    DataColumn(
                                      label: Text(
                                        'عدد الفواتير ',
                                        style: TextStyle(fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ],
                                  rows:rowsdata,dividerThickness: 3,
                                  horizontalMargin: 2,columnSpacing: 20,
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
                          ):labelxx=='user'||labelxx=='regoin'?
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0,right: 30,top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('عدد الفواتير',style: TextStyle(
                                    fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                                ),),
                                Text(
                                  listInvoicesAccept.length.toString(),style: TextStyle(
                                    fontFamily: kfontfamily2,fontWeight: FontWeight.bold
                                ),),
                              ],),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.8,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: listInvoicesAccept.length,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                      child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child:
                                          CardInvoiceClient(
                                            type: '',
                                            itemProd: listInvoicesAccept[index],
                                            //itemClient :  itemClient,

                                          )
                                      ));
                                }),
                          ),
                        ],
                      ):Container()
                        ] ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }


}
