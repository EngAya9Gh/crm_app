import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/shimmer_widget.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/config/navigator/app_routes_names.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/notifications/presentation/manager/notifications_cubit.dart';
import '../../../features/notifications/presentation/pages/notifications_page.dart';
import '../../../features/versions/presentation/pages/versions_page.dart';
import '../../../generated/assets.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
    this.leading,
    this.backgroundColor,
  });

  final Widget? leading;
  final Color? backgroundColor;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _HomeAppBarState extends State<HomeAppBar> {
  late final comment_vm comment;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      comment = await Provider.of<comment_vm>(context, listen: false)
        ..getCommentMentions();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<NotificationsCubit>();
    return AppBar(
      key: widget.key,
      leading: widget.leading,
      backgroundColor: widget.backgroundColor,
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
                child: Consumer<UserProvider>(
                  builder: (context, value, child) {
                    return (value.currentUser.notificationNotRead ?? 0) == 0
                        ? SizedBox.shrink()
                        : Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.statusErrorActive,
                            ),
                            width: (22.0).scaleWidth,
                            height: (22.0).scaleWidth,
                            child: Center(
                                // child: state.getUnreadNotificationsCountStatus.when(
                                // loading: () =>
                                // AppLoader(size: (18.0).scaleFontSize, padding: 0),
                                // success: (data) {
                                // return
                                child: AppText(
                              (value.currentUser.notificationNotRead ?? 0) > 99 ? '99' : (value.currentUser.notificationNotRead ?? 0).toString(),
                              color: Colors.white,
                              fontSize: (14.0).scaleFontSize,
                            )
                                // },
                                // empty: () => SizedBox.shrink(),
                                // failure: (error, data) => SizedBox.shrink(),
                                // ),
                                ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
        8.width,
        if ((Provider.of<UserProvider>(context, listen: true).currentUser.noOfMentions ?? 0) != 0) ...{
          Stack(clipBehavior: Clip.none, children: [
            PopupMenuButton(
              offset: Offset(0, 10),
              constraints: BoxConstraints(
                  // Set the width to match screen width
                  minWidth: 420.scaleWidth,
                  maxWidth: 520.scaleWidth,
                  maxHeight: 600.scaleHeight),
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Transform.translate(
                offset: Offset(0, 2),
                child: Icon(
                  Icons.comment,
                  size: (25.0).scaleFontSize,
                ),
              ),
              itemBuilder: (context) => List.generate(
                  comment.commentMention.length,
                  (index) => PopupMenuItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ClientProfile(
                                      tabIndex: 2,
                                      idClient: comment.commentMention[index].fkClient,
                                      commentId: comment.commentMention[index].idComment,
                                      // idclient:data==null?datanotify: data['paramId'],
                                    )));
                      },
                      enabled: true,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Cardcomment(
                          fromMenu: true,
                          commentmodel: comment.commentMention[index],
                        ),
                      ))),
            ),
            Positioned(
                right: -9,
                top: -9,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    width: (22.0).scaleWidth,
                    height: (22.0).scaleWidth,
                    child: Center(
                      child: AppText(
                        "${Provider.of<UserProvider>(context, listen: true).currentUser.noOfMentions}",
                        color: Colors.white,
                        fontSize: (14.0).scaleFontSize,
                      ),
                    ))),
          ]),
          10.width,
        }
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
}
