import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../provider/config_vm.dart';
import '../../../../ui/screen/barnch_race/pages/branch_race_mangement_view.dart';
import '../../../../ui/screen/config/activity_view.dart';
import '../../../../ui/screen/config/chang_country.dart';
import '../../../../ui/screen/config/maincityview.dart';
import '../../../../ui/screen/config/manageview.dart';
import '../../../../ui/screen/config/regoin_view.dart';
import '../../../../ui/screen/config/reson_view.dart';
import '../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../ui/screen/product/productView.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../mangement/advanced_configs/presentation/pages/advanced_cofigs_page.dart';
import '../../../mangement/general_configs/presentation/pages/general_cofigs_page.dart';
import '../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../mangement/manage_privilege/presentation/pages/level_page.dart';
import '../../../mangement/manage_users/presentation/pages/manage_users_page.dart';
import '../../../mangement/manage_withdrawals/presentation/pages/manage_reject_reasons_page.dart';
import '../../../mangement/manage_withdrawals/presentation/pages/manage_withdrawals_page.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late PrivilegeCubit _privilegeCubit;

  @override
  void didChangeDependencies() async {
    context.read<config_vm>().getAllConfig();
    // Provider.of<config_vm>(context, listen: false).getAllConfig();

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _privilegeCubit = context.read<PrivilegeCubit>();

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
            color: AppColors.kWhiteColor,
            fontFamily: AppFonts.fontFamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kMainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            if (_privilegeCubit.checkPrivilege('3'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(ManageUserPage()),
                title: 'إدارة المستخدمين',
              ),
            if (_privilegeCubit.checkPrivilege('17') == true)
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(LevelPage()),
                title: 'إدارة الصلاحيات',
              ),
            if (_privilegeCubit.checkPrivilege('142'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(ManageWithdrawalsPage()),
                title: 'إدارة الإنسحابات',
              ),
            SelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () => AppNavigator.push(ManageRejectReasonsPage()),
              title: 'إدارة أسباب الاستبعاد',
            ),
            if (_privilegeCubit.checkPrivilege('4'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(ProductView()),
                title: 'المنتجات ',
              ),
            if (_privilegeCubit.checkPrivilege('52'))
              SelectCategory(
                subtitle: context.read<UserProvider>().currentUser.nameCountry,
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(change_country()),
                title: 'تغيير الدولة',
              ),
            if (_privilegeCubit.checkPrivilege('63'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(regoinview()),
                title: 'إداراة الفروع',
              ),
            if (_privilegeCubit.checkPrivilege('64'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(managview()),
                title: 'إضافة الإدارات',
              ),
            if (_privilegeCubit.checkPrivilege('73'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(resoan_view(type: 'client')),
                title: 'أسباب الانسحاب',
              ),
            if (_privilegeCubit.checkPrivilege('77'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(maincityview()),
                title: ' ادارة المناطق والمدن',
              ),
            if (_privilegeCubit.checkPrivilege('74'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(resoan_view(type: 'ticket')),
                title: 'أنواع التذاكر',
              ),
            SelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () => AppNavigator.push(activity_view(type: 'ticket')),
              title: 'أنواع النشاط',
            ),
            if (_privilegeCubit.checkPrivilege('149'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(BranchRaceManagementView()),
                title: "سباق الفروع",
              ),
            if (_privilegeCubit.checkPrivilege('215'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(AdvancedCofigsPage()),
                title: 'الإعدادات المتقدمة',
              ),
            if (_privilegeCubit.checkPrivilege('216'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(GeneralCofigsPage()),
                title: 'الاعدادات العامة',
              ),
          ],
        ),
      ),
    );
  }
}
