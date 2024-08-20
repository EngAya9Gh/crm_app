import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../ui/screen/report/not_using_system.dart';
import '../../../../ui/screen/report/repeat_report.dart';
import '../../../../ui/screen/report/wrong_number.dart';
import '../../../../view_model/communication_vm.dart';
import '../../../clients_care/accept_clients/presentation/pages/clients_accept_page.dart';
import '../../../clients_care/clients_care_reports/presentation/pages/clients_care_reports_page.dart';
import '../../../clients_care/clients_tickets/presentation/pages/clients_tickets_page.dart';
import '../../../clients_care/evaluation_level_report/presentation/pages/evaluation_level_report_page.dart';
import '../../../clients_care/greeting_communication/presentation/pages/greeting_communication_page.dart';
import '../../../clients_care/install_quality/presentation/pages/install_quality_page.dart';
import '../../../clients_care/periodic_communication/presentation/pages/periodic_communication_page.dart';
import '../../../clients_care/previous_ratings/presentation/pages/previous_ratings_page.dart';
import '../../../clients_care/special_clients/presentation/pages/special_clients_page.dart';
import '../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

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
      Provider.of<CommunicationVm>(context, listen: false)
          .setvaluepriv(getIt<PrivilegeCubit>());
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
            if (context.read<PrivilegeCubit>().checkPrivilege('44'))
              SelectCategory(
                onTap: () => AppNavigator.push(ClientsAcceptPage()),
                title: 'العملاء المشتركين',
              ),

            context.read<PrivilegeCubit>().checkPrivilege('137') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SpecialClientsPage()));
                    },
                    title: 'قائمة العملاء المميزين',
                  )
                : Container(),

            if (context.read<PrivilegeCubit>().checkPrivilege('29'))
              SelectCategory(
                onTap: () => AppNavigator.push(GreetingCommunicationPage()),
                title: 'الترحيب بالعملاء',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('30'))
              SelectCategory(
                onTap: () => AppNavigator.push(InstallQualityPage()),
                title: 'جودة التركيب والتدريب',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('9') == true)
              SelectCategory(
                onTap: () => AppNavigator.push(PeriodicCommunicationPage()),
                title: 'التواصل الدوري',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('30'))
              SelectCategory(
                onTap: () => AppNavigator.push(PreviousRatingsPage()),
                title: 'تقرير إعادة التقييم',
              ),

            context.read<PrivilegeCubit>().checkPrivilege('33') == true
                ? SelectCategory(
                    // subtitle: Provider.of<ticket_vm>(context,listen: true)
                    //     .listticket_clientfilter.length.toString(),

                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ClientsTicketsPage()));
                    },
                    title: 'تذاكر العملاء  ')
                : Container(),

            if (context.read<PrivilegeCubit>().checkPrivilege('102'))
              SelectCategory(
                onTap: () => AppNavigator.push(ClientsCareReportsPage()),
                title: 'تقرير العناية بالعملاء',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('103'))
              SelectCategory(
                onTap: () => AppNavigator.push(EvaluationLevelReportPage()),
                title: 'تقرير مستوى التقييم',
              ),

            context.read<PrivilegeCubit>().checkPrivilege('104') == true
                ? SelectCategory(
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
