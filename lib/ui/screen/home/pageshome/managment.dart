import 'package:crm_smart/features/manage_privilege/presentation/pages/level_page.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/screen/config/activity_view.dart';
import 'package:crm_smart/ui/screen/config/chang_country.dart';
import 'package:crm_smart/ui/screen/config/config_view.dart';
import 'package:crm_smart/ui/screen/config/maincityview.dart';
import 'package:crm_smart/ui/screen/config/manageview.dart';
import 'package:crm_smart/ui/screen/config/regoin_view.dart';
import 'package:crm_smart/ui/screen/config/reson_view.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../features/manage_users/presentation/pages/manage_users_page.dart';
import '../../../../features/manage_withdrawals/presentation/pages/manage_reject_reasons_page.dart';
import '../../../../features/manage_withdrawals/presentation/pages/manage_withdrawals_page.dart';
import '../../barnch_race/pages/branch_race_mangement_view.dart';
import '../widgethomeitem.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late PrivilegeCubit _privilegeCubit;

  @override
  void didChangeDependencies() async {
    Provider.of<config_vm>(context, listen: false).getAllConfig();

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _privilegeCubit = getIt<PrivilegeCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'الإدارة',
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
            _privilegeCubit.checkPrivilege('3') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ManageUserPage()));
                    },
                    title: 'إدارة المستخدمين')
                : Container(),
            _privilegeCubit.checkPrivilege('17') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LevelPage()));
                    },
                    title: 'إدارة الصلاحيات')
                : Container(),
            _privilegeCubit.checkPrivilege('142') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ManageWithdrawalsPage()));
                    },
                    title: 'إدارة الإنسحابات')
                : SizedBox.shrink(),
            SelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ManageRejectReasonsPage()));
              },
              title: 'إدارة أسباب الاستبعاد',
            ),
            // buildSelectCategory(
            //   colorbag: Colors.white,
            //   colortitle: Colors.black,
            //   colorarrow: Colors.black,
            //   onTap: () {
            //     Navigator.push(context,
            //         CupertinoPageRoute(builder: (context) =>
            //             ManageLinkPage()));
            //   },
            //   title: 'الروابط الهامة',
            // ),
            _privilegeCubit.checkPrivilege('4') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => ProductView(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    title: 'المنتجات ')
                : Container(),
            _privilegeCubit.checkPrivilege('20') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => config_view(),
                        ),
                      );
                    },
                    title: 'ملف الإعدادات ')
                : Container(),
            _privilegeCubit.checkPrivilege('52') == true
                ? SelectCategory(
                    subtitle: Provider.of<UserProvider>(context, listen: false)
                        .currentUser
                        .nameCountry,
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => change_country(),
                        ),
                      );
                    },
                    title: 'تغيير الدولة')
                : Container(),
            _privilegeCubit.checkPrivilege('63') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => regoinview(),
                        ),
                      );
                    },
                    title: 'إداراة الفروع')
                : Container(),
            _privilegeCubit.checkPrivilege('64') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => managview(),
                        ),
                      );
                    },
                    title: 'إضافة الإدارات')
                : Container(),
            _privilegeCubit.checkPrivilege('73') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              resoan_view(type: 'client'),
                        ),
                      );
                    },
                    title: 'أسباب الانسحاب')
                : Container(),
            _privilegeCubit.checkPrivilege('77') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) => maincityview(),
                        ),
                      );
                    },
                    title: ' ادارة المناطق والمدن')
                : Container(),
            _privilegeCubit.checkPrivilege('74') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              resoan_view(type: 'ticket'),
                        ),
                      );
                    },
                    title: 'أنواع التذاكر')
                : Container(),
            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          activity_view(type: 'ticket'),
                    ),
                  );
                },
                title: 'أنواع النشاط'),

            // _privilegeCubit.checkPrivilege('113') == true
            //     ? buildSelectCategory(
            //         colorbag: Colors.white,
            //         colortitle: Colors.black,
            //         colorarrow: Colors.black,
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             CupertinoPageRoute<void>(
            //               builder: (BuildContext context) => participate_view(),
            //             ),
            //           );
            //         },
            //         title: 'المتعاونين')
            //     : Container(),

            _privilegeCubit.checkPrivilege('149') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              BranchRaceManagementView(),
                        ),
                      );
                    },
                    title: "سباق الفروع",
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
