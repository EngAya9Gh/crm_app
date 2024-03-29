import 'package:crm_smart/features/communication_list/presentation/pages/communication_list_page.dart';
import 'package:crm_smart/ui/screen/care/care_clientaccept.dart';
import 'package:crm_smart/ui/screen/care/care_page_view.dart';
import 'package:crm_smart/ui/screen/care/view_installed.dart';
import 'package:crm_smart/ui/screen/care/view_welcome.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketclientview.dart';
import 'package:crm_smart/ui/screen/report/care_report.dart';
import 'package:crm_smart/ui/screen/report/not_using_system.dart';
import 'package:crm_smart/ui/screen/report/repeat_report.dart';
import 'package:crm_smart/ui/screen/report/report_rate.dart';
import 'package:crm_smart/ui/screen/report/wrong_number.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../widgethomeitem.dart';

class carepage extends StatefulWidget {
  const carepage({Key? key}) : super(key: key);

  @override
  _carepageState createState() => _carepageState();
}

class _carepageState extends State<carepage> {
  int lengthInstall = 0;
  int lengthWelcome = 0;
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _privilegeCubit = getIt<PrivilegeCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await    Provider.of<communication_vm>(context, listen: false)
      //      .getCommunicationall('');
      //
      Provider.of<communication_vm>(context, listen: false)
          .setvaluepriv(getIt<PrivilegeCubit>());
      //  Provider.of<ticket_vm>(context,listen: false)
      //      .getclientticket_filter('جديدة');
      // await Provider.of<communication_vm>(context, listen: false)
      //      .getCommunicationInstall(1);
      // await Provider.of<communication_vm>(context, listen: false)
      //      .getCommunicationWelcome();

//////////////////////////////////////////////
//       Provider.of<communication_vm>(
//           context, listen: false)
//           .getCommunicationInstallednumber();
//
//       Provider.of<communication_vm>(
//           context, listen: false)
//           .getCommunicationwelcomenumber();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 60)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'العناية بالعملاء',
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
            context.read<PrivilegeCubit>().checkPrivilege('44') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      //
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Care_ClientAccept()));
                    },
                    title: 'العملاء المشتركين')
                : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة

            context.read<PrivilegeCubit>().checkPrivilege('9') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => care_page_view()));
                    },
                    title: 'التواصل الدوري')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('137') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => CommunicationListPage()));
                    },
                    title: 'قائمة العملاء المميزين',
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('29') == true
                ? SelectCategory(
                    // subtitle:   Provider.of<communication_vm>(
                    //     context, listen: true).listwelcomenumber.length.toString(),
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => View_welcomeClient()));
                    },
                    title: 'الترحيب بالعملاء')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('30') == true
                ? SelectCategory(
                    // subtitle:
                    // Provider.of<communication_vm>(
                    //     context, listen: true).listinstallnumber.length.toString(),
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => View_installedClient()));

                      //الاتصال الثاني للجودة جديد
//View_installedClient
                    },
                    title: ' جودة التركيب والتدريب')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('33') == true
                ? SelectCategory(
                    // subtitle: Provider.of<ticket_vm>(context,listen: true)
                    //     .listticket_clientfilter.length.toString(),
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ticketclientview()));
                    },
                    title: 'تذاكر العملاء  ')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('102') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => care_report()));
                    },
                    title: 'تقرير العناية بالعملاء')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('103') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => report_rate()));
                    },
                    title: 'تقرير مستوى التقييم')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('104') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => repeat_report()));
                    },
                    title: AppStrings.labelRepeatComm)
                : Container(), //'تقرير الاتصال الدوري '
            context.read<PrivilegeCubit>().checkPrivilege('105') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => not_using_system()));
                    },
                    title: AppStrings.labelNotUse)
                : Container(), //' عملاء لا يستخدمون النظام '
            context.read<PrivilegeCubit>().checkPrivilege('106') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => wrong_number()));
                    },
                    title: AppStrings.labelWrongNumber)
                : Container(), //' عملاء أرقامهم خاطئة '
          ],
        ),
      ),
    );
  }
}
