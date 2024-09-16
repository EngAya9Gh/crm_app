import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/usertestmodel.dart';
import 'add_demo_user.dart';

class DemoUserDetails extends StatelessWidget {
  DemoUserDetails({required this.userTestModel, Key? key}) : super(key: key);
  UserTestModel userTestModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: userTestModel.nameusertest.toString(),
        actions: [
          IconButton(
            onPressed: () => AppNavigator.go(
              AddDemoUser(
                idregoin: userTestModel.id_usertest,
                nameusertest: userTestModel.nameusertest,
                des_usertest: userTestModel.des_usertest,
              ),
              isNew: false,
            ),
            icon: AppIcon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AppText(userTestModel.des_usertest),
                10.height,
                AppElevatedButton(
                  text: 'نسخ البيانات ورابط الدخول',
                  width: double.infinity,
                  onPressed: () async => HelperFunctions.copyToClipboard(
                      userTestModel.des_usertest.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
