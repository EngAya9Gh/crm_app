import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/profile/profile_info_item.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/screen/user/edit_profile.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/users_cubit.dart';
import '../pages/action_user_page.dart';
import '../widgets/user_avatar.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  @override
  void initState() {
    context.read<UsersCubit>().storeCurrentUser(widget.userModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final user = state.currentUser!;
        return AppScaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
              title: '',
              backgroundColor: Theme.of(context).primaryColor,
              //elevation: 0,
            actions: [
              IconButton(
                icon: const AppIcon(Icons.edit),
                onPressed: () => buildGo(user),
              ),
            ],
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
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
                              child: UserAvatar(
                                  imageUrl: user.img_image.toString()),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            user.nameUser ?? '',
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
                                value: user.email.toString(),
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.phone_outlined,
                                title: 'رقم الهاتف',
                                value: user.mobile.toString(),
                                onTap: () async {
                                  await HelperFunctions.urlLauncherPhone(
                                      user.mobile.toString());
                                },
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.business_outlined,
                                title: 'الإدارات',
                                value: user.name_mange ?? '',
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.location_city_outlined,
                                title: 'الفرع',
                                value: user.nameRegoin ?? '',
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.grade_outlined,
                                title: 'المستوى',
                                value: user.name_level ?? '',
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.check_circle_outline,
                                title: 'الحالة',
                                value: user.isActive == "1" ? 'نشط' : 'غير نشط',
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.person_add_outlined,
                                title: 'تمت الإضافة من قبل',
                                value: user.nameuserAdd.toString(),
                              ),
                              Divider(height: 30),
                              ProfileInfoItem(
                                icon: Icons.calendar_today_outlined,
                                title: 'تاريخ الإضافة',
                                value: user.created_at.toString(),
                              ),
                              if (user.nameuserupdate != null) ...[
                                Divider(height: 30),
                                ProfileInfoItem(
                                  icon: Icons.edit_outlined,
                                  title: 'تم التعديل من قبل',
                                  value: user.nameuserupdate.toString(),
                                ),
                                Divider(height: 30),
                                ProfileInfoItem(
                                  icon: Icons.update_outlined,
                                  title: 'تاريخ التعديل',
                                  value: user.updated_at.toString(),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
            ));
      },
    );
  }

  Future<dynamic> buildGo(UserModel user) {
    if (_hasAccessToEdit(context, user)) {
      return AppNavigator.go(
        ActionUserPage(user: user, userId: user.id),
        name: AppRoutesNames.managementInternalRoutes.editUser,
        pathParameters: {'id': user.id},
        extra: {'user': user},
      );
    }
    return AppNavigator.go(EditProfile(), isNew: false);
  }

  bool _hasAccessToEdit(BuildContext context, UserModel user) {
    final currentUser = AppConstants.currentUser;
    final privilegeCubit = context.read<PrivilegesCubit>();

    final currentUserPriority = int.tryParse(currentUser.priority ?? '0') ?? 0;
    final userPriority = int.tryParse(user.priority ?? '0') ?? 0;
    final hasPrivilege50 = privilegeCubit.checkPrivilege('50');
    final hasPrivilege180 = privilegeCubit.checkPrivilege('180');

    final sameTypeLevel = user.typeLevel == currentUser.typeLevel;

    final samePriority = currentUserPriority == userPriority;
    final lowerOrEqualPriority = currentUserPriority <= userPriority;

    return (hasPrivilege50 && sameTypeLevel && samePriority) ||
        (hasPrivilege180 && lowerOrEqualPriority);
  }
}
