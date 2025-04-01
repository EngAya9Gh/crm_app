import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/file_model.dart';
import '../../../core/common/widgets/files/app_platform_image.dart';
import '../../../core/common/widgets/profile/profile_info_item.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/app_card_row.dart';
import 'edit_profile.dart';
import 'edituser.dart';

class UserScreen extends StatefulWidget {
  final UserModel user;
  final String? ismyprofile;

  const UserScreen({
    super.key,
    this.ismyprofile,
    required this.user,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryMain,
        elevation: 0,
        centerTitle: true,
        actions: [
          widget.ismyprofile != null
              ? IconButton(
                  onPressed: () => AppNavigator.go(
                        EditProfile(),
                        isNew: false,
                      ),
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.white,
                  ))
              : context.read<PrivilegesCubit>().checkPrivilege('50')
                  ? IconButton(
                      onPressed: () => AppNavigator.go(
                            EditUser(userModel: widget.user),
                            isNew: false,
                          ),
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.white,
                      ))
                  : Container(),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userVm, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryMain,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 80, top: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: kIsWeb
                                ? Image.network(
                                    userVm.currentUser.path ?? '',
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.person,
                                        size: 50,
                                        color: Colors.lightBlueAccent,
                                      );
                                    },
                                  )
                                : AppPlatformImage(
                                    fileModel: FileModel(
                                      path: userVm.currentUser.path,
                                      url: userVm.currentUser.img_image,
                                    ),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        SizedBox(height: 15),
                        AppText(
                          userVm.currentUser.nameUser.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -40),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ProfileInfoItem(
                              icon: Icons.email_outlined,
                              title: 'البريد الإلكتروني',
                              value: userVm.currentUser.email.toString(),
                            ),
                            Divider(height: 30),
                            ProfileInfoItem(
                              icon: Icons.phone_outlined,
                              title: 'رقم الهاتف',
                              value: userVm.currentUser.mobile.toString(),
                            ),
                            Divider(height: 30),
                            ProfileInfoItem(
                              icon: Icons.business_outlined,
                              title: 'القسم',
                              value: userVm.currentUser.name_mange.toString(),
                            ),
                            Divider(height: 30),
                            ProfileInfoItem(
                              icon: Icons.location_city_outlined,
                              title: 'الفرع',
                              value: userVm.currentUser.nameRegoin.toString() ==
                                      "null"
                                  ? ""
                                  : userVm.currentUser.nameRegoin.toString(),
                            ),
                            Divider(height: 30),
                            ProfileInfoItem(
                              icon: Icons.grade_outlined,
                              title: 'المستوى',
                              value: userVm.currentUser.name_level.toString(),
                            ),
                            Divider(height: 30),
                            ProfileInfoItem(
                              icon: Icons.check_circle_outline,
                              title: 'الحالة',
                              value: userVm.currentUser.isActive == "1"
                                  ? 'نشط'
                                  : 'غير نشط',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
