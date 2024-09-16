import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/usertestmodel.dart';
import '../../../view_model/usertest_vm.dart';
import 'add_demo_user.dart';
import 'demo_user_details.dart';

class DemoUsersPage extends StatefulWidget {
  const DemoUsersPage({super.key});

  @override
  _DemoUsersPageState createState() => _DemoUsersPageState();
}

class _DemoUsersPageState extends State<DemoUsersPage> {
  List<UserTestModel> list_ticket = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<usertest_vm>(context, listen: false).getusertest_vm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list_ticket = Provider.of<usertest_vm>(context, listen: true).listProduct;

    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => AppNavigator.go(
          AddDemoUser(idregoin: null, nameusertest: ''),
          isNew: false,
        ),
        tooltip: 'إضافة',
        child: AppIcon(Icons.add),
      ),
      appBar: CustomAppBar(title: 'يوزرات تجريبية'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ModalProgressHUD(
          inAsyncCall:
              Provider.of<usertest_vm>(context, listen: true).isloading,
          child: AppPaginatedList(
            items: list_ticket,
            itemBuilder: (context, index) {
              return AppCardContainer(
                child: InkWell(
                  onTap: () => AppNavigator.go(
                    DemoUserDetails(userTestModel: list_ticket[index]),
                    isNew: false,
                  ),
                  child: AppText(
                    list_ticket[index].nameusertest,
                    fontSize: 18,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
