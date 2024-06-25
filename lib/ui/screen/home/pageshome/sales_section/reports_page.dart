import '../../widgethomeitem.dart';
import '../../../report/chartsales_regoin.dart';
import '../../../report/chartsales_user.dart';
import '../../../report/deptsales.dart';
import '../../../report/sales_reportstate.dart';
import '../../../report/salesproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

class reports_page extends StatefulWidget {
  const reports_page({Key? key}) : super(key: key);

  @override
  _reports_pageState createState() => _reports_pageState();
}

class _reports_pageState extends State<reports_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'احصائيات وتقارير',
          style: TextStyle(
            color: kWhiteColor,
            fontFamily: kfontfamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            context.read<PrivilegeCubit>().checkPrivilege('85') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => BarChartAPI()));
                    },
                    title: 'تقارير مبيعات الموظفين ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('86') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => BarChartregoinsales()));
                    },
                    title: ' تقارير مبيعات الفروع ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('88') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SalesProduct()));
                    },
                    title: ' تقارير مبيعات المنتجات ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('91') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => DeptSales()));
                    },
                    title: ' تقارير ديون العملاء ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('95') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SalesReportState()));
                    },
                    title: ' تقارير حالات العملاء ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),

            //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
