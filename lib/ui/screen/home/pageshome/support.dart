import 'package:crm_smart/ui/screen/client/client_accept.dart';
import 'package:crm_smart/ui/screen/client/client_wating.dart';
import 'package:crm_smart/ui/screen/report/delayafterinstall.dart';
import 'package:crm_smart/ui/screen/report/delayinstall.dart';
import 'package:crm_smart/ui/screen/report/support_intall_report.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/communication_list/presentation/pages/communication_list_page.dart';
import '../widgethomeitem.dart';

class supportpage extends StatefulWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  _supportpageState createState() => _supportpageState();
}

class _supportpageState extends State<supportpage> {
  @override
  void didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 3)).then((_) async {
      Provider.of<PrivilegeProvider>(context, listen: false).getPrivilegeUserCurrent();
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<maincity_vm>(context, listen: false).getmaincity();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'الدعم الفني',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Consumer<PrivilegeProvider>(builder: (context, privilge, child) {
          return Column(
            children: [
              // buildSelectCategory(onTap: () {
              //   Navigator.push(context, CupertinoPageRoute(
              //       builder: (context)=>
              //           TaskWidget()));
              //
              // }, title: 'Task'),

              privilge.checkPrivilege('19') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        //
                        Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => ClientAccept() // support_view(type: 'only',)
                                ));
                      },
                      title: 'العملاء المشتركين')
                  : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة
              privilge.checkPrivilege('34') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ClientWaiting(
                                      type_card: 'support',
                                    ) // support_view(type: 'only',)
                                ));
                      },
                      title: 'فواتير العملاء')
                  : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة

              Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('137') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => CommunicationListPage()));
                      },
                      title: 'قائمة العملاء المميزين',
                    )
                  : Container(),

              privilge.checkPrivilege('18') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => support_table()));
                      },
                      title: 'جدول التركيب للعملاء')
                  : Container(),
              privilge.checkPrivilege('99') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => support_install_report()));
                      },
                      title: 'تقرير التركيب للعملاء')
                  : Container(),

              // buildSelectCategory(
              //     colorbag: Colors.white,
              //     colortitle: Colors.black,
              //     colorarrow: Colors.black,
              //     onTap: () {
              //    Navigator.push(context, CupertinoPageRoute(
              //        builder: (context)=>
              //            waiting_report()));
              //  }, title: 'تقرير عملاء الانتظار') ,
              privilge.checkPrivilege('100') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => delayinstall()));
                      },
                      title: 'تقرير التأخير عن الجدولة للعملاء')
                  : Container(),

              privilge.checkPrivilege('101') == true
                  ? buildSelectCategory(
                      colorbag: Colors.white,
                      colortitle: Colors.black,
                      colorarrow: Colors.black,
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => delayafterinstall()));
                      },
                      title: 'تقرير التأخير عن التركيب للعملاء')
                  : Container(),
              // buildSelectCategory(onTap: () {
              //   //
              //   Navigator.push(context, CupertinoPageRoute(
              //       builder: (context)=>
              //           support_table()));
              // }, title: 'جدول العملاء'),
            ],
          );
        }),
      ),
    );
  }
}
