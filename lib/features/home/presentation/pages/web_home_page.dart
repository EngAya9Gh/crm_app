import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/common/widgets/app_card_container.dart';
import '../../../../core/common/widgets/app_copyrights_widget.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/app_dynamic_links.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_text_button.dart';

class WebHomePage extends StatefulWidget {
  WebHomePage({super.key});

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  List<SectionModel> selectedSubSections = SectionsLists.salesSections;

  late final NotificationsCubit _notificationsCubit;

  final SideMenuController sideMenu = SideMenuController();
  int selectedSectionIndex = 0;
  int selectedSubSectionIndex = -1;
  List<ExpandedTileController> expandedTileControllers = [];

  @override
  void initState() {
    super.initState();
    _notificationsCubit = context.read<NotificationsCubit>()..init();
    expandedTileControllers = List.generate(
      SectionsLists.homeSections.length,
      (index) => ExpandedTileController(isExpanded: index == 0),
    );
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
            width: 303.scaleWidth,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryMain,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: 10.vertical),
                SliverToBoxAdapter(
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return CustomLogo(
                          logoNumber: 1,
                          height: 100.scaleHeight,
                          width: constraints.maxWidth * 0.9,
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 10.vertical),
                ...SectionsLists.homeSections.mapIndexed(
                  (index, e) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ExpandedTile(
                          controller: expandedTileControllers[index],
                          onTap: () {
                            expandedTileControllers.forEachIndexed(
                              (i, element) => element.collapse(),
                            );

                            selectedSubSectionIndex = -1;
                            if (index == selectedSectionIndex) {
                              selectedSectionIndex = -1;
                              selectedSubSections = [];
                            } else {
                              selectedSectionIndex = index;
                              expandedTileControllers[index].expand();
                              selectedSubSections = e.subSections;
                            }

                            setState(() {});
                          },
                          title: AppText(
                            e.title,
                            style: AppStyles.regular18.copyWith(
                              color: selectedSectionIndex == index
                                  ? AppColors.primaryMain
                                  : AppColors.white,
                            ),
                          ),
                          leading: AppIcon(
                            e.icon ?? Icons.circle,
                            color: selectedSectionIndex == index
                                ? AppColors.primaryMain
                                : AppColors.white,
                          ),
                          trailing: AppIcon(
                            selectedSectionIndex == index
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            color: selectedSectionIndex == index
                                ? AppColors.primaryMain
                                : AppColors.white,
                          ),
                          trailingRotation: 0,
                          content: Column(
                            children: _prepareChildren(e.subSections),
                          ),
                          contentseparator: 0,
                          expansionAnimationCurve: Curves.easeInOut,
                          theme: ExpandedTileThemeData(
                            headerColor: selectedSectionIndex == index
                                ? AppColors.white
                                : AppColors.primaryMain,
                            contentBackgroundColor: AppColors.white,
                            fullExpandedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 0,
                              bottom: 10,
                              right: 10,
                              left: 10,
                            ),
                          ),
                        ),

                        /**/
                        //     ConfigurableExpansionTile(
                        //   initiallyExpanded: index == 0,
                        //   onExpansionChanged: (value) {
                        //     if (value) {
                        //       selectedSubSections = e.subSections;
                        //       selectedSectionIndex = index;
                        //       setState(() {});
                        //     }
                        //   },
                        //   expandedBackgroundColor: AppColors.white,
                        //   header: (isExpanded, iconTurns, heightFactor,
                        //       controller) {
                        //     return Expanded(
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: selectedSectionIndex == index
                        //               ? AppColors.white
                        //               : AppColors.primaryMain,
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         child: ListTile(
                        //           title: AppText(
                        //             e.title,
                        //             style: AppStyles.regular18.copyWith(
                        //               color: selectedSectionIndex == index
                        //                   ? AppColors.primaryMain
                        //                   : AppColors.white,
                        //             ),
                        //           ),
                        //           leading: AppIcon(
                        //             e.icon ?? Icons.circle,
                        //             color: selectedSectionIndex == index
                        //                 ? AppColors.primaryMain
                        //                 : AppColors.white,
                        //           ),
                        //           trailing: AppIcon(
                        //             selectedSectionIndex == index
                        //                 ? Icons.keyboard_arrow_up_outlined
                        //                 : Icons.keyboard_arrow_down_outlined,
                        //             color: selectedSectionIndex == index
                        //                 ? AppColors.primaryMain
                        //                 : AppColors.white,
                        //           ),
                        //           onTap: () {
                        //             selectedSubSectionIndex = -1;
                        //             if (index == selectedSectionIndex) {
                        //               selectedSectionIndex = -1;
                        //               selectedSubSections = [];
                        //             } else {
                        //               selectedSectionIndex = index;
                        //               selectedSubSections = e.subSections;
                        //             }
                        //             setState(() {});
                        //           },
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   childrenBody: Container(
                        //     margin: EdgeInsets.symmetric(vertical: 5),
                        //     decoration: BoxDecoration(
                        //       color: AppColors.white,
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Column(
                        //       key: ValueKey(index),
                        //       children: _prepareChildren(e.subSections),
                        //     ),
                        //   ),
                        // ),
                        /**/

                        // ExpansionTile(
                        //   initiallyExpanded: index == 0,
                        //   controlAffinity: ListTileControlAffinity.trailing,
                        //   onExpansionChanged: (value) {
                        //     if (value) {
                        //       selectedSubSections = e.subSections;
                        //       selectedSectionIndex = index;
                        //       setState(() {});
                        //     }
                        //   },
                        //   children: _prepareChildren(e.subSections),
                        //
                        //   /* button before expanding */
                        //   collapsedBackgroundColor:
                        //       selectedSectionIndex == index
                        //           ? AppColors.white
                        //           : AppColors.primaryMain,
                        //   title: AppText(
                        //     e.title,
                        //     style: AppStyles.regular18.copyWith(
                        //       color: selectedSectionIndex == index
                        //           ? AppColors.primaryMain
                        //           : AppColors.white,
                        //     ),
                        //   ),
                        //   // down arrow color
                        //   leading: AppIcon(
                        //     e.icon ?? Icons.circle,
                        //     color: selectedSectionIndex == index
                        //         ? AppColors.primaryMain
                        //         : AppColors.white,
                        //   ),
                        //   collapsedShape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   collapsedIconColor: selectedSectionIndex == index
                        //       ? AppColors.primaryMain
                        //       : AppColors.white,
                        //
                        //   /* button and expanded body */
                        //
                        //   // up arrow color
                        //   iconColor: selectedSectionIndex == index
                        //       ? AppColors.primaryMain
                        //       : AppColors.white,
                        //   backgroundColor: AppColors.white,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        // ),
                      ),
                    );
                  },
                ).toList(),
                if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AppTextButton(
                          text: 'الحملات الإعلانية',
                          textStyle: AppStyles.regular20.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          onPressed: () async {
                            await HelperFunctions.urlLauncher(
                              'https://test.smartcrm.ws/campaigns',
                              isNewTab: true,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // SideMenu(
          //   controller: sideMenu,
          //   showToggle: true,
          //   title: Center(
          //     child: LayoutBuilder(
          //       builder: (context, constraints) {
          //         return CustomLogo(
          //           logoNumber: 1,
          //           width: constraints.maxWidth * 0.5,
          //         );
          //       },
          //     ),
          //   ),
          //   style: SideMenuStyle(
          //     compactSideMenuWidth: 100.scaleWidth,
          //     toggleColor: AppColors.white,
          //     // remove
          //     displayMode: SideMenuDisplayMode.open,
          //     //
          //     backgroundColor: AppColors.primaryMain,
          //     // items
          //     selectedTitleTextStyleExpandable: AppStyles.textStyle.copyWith(
          //       color: AppColors.white,
          //     ),
          //     unselectedTitleTextStyleExpandable: AppStyles.textStyle.copyWith(
          //       color: AppColors.white,
          //     ),
          //     selectedIconColor: AppColors.white,
          //     arrowCollapse: AppColors.white,
          //     arrowOpen: AppColors.white,
          //
          //     // sub items
          //     selectedColor: AppColors.white,
          //     unselectedIconColor: AppColors.white,
          //     selectedTitleTextStyle: AppStyles.regular18.copyWith(
          //       color: AppColors.secondaryMain,
          //     ),
          //     unselectedTitleTextStyle: AppStyles.textStyle.copyWith(
          //       color: AppColors.white,
          //     ),
          //   ),
          //   items: [
          //     ...SectionsLists.homeSections.mapIndexed(
          //       (index, e) {
          //         return SideMenuExpansionItem(
          //           title: e.title,
          //           iconWidget: AppIcon(e.icon!, color: AppColors.white),
          //           children: _children(e.subSections),
          //         );
          //       },
          //     ).toList(),
          //   ],
          // ),
          // Container(
          //   width: 400.scaleWidth,
          //   height: double.infinity,
          //   color: AppColors.primaryMain,
          //   child: CustomScrollView(
          //     slivers: [
          //       SliverToBoxAdapter(child: 25.vertical),
          //       ...SectionsLists.homeSections.mapIndexed(
          //         (index, e) {
          //           return SliverToBoxAdapter(
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: DrawerExpansionTile(
          //                 title: e.title,
          //                 icon: e.icon,
          //                 children: _prepareChildren(e.subSections),
          //                 initiallyExpanded: index == 0,
          //                 onExpansionChanged: (value) {
          //                   if (value) {
          //                     selectedSubSections = e.subSections;
          //                     setState(() {});
          //                   }
          //                 },
          //               ),
          //             ),
          //           );
          //         },
          //       ).toList(),
          //       if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
          //         SliverFillRemaining(
          //           hasScrollBody: false,
          //           child: Align(
          //             alignment: Alignment.bottomCenter,
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 10),
          //               child: AppTextButton(
          //                 text: 'الحملات الإعلانية',
          //                 textStyle: AppStyles.regular20.copyWith(
          //                   color: AppColors.white,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //                 onPressed: () async {
          //                   await HelperFunctions.urlLauncher(
          //                     'https://test.smartcrm.ws/campaigns',
          //                     isNewTab: true,
          //                   );
          //                 },
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ],
          //   ),
          // ),

          /**/

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

  List<SideMenuItem> _children(List<SectionModel> subSections) {
    return [
      ..._filterAllowedSections(subSections).map<SideMenuItem>(
        (sb) {
          return SideMenuItem(
            builder: (context, displayMode) {
              return InkWell(
                onTap: () {
                  AppNavigator.go(sb.page, name: sb.path);
                },
                child: displayMode == SideMenuDisplayMode.compact
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: AppIcon(
                                Icons.circle,
                                color: AppColors.white,
                                size: 10,
                              ),
                            ),
                            5.width,
                            Flexible(
                              child: AppText(
                                sb.title,
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 5, top: 5, bottom: 5),
                        color: AppColors.primaryAltDark.withOpacity(0.1),
                        child: Row(
                          children: [
                            AppIcon(
                              Icons.circle,
                              color: AppColors.white,
                            ),
                            12.horizontal,
                            AppText(
                              sb.title,
                              style: AppStyles.regular18.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ).toList(),
    ];
  }

  List<Widget> _prepareChildren(List<SectionModel> subSections) {
    final allowedSubsections = _filterAllowedSections(subSections);

    return allowedSubsections
        .mapIndexed(
          (index, e) => ListTile(
            horizontalTitleGap: 0,
            title: AppText(
              e.title,
              style: AppStyles.regular18.copyWith(
                color: selectedSubSectionIndex == index
                    ? AppColors.secondaryMain
                    : AppColors.textPrimary,
              ),
            ),
            leading: AppIcon(
              Icons.circle,
              color: selectedSubSectionIndex == index
                  ? AppColors.secondaryMain
                  : AppColors.primaryMain,
              size: 15,
            ),
            selected: selectedSubSectionIndex == index,
            onTap: () {
              selectedSubSectionIndex = index;
              AppNavigator.go(e.page, name: e.path);
              setState(() {});
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
