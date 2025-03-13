import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/item_comment_mention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/common/widgets/app_card_container.dart';
import '../../../../core/common/widgets/app_copyrights_widget.dart';
import '../../../../core/common/widgets/app_loader.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../ui/screen/user/userview.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../notifications/presentation/pages/notifications_page.dart';
import '../../../versions/presentation/pages/versions_page.dart';
import '../manager/web_home_page_cubit.dart';
import 'app_web_side_bar.dart';

class WebHomePage extends StatefulWidget {
  WebHomePage({this.child, super.key});

  final Widget? child;

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  late final WebHomePageCubit _webHomePageCubit;

  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>()..init();
    _webHomePageCubit = context.read<WebHomePageCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        Provider.of<RegionProvider>(context, listen: false).getRegions(),
        Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket'),
      ]);
    });
  }

  final Color customColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Row(
        children: [
          AppWebSideBar(),
          // _sideBar(context),
          Expanded(
            child: widget.child == null ? _buildBody() : widget.child!,
          ),
        ],
      ),
    );
  }

  Column _buildBody() {
    final _notificationsCubit = context.read<NotificationsCubit>();
    return Column(
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
                          12.horizontal,
                          GestureDetector(
                            onTap: () {
                              AppNavigator.go(
                                NotificationsPage(),
                                name: AppRoutesNames.generalRoutes.notifications,
                              );
                              _notificationsCubit.markNotificationsAsRead();
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
                                                _notificationsCubit.pageVariables.unReadCount > 99
                                                    ? '99'
                                                    : _notificationsCubit.pageVariables.unReadCount.toString(),
                                                color: Colors.white,
                                                fontSize: (14.0).scaleFontSize,
                                              );
                                            },
                                            empty: () => SizedBox.shrink(),
                                            failure: (error, data) => AppErrorWidget(
                                              onPressed: () => _notificationsCubit.getUnreadNotificationsCount(),
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
                          12.horizontal,
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
                                  size: 25.scaleIconsSize,
                                ),
                              ),
                              onSelected: (value) => {},
                              itemBuilder: (context) => [1, 2, 3]
                                  .map(
                                    (e) => PopupMenuItem(enabled: false, child: ItemCommentMentionWidget()),
                                  )
                                  .toList()),
                          12.horizontal,
                          InkWell(
                            onTap: () {
                              AppNavigator.go(
                                UserScreen(
                                  ismyprofile: 'yes',
                                  user: Provider.of<UserProvider>(context, listen: false).currentUser,
                                ),
                                isNew: false,
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryMain,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(45),
                                child: AppCachedNetworkImage(
                                  width: 500,
                                  height: 500,
                                  fit: BoxFit.fill,
                                  imageUrl: AppConstants.currentUser.img_image,
                                ),
                              ),
                            ),
                          ),
                          7.horizontal,
                          AppText(AppConstants.currentUser.nameUser),
                        ],
                      ),
                    ),
                    24.vertical,
                    BlocBuilder<WebHomePageCubit, WebHomePageState>(
                      builder: (context, state) {
                        print("selectedSubSections length => ${_webHomePageCubit.sideBarEntity.selectedSubSections.length}");
                        return AppCardContainer(
                          // color: AppColors.primaryMain,
                          child: SizedBox(
                            width: constraints.maxWidth,
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              // chips contains strings
                              children: [
                                ..._filterAllowedSections(_webHomePageCubit.sideBarEntity.selectedSubSections).mapIndexed(
                                  (index, element) {
                                    return AppChip(
                                      text: element.title,
                                      width: constraints.maxWidth / 3.3,
                                      onTap: () {
                                        // Handle the tap event here
                                        AppNavigator.go(element.page, name: element.path);
                                        // You can add navigation or any other action here
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

  // Container _sideBar(BuildContext context) {
  //   return Container(
  //     width: 350.scaleWidth,
  //     height: double.infinity,
  //     decoration: BoxDecoration(
  //       color: AppColors.primaryMain,
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10),
  //         bottomLeft: Radius.circular(10),
  //       ),
  //     ),
  //     child: CustomScrollView(
  //       slivers: [
  //         SliverToBoxAdapter(child: 10.vertical),
  //         SliverToBoxAdapter(
  //           child: Center(
  //             child: LayoutBuilder(
  //               builder: (context, constraints) {
  //                 return CustomLogo(
  //                   logoNumber: 1,
  //                   height: 100.scaleHeight,
  //                   width: constraints.maxWidth * 0.9,
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //         SliverToBoxAdapter(child: 10.vertical),
  //         ...SectionsLists.homeSections.mapIndexed(
  //           (index, e) {
  //             return SliverToBoxAdapter(
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 8),
  //                 child: ExpandedTile(
  //                   controller: expandedTileControllers[index],
  //                   onTap: () {
  //                     expandedTileControllers.forEachIndexed(
  //                       (i, element) => element.collapse(),
  //                     );
  //
  //                     selectedSubSectionIndex = -1;
  //                     if (index == selectedSectionIndex) {
  //                       selectedSectionIndex = -1;
  //                       selectedSubSections = [];
  //                     } else {
  //                       selectedSectionIndex = index;
  //                       expandedTileControllers[index].expand();
  //                       selectedSubSections = e.subSections;
  //                     }
  //
  //                     setState(() {});
  //                   },
  //                   title: AppText(
  //                     e.title,
  //                     style: AppStyles.regular18.copyWith(
  //                       color: selectedSectionIndex == index
  //                           ? AppColors.primaryMain
  //                           : AppColors.white,
  //                     ),
  //                   ),
  //                   leading: AppIcon(
  //                     e.icon ?? Icons.circle,
  //                     color: _onCardColor(index),
  //                   ),
  //                   trailing: AppIcon(
  //                     selectedSectionIndex == index
  //                         ? Icons.keyboard_arrow_up_outlined
  //                         : Icons.keyboard_arrow_down_outlined,
  //                     color: _onCardColor(index),
  //                   ),
  //                   trailingRotation: 0,
  //                   content: Column(
  //                     children: _prepareChildren(e.subSections),
  //                   ),
  //                   contentseparator: 0,
  //                   expansionAnimationCurve: Curves.easeInOut,
  //                   theme: ExpandedTileThemeData(
  //                     headerColor: selectedSectionIndex == index
  //                         ? customColor
  //                         : AppColors.primaryMain,
  //                     contentBackgroundColor:
  //                         AppColors.primaryAltDark.withOpacity(0.1),
  //                     fullExpandedBorder: OutlineInputBorder(
  //                       borderSide: BorderSide.none,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     contentPadding: EdgeInsets.only(
  //                       top: 0,
  //                       bottom: 10,
  //                       right: 10,
  //                       left: 10,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         ).toList(),
  //         if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
  //           SliverToBoxAdapter(
  //             child: Align(
  //               alignment: Alignment.centerRight,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(right: 25, top: 10),
  //                 child: Row(
  //                   children: [
  //                     AppIcon(
  //                       Icons.circle,
  //                       size: 25,
  //                     ),
  //                     10.width,
  //                     AppTextButton(
  //                       text: 'الحملات الإعلانية',
  //                       textStyle: AppStyles.regular18.copyWith(
  //                         color: AppColors.white,
  //                       ),
  //                       onPressed: () async {
  //                         await HelperFunctions.urlLauncher(
  //                           'https://test.smartcrm.ws/campaigns',
  //                           isNewTab: true,
  //                         );
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ],
  //     ),
  //   );
  // }

  // Color _onCardColor(int index) {
  //   return selectedSectionIndex == index
  //       ? AppColors.primaryMain
  //       : AppColors.white;
  // }

  // List<Widget> _prepareChildren(List<SectionModel> subSections) {
  //   final allowedSubsections = _filterAllowedSections(subSections);
  //
  //   return allowedSubsections
  //       .mapIndexed(
  //         (index, e) => ListTile(
  //           horizontalTitleGap: 0,
  //           title: AppText(
  //             e.title,
  //             style: AppStyles.regular18.copyWith(
  //               color: selectedSubSectionIndex == index
  //                   ? AppColors.secondaryMain
  //                   : AppColors.white,
  //             ),
  //           ),
  //           leading: AppIcon(
  //             Icons.circle,
  //             color: selectedSubSectionIndex == index
  //                 ? AppColors.secondaryMain
  //                 : AppColors.white,
  //             size: 10,
  //           ),
  //           selected: selectedSubSectionIndex == index,
  //           onTap: () {
  //             selectedSubSectionIndex = index;
  //             AppNavigator.go(e.page, name: e.path);
  //             setState(() {});
  //           },
  //         ),
  //       )
  //       .toList();
  // }

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
          fontFamily: AppFonts.fontFamily2,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
