import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/custom_error_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/notifications/presentation/manager/notifications_cubit.dart';
import '../../../features/notifications/presentation/pages/notifications_page.dart';
import '../../../generated/assets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
    this.leading,
    this.backgroundColor,
  });

  final Widget? leading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<NotificationsCubit>();
    return AppBar(
      key: key,
      leading: leading,
      backgroundColor: backgroundColor,
      title: Image.asset(
        Assets.imagesLogoCrmLong,
        height: 50.scaleHeight,
        width: 160.scaleWidth,
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {
            _cubit.markNotificationsAsRead();
            AppNavigator.push(NotificationsPage());
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications,
                  size: (25.0).scaleFontSize,
                  color: AppColors.black,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: BlocBuilder<NotificationsCubit, NotificationsState>(
                  buildWhen: (previous, current) =>
                      _buildWhen(previous, current),
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _containerColor(state),
                      ),
                      width: (22.0).scaleWidth,
                      height: (22.0).scaleWidth,
                      child: Center(
                        child: state.getUnreadNotificationsCountStatus.when(
                          loading: () =>
                              AppLoader(size: (18.0).scaleFontSize, padding: 0),
                          success: (data) {
                            return AppText(
                              _cubit.pageVariables.unReadCount,
                              color: Colors.white,
                              fontSize: (14.0).scaleFontSize,
                            );
                          },
                          empty: () => SizedBox.shrink(),
                          failure: (error, data) => AppErrorWidget(
                            onPressed: () =>
                                _cubit.getUnreadNotificationsCount(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
      iconTheme: IconThemeData(size: 10),
      foregroundColor: AppColors.kWhiteColor,
    );
  }

  Color _containerColor(NotificationsState state) {
    if (state.getUnreadNotificationsCountStatus.isLoading() ||
        state.getUnreadNotificationsCountStatus.isEmpty()) {
      return Colors.transparent;
    }

    return Colors.red;
  }

  bool _buildWhen(NotificationsState previous, NotificationsState current) {
    return previous.getUnreadNotificationsCountStatus !=
            current.getUnreadNotificationsCountStatus ||
        previous.refreshUi != current.refreshUi;
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
