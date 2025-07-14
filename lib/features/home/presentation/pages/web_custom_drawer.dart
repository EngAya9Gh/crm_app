import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/lists/sections_lists.dart';
import 'package:crm_smart/core/common/models/sections/section_model.dart';
import 'package:crm_smart/core/common/widgets/app_cached_network_image.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/login/login_page.dart';
import 'package:crm_smart/features/home/presentation/manager/web_home_page_cubit.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/pages/action_user_page.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_logo.dart';
import 'package:crm_smart/ui/widgets/delete_acconut_dialog.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/cache_services/cache_services.dart';
import '../../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../../core/services/di/di_container.dart';

class WebCustomDrawer extends StatefulWidget {
  const WebCustomDrawer({Key? key}) : super(key: key);

  @override
  State<WebCustomDrawer> createState() => _WebCustomDrawerState();
}

class _WebCustomDrawerState extends State<WebCustomDrawer> {
  bool _showProfileSection = false;
  Map<int, bool> _expandedSections = {};
  WebHomePageCubit? _webHomePageCubit;

  bool get isAuthenticated {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return userProvider.currentUser.idUser != null &&
        userProvider.currentUser.idUser != '-1' &&
        userProvider.currentUser.idUser!.isNotEmpty;
  }

  @override
  void initState() {
    print('object aaaaaaaaaaaaaaa');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _webHomePageCubit ?? WebHomePageCubit(),
      child: BlocBuilder<WebHomePageCubit, WebHomePageState>(
        builder: (context, state) {
          // Initialize cubit if not already done
          _webHomePageCubit ??= context.read<WebHomePageCubit>();
          
          print('isAuthenticated');
          print('isAuthenticated');
          print('isAuthenticated');
          print(isAuthenticated);
          return Container(
            width: 300,
            color: AppColors.white,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Profile Header Section or Login Section
                      Container(
                        padding: EdgeInsets.all(16),
                        color: AppColors.primaryMain,
                        child: isAuthenticated ? _buildAuthenticatedHeader() : _buildLoginSection(),
                      ),

                      // Main Sections from SectionsLists.homeSections
                      ...SectionsLists.homeSections.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final section = entry.value;

                        // Only show sections if user is authenticated
                        if (!isAuthenticated) {
                          return SizedBox.shrink();
                        }

                        // Check if user has privilege to view this section
                        if (section.privilegeId != null &&
                            !context.read<PrivilegesCubit>().checkPrivilege(section.privilegeId)) {
                          return SizedBox.shrink();
                        }

                        // Use WebHomePageCubit to determine expanded state
                        bool isExpanded = _webHomePageCubit?.sideBarEntity.currentSectionIndex == index;

                        return Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                section.icon ?? Icons.circle_outlined,
                                color: AppColors.primaryMain,
                                size: 20.scaleFontSize,
                              ),
                              title: AppText(
                                section.title,
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamily1,
                                  fontSize: 14.scaleFontSize,
                                ),
                              ),
                              trailing: section.subSections.isNotEmpty
                                  ? Icon(
                                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                      color: AppColors.primaryMain,
                                    )
                                  : null,
                              onTap: () {
                                setState(() {
                                  if (section.subSections.isEmpty) {
                                    // Navigate to the section directly if it has no subsections
                                    AppNavigator.go(section.page, name: section.path);
                                  } else {
                                    // Toggle expansion and handle WebHomePageCubit state
                                    if (_webHomePageCubit?.sideBarEntity.currentSectionIndex == index) {
                                      _webHomePageCubit?.sideBarEntity.currentSectionIndex = -1;
                                    } else {
                                      _webHomePageCubit?.sideBarEntity.currentSectionIndex = index;
                                    }
                                    _webHomePageCubit?.setSelectedSubSections();
                                  }
                                });
                              },
                            ),
                            if (isExpanded && section.subSections.isNotEmpty)
                              ...section.subSections.mapIndexed((subIndex, subSection) {
                                // Check if user has privilege to view this subsection
                                if (subSection.privilegeId != null &&
                                    !context.read<PrivilegesCubit>().checkPrivilege(subSection.privilegeId)) {
                                  return SizedBox.shrink();
                                }

                                // Determine if this subsection is selected
                                bool isSelected = _webHomePageCubit?.sideBarEntity.selectedSubSectionIndex == subIndex &&
                                    _webHomePageCubit?.sideBarEntity.selectedSectionIndex == index;

                                return ListTile(
                                  contentPadding: EdgeInsets.only(right: 32.0),
                                  leading: Icon(
                                    subSection.icon ?? Icons.circle,
                                    color: isSelected ? AppColors.secondaryMain : AppColors.primaryMain,
                                    size: 12.scaleFontSize,
                                  ),
                                  title: AppText(
                                    subSection.title,
                                    style: TextStyle(
                                      fontFamily: AppFonts.fontFamily1,
                                      fontSize: 12.scaleFontSize,
                                      color: isSelected ? AppColors.secondaryMain : AppColors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _webHomePageCubit?.sideBarEntity.selectedSubSectionIndex = subIndex;
                                      _webHomePageCubit?.sideBarEntity.selectedSectionIndex = index;
                                      AppNavigator.go(subSection.page, name: subSection.path);
                                    });
                                  },
                                );
                              }).toList(),
                          ],
                        );
                      }).toList(),

                      if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
                        Divider(height: 10, thickness: 1, color: AppColors.grey.shade200),
                        ListTile(
                          leading: Icon(
                            Icons.campaign_outlined,
                            color: AppColors.primaryMain,
                            size: 20.scaleFontSize,
                          ),
                          title: AppText(
                            'الحملات الإعلانية',
                            style: TextStyle(
                              fontFamily: AppFonts.fontFamily1,
                              fontSize: 14.scaleFontSize,
                            ),
                          ),
                          onTap: () async {
                            await HelperFunctions.urlLauncher(
                              'https://test.smartcrm.ws/campaigns',
                              isNewTab: true,
                            );
                          },
                        ),
                      ],

                      Divider(height: 10, thickness: 1, color: AppColors.grey.shade200),
                    ],
                  ),
                ),

                // Bottom Section with update button
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(height: 10, thickness: 1, color: AppColors.grey.shade200),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppElevatedButton(
                            onPressed: () {},
                            text: 'تحقق من وجود تحديثات',
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAuthenticatedHeader() {
    return Column(
      children: [
        SizedBox(height: 8.scaleHeight),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: AppCachedNetworkImage(
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  imageUrl: Provider.of<UserProvider>(context, listen: true).currentUser.img_image,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    Provider.of<UserProvider>(context, listen: true).currentUser.nameUser.toString(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.scaleFontSize,
                      fontFamily: AppFonts.fontFamily1,
                    ),
                  ),
                  AppText(
                    Provider.of<UserProvider>(context, listen: true).currentUser.email.toString(),
                    style: TextStyle(
                      color: AppColors.white70,
                      fontSize: 14.scaleFontSize,
                      fontFamily: AppFonts.fontFamily1,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                _showProfileSection ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppColors.white,
              ),
              onPressed: () {
                setState(() {
                  _showProfileSection = !_showProfileSection;
                });
              },
            ),
          ],
        ),
        if (_showProfileSection) ...[
          Divider(color: AppColors.white24, height: 18),
          ListTile(
            leading: Icon(Icons.person_outline, color: AppColors.white),
            title: AppText(
              'الملف الشخصي',
              fontSize: 15.scaleFontSize,
              style: TextStyle(color: AppColors.white),
            ),
            onTap: () => AppNavigator.go(
              UserScreen(
                ismyprofile: 'yes',
                user: Provider.of<UserProvider>(context, listen: false).currentUser,
              ),
              isNew: false,
            ),
          ),
          if (context.read<PrivilegesCubit>().checkPrivilege('49'))
            ListTile(
              leading: Icon(Icons.add, color: AppColors.white),
              title: AppText(
                'اضافة حساب جديد',
                fontSize: 15.scaleFontSize,
                style: TextStyle(color: AppColors.white),
              ),
              onTap: () async {
                AppNavigator.go(
                  ActionUserPage(),
                  name: AppRoutesNames.managementInternalRoutes.addUser,
                );
              },
            ),
          ListTile(
            leading: Icon(Icons.logout, color: AppColors.white),
            title: AppText(
              'تسجيل الخروج',
              fontSize: 15.scaleFontSize,
              style: TextStyle(color: AppColors.white),
            ),
            onTap: () async {
              Provider.of<UserProvider>(context, listen: false).logout(
                onLogoutSuccess: () async {
                  final secureStorage = getIt<CacheServices>(
                    instanceName: SecureStorageConsumer.name,
                  );
                  await secureStorage
                      .removeData(
                    key: AppStrings.secureStorage.token,
                  )
                      .then(
                    (value) {
                      AppNavigator.goReplacement(LoginPage(), name: AppRoutesNames.generalRoutes.login);
                    },
                  );
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.delete_outline, color: AppColors.white),
            title: AppText(
              'حذف حسابي',
              fontSize: 15.scaleFontSize,
              style: TextStyle(color: AppColors.white),
            ),
            onTap: () {
              AppConstants.showAppDialog(child: DeleteAccountDialog());
            },
          ),
        ],
      ],
    );
  }

  Widget _buildLoginSection() {
    return Column(
      children: [
        SizedBox(height: 8.scaleHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              'يجب تسجيل الدخول للوصول إلى هذه الصفحة',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.scaleFontSize,
                fontFamily: AppFonts.fontFamily1,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.scaleHeight),
        AppElevatedButton(
          onPressed: () {
            AppNavigator.go(LoginPage(), name: AppRoutesNames.generalRoutes.login);
          },
          text: 'تسجيل الدخول',
        ),
      ],
    );
  }
}
