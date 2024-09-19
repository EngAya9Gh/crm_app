import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../../core/common/extensions/build_context.dart';
import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/services/cache_services/cache_services.dart';
import '../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../core/services/di/di_container.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../screen/user/userview.dart';
import '../delete_acconut_dialog.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final shorebirdCodePush = ShorebirdCodePush();
  bool checkingForUpdate = false;

  @override
  void initState() {
    shorebirdCodePush.currentPatchNumber().then((value) {
      debugPrint('current patch number is $value');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: Colors.white24 //Color(0xFF56ccf2),
                            ),
                    accountName: Text(
                      Provider.of<UserProvider>(context, listen: true)
                          .currentUser
                          .nameUser
                          .toString(),
                      style: TextStyle(
                          fontFamily: AppFonts.fontFamily2,
                          color: context.colorScheme.onBackground),
                    ),
                    accountEmail: Text(
                      Provider.of<UserProvider>(context, listen: true)
                          .currentUser
                          .email
                          .toString(),
                      style: TextStyle(
                          fontFamily: AppFonts.fontFamily2,
                          color: context.colorScheme.onBackground),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: AppColors.primaryMain,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: AppCachedNetworkImage(
                          width: 500,
                          height: 500,
                          fit: BoxFit.fill,
                          imageUrl:
                              Provider.of<UserProvider>(context, listen: true)
                                  .currentUser
                                  .img_image,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'الملف الشخصي',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily2,
                        fontSize: 20,
                      ),
                    ),
                    leading: Icon(
                      Icons.shop,
                      color: AppColors.primaryMain,
                    ),
                    onTap: () => AppNavigator.go(
                      UserScreen(
                        ismyprofile: 'yes',
                        user: Provider.of<UserProvider>(context, listen: false)
                            .currentUser,
                      ),
                      isNew: false,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily2,
                        fontSize: 20,
                      ),
                    ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: AppColors.primaryMain,
                    ),
                    onTap: () async {
                      final secureStorage = getIt<CacheServices>(
                        instanceName: SecureStorageConsumer.name,
                      );
                      await secureStorage.removeData(
                        key: AppStrings.secureStorage.token,
                      );
                      AppNavigator.pushAndRemoveUntil(LoginPage());
                    },
                  ),
                  ListTile(
                    title: Text(
                      'حذف حسابي',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily2,
                        fontSize: 20,
                      ),
                    ),
                    leading: Icon(
                      Icons.delete_rounded,
                      color: Colors.red,
                    ),
                    onTap: () async {
                      AppConstants.showAppDialog(child: DeleteAccountDialog());
                    },
                  ),
                ],
              ),
            ),
            // check for update button at the end of the drawer
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
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
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        );
                      },
                    )),
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
          await shorebirdCodePush.isNewPatchAvailableForDownload();

      if (isUpdateAvailable) {
        await shorebirdCodePush.downloadUpdateIfAvailable();
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
