import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_copyrights_widget.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/app_dynamic_links.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../widgets/drawer_expansion_tile.dart';

class WebHomePage extends StatefulWidget {
  WebHomePage({super.key});

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  List<SectionModel> selectedSubSections = SectionsLists.salesSections;

  late final NotificationsCubit _notificationsCubit;

  @override
  void initState() {
    super.initState();
    _notificationsCubit = context.read<NotificationsCubit>()..init();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        String typeNotify = message.data['Typenotify'];
        AppDynamicLinks.routeNotifyTo(typeNotify, context, message.data, null);
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {}
      _notificationsCubit.increaseNotificationCount();
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _notificationsCubit.increaseNotificationCount();
      String typeNotify = event.data['Typenotify'];
      AppDynamicLinks.routeNotifyTo(typeNotify, context, event.data, null);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        Provider.of<RegionProvider>(context, listen: false).getRegions(),
        Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        Provider.of<ClientTypeProvider>(context, listen: false)
            .getreasons('ticket'),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Row(
        children: [
          Container(
            width: 400.scaleWidth,
            height: double.infinity,
            color: AppColors.primaryMain,
            child: ListView(
              cacheExtent: 9999,
              children: [
                25.vertical,
                ...SectionsLists.homeSections.mapIndexed(
                  (index, e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DrawerExpansionTile(
                        title: e.title,
                        icon: e.icon,
                        children: _prepareChildren(e.subSections),
                        initiallyExpanded: index == 0,
                        onExpansionChanged: (value) {
                          if (value) {
                            selectedSubSections = e.subSections;
                            setState(() {});
                          }
                        },
                      ),
                    );
                  },
                ).toList(),
                25.vertical,
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        color: AppColors.background,
                        child: Column(
                          children: [
                            25.vertical,
                            AppCardContainer(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppIcon(
                                    Icons.notifications_none,
                                    color: AppColors.iconColor,
                                  ),
                                  12.horizontal,
                                  CircleAvatar(
                                    backgroundColor: AppColors.primaryMain,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(45),
                                      child: AppCachedNetworkImage(
                                        width: 500,
                                        height: 500,
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            AppConstants.currentUser.img_image,
                                      ),
                                    ),
                                  ),
                                  7.horizontal,
                                  AppText(AppConstants.currentUser.nameUser),
                                ],
                              ),
                            ),
                            24.vertical,
                            AppCardContainer(
                              child: SizedBox(
                                width: constraints.maxWidth,
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  // chips contains strings
                                  children: [
                                    ..._filterAllowedSections(
                                            selectedSubSections)
                                        .mapIndexed(
                                      (index, element) {
                                        return AppChip(
                                          text: element.title,
                                          width: constraints.maxWidth / 3.3,
                                          onTap: () {
                                            // Handle the tap event here
                                            AppNavigator.go(element.page,
                                                name: element.path);
                                            // You can add navigation or any other action here
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                AppCopyrightsWidget(),
                10.height,
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _prepareChildren(List<SectionModel> subSections) {
    final allowedSubsections = _filterAllowedSections(subSections);

    return allowedSubsections
        .map(
          (e) => ListTile(
            leading: AppIcon(
              Icons.circle,
              color: AppColors.primaryMain,
            ),
            title: AppText(
              e.title,
              style: AppStyles.regular18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            onTap: () {
              AppNavigator.go(e.page, name: e.path);
            },
          ),
        )
        .toList();
  }

  List<SectionModel> _filterAllowedSections(List<SectionModel> subSections) {
    return subSections.where((e) {
      return context.read<PrivilegesCubit>().checkPrivilege(e.privilegeId);
    }).toList();
  }
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.text,
    this.width,
    required this.onTap,
  });

  final String text;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 56.scaleHeight,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.fillColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppText(
          text,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
