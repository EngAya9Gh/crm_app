import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/usermodel.dart';
import '../manager/users_cubit.dart';
import '../widgets/UserProfileBody.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    this.userModel,
    required this.id,
  });

  final UserModel? userModel;
  final String id;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late final _cubit;

  @override
  void initState() {
    _cubit = context.read<UsersCubit>();

    if (widget.userModel != null) {
      _cubit.storeCurrentUser(widget.userModel!);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.userModel == null) {
        _cubit.getUserById(widget.id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final user = widget.userModel ?? state.currentUser;
        return state.getUserByIdStatus.when(
          failure: (error, data) {
            return AppErrorWidget(
              message: error,
              onPressed: () => _cubit.getUserById(widget.id),
            );
          },
          success: (data) {
            return UserProfileBody(userModel: user!);
          },
        );
      },
    );
  }
}
