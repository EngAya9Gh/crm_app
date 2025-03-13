import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/config/navigator/app_routes_names.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/notifications/presentation/manager/notifications_cubit.dart';
import '../../../features/notifications/presentation/pages/notifications_page.dart';
import '../../../features/versions/presentation/pages/versions_page.dart';
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
            AppNavigator.go(
              VersionsPage(),
              name: AppRoutesNames.generalRoutes.versions,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.browser_updated_outlined,
              size: (25.0).scaleFontSize,
              color: AppColors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.go(
              NotificationsPage(),
              isNew: false,
            );
            _cubit.markNotificationsAsRead();
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
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _containerColor(context, state),
                      ),
                      width: (22.0).scaleWidth,
                      height: (22.0).scaleWidth,
                      child: Center(
                        child: state.getUnreadNotificationsCountStatus.when(
                          loading: () => AppLoader(size: (18.0).scaleFontSize, padding: 0),
                          success: (data) {
                            return AppText(
                              _cubit.pageVariables.unReadCount > 99 ? '99' : _cubit.pageVariables.unReadCount.toString(),
                              color: Colors.white,
                              fontSize: (14.0).scaleFontSize,
                            );
                          },
                          empty: () => SizedBox.shrink(),
                          failure: (error, data) => SizedBox.shrink(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
           // AppNavigator.go(
            // NotificationsPage(),
            // isNew: false,
            // );
            // _cubit.markNotificationsAsRead();
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.comment,
                  size: (25.0).scaleFontSize,
                  color: AppColors.black,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: BlocBuilder<NotificationsCubit, NotificationsState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _containerColor(context, state),
                      ),
                      width: (22.0).scaleWidth,
                      height: (22.0).scaleWidth,
                      child: Center(
                        child: state.getUnreadNotificationsCountStatus.when(
                          loading: () => AppLoader(size: (18.0).scaleFontSize, padding: 0),
                          success: (data) {
                            return AppText(
                              0.toString(),
                              color: Colors.white,
                              fontSize: (14.0).scaleFontSize,
                            );
                          },
                          empty: () => SizedBox.shrink(),
                          failure: (error, data) => SizedBox.shrink(),
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
      foregroundColor: AppColors.white,
    );
  }

  Color _containerColor(BuildContext context, NotificationsState state) {
    if (state.getUnreadNotificationsCountStatus.isLoading() ||
        state.getUnreadNotificationsCountStatus.isEmpty() ||
        state.markNotificationsAsReadStatus.isLoading() ||
        state.markNotificationsAsReadStatus.isSuccess()) {
      return Colors.transparent;
    }

    return Colors.red;
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
