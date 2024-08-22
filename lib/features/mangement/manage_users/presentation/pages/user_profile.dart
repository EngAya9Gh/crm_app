import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/screen/user/editprofile.dart';
import '../../../../../ui/widgets/container_boxShadows.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../../ui/widgets/custom_widget/text_uitil.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/users_cubit.dart';
import 'action_user_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key, required this.userModel});

  final UserModel userModel;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => AppNavigator.pop(),
            ),
            actions: [
              _BuildEditIconButton(
                onPressed: () {
                  final widget = _hasAccessToEdit(context, user)
                      ? ActionUserPage(userModel: user)
                      : edit_profile();
                  AppNavigator.push(widget);
                },
              ),
            ],
            title: TextUtilis(
              color: Colors.white,
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
              textstring: user.nameUser.toString(),
              underline: TextDecoration.none,
            ),
            backgroundColor: AppColors.kMainColor,
            centerTitle: true,
            elevation: 0,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                _userAvatar(user),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        _buildInfoCard(
                          title: 'الإدارات',
                          value: user.name_mange,
                        ),
                        10.verticalSpace,
                        _buildInfoCard(
                          title: 'الفرع',
                          value: user.nameRegoin,
                        ),
                        10.verticalSpace,
                        _buildInfoCard(
                          title: 'المستوى',
                          value: user.name_level,
                        ),
                        10.verticalSpace,
                        _buildInfoCard(
                          title: 'الحالة',
                          value: user.isActive == "1" ? 'نشط' : 'غير نشط',
                        ),
                        10.verticalSpace,
                        _buildInfoCard(
                          title: 'البريد الإلكتروني',
                          value: user.email.toString(),
                        ),
                        10.verticalSpace,
                        InkWell(
                          onTap: () async {
                            await FlutterPhoneDirectCaller.callNumber(
                                user.mobile.toString());
                          },
                          child: _buildInfoCard(
                            title: 'الهاتف',
                            value: user.mobile.toString(),
                          ),
                        ),
                        10.verticalSpace,
                        _buildInfoCard(
                          title: 'تمت الإضافة من قبل',
                          value: (user.nameuserAdd.toString()),
                        ),
                        10.verticalSpace,
                        _buildInfoCard(
                          title: 'تاريخ الإضافة',
                          value: user.created_at.toString(),
                        ),
                        10.verticalSpace,
                        if (user.nameuserupdate != null) ...[
                          _buildInfoCard(
                            title: 'تم التعديل من قبل',
                            value: (user.nameuserupdate.toString()),
                          ),
                          10.verticalSpace,
                          _buildInfoCard(
                            title: 'تاريخ التعديل',
                            value: user.updated_at.toString(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ContainerShadows _buildInfoCard({
    required String title,
    String? value,
  }) {
    return ContainerShadows(
      margin: EdgeInsets.zero,
      child: CardRow(
        title: title,
        value: value,
        withDivider: false,
        showEmpty: true,
      ),
    );
  }

  Padding _userAvatar(UserModel user) {
    return Padding(
      padding: REdgeInsets.only(top: 20, bottom: 5),
      child: CircleAvatar(
          radius: 60.0,
          child: user.img_image!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    width: 500,
                    height: 500,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl: user.img_image!,
                  ),
                )
              : Text(user.nameUser.toString().substring(0, 1))),
    );
  }

  bool _hasAccessToEdit(BuildContext context, UserModel user) {
    return (context.read<PrivilegeCubit>().checkPrivilege('50') &&
            (user.typeLevel ==
                    context.read<UserProvider>().currentUser.typeLevel &&
                int.parse(context
                        .read<UserProvider>()
                        .currentUser
                        .priority
                        .toString()) ==
                    int.parse(user.priority.toString()))) ||
        (context.read<PrivilegeCubit>().checkPrivilege('180') &&
            int.parse(context
                    .read<UserProvider>()
                    .currentUser
                    .priority
                    .toString()) <=
                int.parse(user.priority.toString()));
  }
}

class _BuildEditIconButton extends StatelessWidget {
  const _BuildEditIconButton({
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.edit,
          color: AppColors.kWhiteColor,
        ));
  }
}
