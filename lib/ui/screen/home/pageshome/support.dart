import 'package:crm_smart/ui/screen/client/client_accept.dart';
import 'package:crm_smart/ui/screen/client/client_wating.dart';
import 'package:crm_smart/ui/screen/report/delayafterinstall.dart';
import 'package:crm_smart/ui/screen/report/delayinstall.dart';
import 'package:crm_smart/ui/screen/report/support_intall_report.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../widgethomeitem.dart';

class supportpage extends StatefulWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  _supportpageState createState() => _supportpageState();
}

class _supportpageState extends State<supportpage> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<MainCityProvider>(context, listen: false).getmaincity();
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
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // buildSelectCategory(onTap: () {
            //   Navigator.push(context, CupertinoPageRoute(
            //       builder: (context)=>
            //           TaskWidget()));
            //
            // }, title: 'Task'),

            context.read<PrivilegeCubit>().checkPrivilege('19')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      //
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  ClientAccept() // support_view(type: 'only',)
                              ));
                    },
                    title: 'العملاء المشتركين')
                : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة
            context.read<PrivilegeCubit>().checkPrivilege('34')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ClientWaiting(
                                    typeCard: 'support',
                                  ) // support_view(type: 'only',)
                              ));
                    },
                    title: 'فواتير العملاء')
                : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة

            // Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('137')
            //     ? buildSelectCategory(
            //         colorbag: Colors.white,
            //         colortitle: Colors.black,
            //         colorarrow: Colors.black,
            //         onTap: () {
            //           Navigator.push(context, CupertinoPageRoute(builder: (context) => CommunicationListPage()));
            //         },
            //         title: 'قائمة العملاء المميزين',
            //       )
            //     : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('18')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => support_table()));
                    },
                    title: 'جدول التركيب للعملاء')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('99')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => support_install_report()));
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
            context.read<PrivilegeCubit>().checkPrivilege('100')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => delayinstall()));
                    },
                    title: 'تقرير التأخير عن الجدولة للعملاء')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('101')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => delayafterinstall()));
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
        ),
      ),
    );
  }
}
