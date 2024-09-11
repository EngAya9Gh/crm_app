import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/screen/user/edit_profile.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/users_cubit.dart';
import '../widgets/user_avatar.dart';
import '../widgets/user_details.dart';
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

        return AppScaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: user.nameUser,
            actions: [
              IconButton(
                icon: const AppIcon(Icons.edit),
                onPressed: () => AppNavigator.go(
                  _navigateTo(context, user),
                  isNew: false,
                ),
              ),
            ],
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                UserAvatar(imageUrl: user.img_image.toString()),
                UserDetails(user: user),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navigateTo(BuildContext context, UserModel user) {
    return _hasAccessToEdit(context, user)
        ? ActionUserPage(userModel: user)
        : EditProfile();
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
