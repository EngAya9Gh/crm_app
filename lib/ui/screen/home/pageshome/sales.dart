import 'package:crm_smart/ui/screen/client/Acceptpage.dart';
import 'package:crm_smart/ui/screen/client/approve_type_user.dart';
import 'package:crm_smart/ui/screen/client/approvefinance_approve.dart';
import 'package:crm_smart/ui/screen/client/outClient.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/report/chartsales_regoin.dart';
import 'package:crm_smart/ui/screen/report/chartsales_user.dart';
import 'package:crm_smart/ui/screen/report/deptsales.dart';
import 'package:crm_smart/ui/screen/report/sales_reportstate.dart';
import 'package:crm_smart/ui/screen/report/salesproduct.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../client/agents_distributors_invoices_view.dart';
import '../../client/calender_client.dart';
import '../../client/marketing/getLastCommentClient.dart';

class sales extends StatefulWidget {
  const sales({Key? key}) : super(key: key);

  @override
  _salesState createState() => _salesState();
}

class _salesState extends State<sales> {
  bool checkvalue = false;

  @override
  void didChangeDependencies() async {
    // Future.delayed(Duration(milliseconds: 3)).then((_) async {
    //   //checkvalue = await privilge.checkprivlge('8');
    //  // print(checkvalue);
    // });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Provider.of<privilge_vm>(context, listen: false).getprivlg_usercurrent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'المبيعات',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body:
          // Consumer<privilge_vm>(
          // builder: (context, privilge, child){
          Padding(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('36') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => tabclients()));
                      },
                      title: ' قائمة العملاء')
                  : Container(),
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('39') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => AgentsDistributorsInvoicesView()));
                      },
                      title: 'فواتير العملاء')
                  : Container(),

              Provider.of<privilge_vm>(context,listen: true).checkprivlge('119') == true?
              buildSelectCategory(
                  colorbag: Colors.white,
                  colortitle: Colors.black,
                  colorarrow: Colors.black,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context)=>
                            getLastCommentClient()
                    ));
                  },
                  title: 'آخر تحديثات العملاء'):Container()
              ,
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('39') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    invoicesAcceptclient() //AcceptPage()   // support_view(type: 'client',)
                                ));
                      },
                      title: 'ديون العملاء')
                  : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('120') == true
                  ? buildSelectCategory(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => calender_client()));
                      },
                      title: 'جدول زيارات العميل ',
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                    )
                  : Container(),

              buildSelectCategory(
                  colorbag: Colors.white,
                  colortitle: Colors.black,
                  colorarrow: Colors.black,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => TransferPage() //AcceptPage()   // support_view(type: 'client',)
                            ));
                  },
                  title: 'موافقات تحويل العملاء'), //تاريخ الفاتورة جنبو اسم المؤسسة

              Provider.of<privilge_vm>(context, listen: true).checkprivlge('40') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ApprovePage()));
                      },
                      title: ' طلبات موافقة المشرفين ')
                  : Container(),

              Provider.of<privilge_vm>(context, listen: true).checkprivlge('111') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ApproveFinancePage()));
                      },
                      title: ' طلبات اعتماد المالية ')
                  : Container(),

              Provider.of<privilge_vm>(context, listen: true).checkprivlge('85') == true
                  ? buildSelectCategory(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => BarChartAPI()));
                      },
                      title: 'تقارير مبيعات الموظفين ',
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                    )
                  : Container(),

              Provider.of<privilge_vm>(context, listen: true).checkprivlge('86') == true
                  ? buildSelectCategory(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => BarChartregoinsales()));
                      },
                      title: ' تقارير مبيعات الفروع ',
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                    )
                  : Container(),
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('88') == true
                  ? buildSelectCategory(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => salesproduct()));
                      },
                      title: ' تقارير مبيعات المنتجات ',
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                    )
                  : Container(),
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('91') == true
                  ? buildSelectCategory(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => deptsales()));
                      },
                      title: ' تقارير ديون العملاء ',
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                    )
                  : Container(),
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('95') == true
                  ? buildSelectCategory(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => sales_reportstate()));
                      },
                      title: ' تقارير حالات العملاء ',
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                    )
                  : Container(),

              Provider.of<privilge_vm>(context, listen: true).checkprivlge('14') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => deletedinvoice()));
                      },
                      title: 'الفواتير المحذوفة')
                  : Container(),
              Provider.of<privilge_vm>(context, listen: true).checkprivlge('143') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => WithdrawalsInvoicesPage()));
                      },
                      title: 'إدارة الفواتير المنسحبة',
                    )
                  : SizedBox.shrink(),

              Provider.of<privilge_vm>(context, listen: true).checkprivlge('35') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => OutClient() //AcceptPage()   // support_view(type: 'client',)
                                ));
                      },
                      title: 'الفواتير المنسحبة')
                  : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة
            ],
          ),
        ),
      ),
      // },),
    );
  }
}
