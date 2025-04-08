import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/pages/action_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/common/extensions/build_context.dart';
import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/config/navigator/app_routes_names.dart';
import '../../../core/services/cache_services/cache_services.dart';
import '../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../core/services/di/di_container.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/auth/login/presentation/pages/login/login_page.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../screen/user/userview.dart';
import '../delete_acconut_dialog.dart';
import '../../../core/common/lists/sections_lists.dart';
import '../../../core/common/models/sections/section_model.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final shorebirdCodePush = ShorebirdUpdater();
  bool checkingForUpdate = false;
  bool _showProfileSection = false;
  Map<int, bool> _expandedSections = {};
  int _expandedSectionIndex = -1;

  @override
  void initState() {
    shorebirdCodePush.readCurrentPatch().then((value) {
      debugPrint('current patch number is $value');
    });
    super.initState();
  }

  void _handleSectionTap(SectionModel section, int index) {
    if (section.path.startsWith('http')) {
      launchUrl(Uri.parse(section.path));
      return;
    }

    if (section.subSections.isEmpty) {
      AppNavigator.go(section.page, name: section.path);
      return;
    }

    setState(() {
      _expandedSections[index] = !(_expandedSections[index] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.scaleWidth,
      child: Container(
        color: AppColors.white,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Profile Header Section
                  Container(
                    padding: EdgeInsets.all(16),
                    color: AppColors.primaryMain, //Color(0xFF579DDE),
                    child: Column(
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
                                  imageUrl: Provider.of<UserProvider>(context,
                                          listen: true)
                                      .currentUser
                                      .img_image,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    Provider.of<UserProvider>(context,
                                            listen: true)
                                        .currentUser
                                        .nameUser
                                        .toString(),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16.scaleFontSize,
                                      fontFamily: AppFonts.fontFamily1,
                                    ),
                                  ),
                                  AppText(
                                    Provider.of<UserProvider>(context,
                                            listen: true)
                                        .currentUser
                                        .email
                                        .toString(),
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
                                _showProfileSection
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
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
                            leading: Icon(Icons.person_outline,
                                color: AppColors.white),
                            title: AppText(
                              'الملف الشخصي',
                              fontSize: 15.scaleFontSize,
                              style: TextStyle(color: AppColors.white),
                    ),
                    onTap: () => AppNavigator.go(
                      UserScreen(
                        ismyprofile: 'yes',
                                user: Provider.of<UserProvider>(context,
                                        listen: false)
                                    .currentUser,
                      ),
                      isNew: false,
                    ),
                  ),
                          if (context
                              .read<PrivilegesCubit>()
                              .checkPrivilege('49'))
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
                                  name: AppRoutesNames
                                      .managementInternalRoutes.addUser,
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
                              Provider.of<UserProvider>(context, listen: false)
                                  .logout(
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
                                      AppNavigator.goReplacement(LoginPage(),
                                          name: AppRoutesNames
                                              .generalRoutes.login);
                            },
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                            leading: Icon(Icons.delete_outline,
                                color: AppColors.white),
                            title: AppText(
                      'حذف حسابي',
                              fontSize: 15.scaleFontSize,
                              style: TextStyle(color: AppColors.white),
                            ),
                            onTap: () {
                              AppConstants.showAppDialog(
                                  child: DeleteAccountDialog());
                            },
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Main Sections from SectionsLists.homeSections
                  ...SectionsLists.homeSections.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final section = entry.value;

                    // Check if user has privilege to view this section
                    if (section.privilegeId != null &&
                        !context
                            .read<PrivilegesCubit>()
                            .checkPrivilege(section.privilegeId)) {
                      return SizedBox.shrink();
                    }

                    final bool isExpanded = _expandedSections[index] ?? false;

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
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: AppColors.primaryMain,
                                )
                              : null,
                          onTap: () => _handleSectionTap(section, index),
                        ),
                        if (isExpanded && section.subSections.isNotEmpty)
                          ...section.subSections.map((subSection) {
                            // Check if user has privilege to view this subsection
                            if (subSection.privilegeId != null &&
                                !context
                                    .read<PrivilegesCubit>()
                                    .checkPrivilege(subSection.privilegeId)) {
                              return SizedBox.shrink();
                            }

                            return ListTile(
                              contentPadding: EdgeInsets.only(right: 32.0),
                              leading: Icon(
                                subSection.icon ?? Icons.circle,
                                color: AppColors.primaryMain,
                                size: 12.scaleFontSize,
                              ),
                              title: AppText(
                                subSection.title,
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamily1,
                                  fontSize: 12.scaleFontSize,
                                ),
                              ),
                              onTap: () {
                                AppNavigator.go(subSection.page,
                                    name: subSection.path);
                                // Navigator.pop(context);
                              },
                            );
                          }).toList(),
                      ],
                    );
                  }).toList(),

                  Divider(
                      height: 10, thickness: 1, color: AppColors.grey.shade200),
                ],
              ),
            ),

            // Bottom Section
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                        height: 10,
                        thickness: 1,
                        color: AppColors.grey.shade200),

                    // Update button
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StatefulBuilder(
                      builder: (context, refresh) {
                        return AppElevatedButton(
                          isLoading: checkingForUpdate,
                          onPressed: () async {
                            _changeUpdateStateLoading(refresh);
                            await _downloadUpdateIfAvailable();
                            _changeUpdateStateLoading(refresh);
                          },
                          child: AppText(
                            'تحقق من وجود تحديثات',
                              fontSize: 14.scaleFontSize,
                              color: AppColors.white,
                          ),
                        );
                      },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeUpdateStateLoading(StateSetter refresh) {
    checkingForUpdate = !checkingForUpdate;
    refresh(() {});
  }

  Future<void> _downloadUpdateIfAvailable() async {
    try {
      final isUpdateAvailable =
          await shorebirdCodePush.checkForUpdate() == UpdateStatus.outdated;

      if (isUpdateAvailable) {
        await shorebirdCodePush.update();
        await Future.delayed(const Duration(milliseconds: 500));
        AppSnackbar.showListOfSnackBars(
          snackbarsMessages: [
            'جاري التحقق من وجود تحديثات',
            'جاري تحميل التحديث',
          ],
          onCompletion: () async {
            await SystemChannels.platform
                .invokeMethod('SystemNavigator.pop', true);
          },
        );
        return;
      }
      AppSnackbar.showSnakeBar('لا يوجد تحديثات جديدة');
    } catch (e) {
      debugPrint('Error while checking for updates: $e');
    }
  }
}
