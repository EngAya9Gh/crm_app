import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/core/common/helpers/wait_for_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../../constants.dart';
import '../../../core/common/widgets/app_elvated_button.dart';
import '../../../core/services/cache_services/cache_services.dart';
import '../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../core/services/di/di_container.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/extensions/build_context.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../screen/user/userview.dart';
import '../animated_dialog.dart';
import '../delete_acconut_dialog.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

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
                          fontFamily: kfontfamily2,
                          color: context.colorScheme.onBackground),
                    ),
                    accountEmail: Text(
                      Provider.of<UserProvider>(context, listen: true)
                          .currentUser
                          .email
                          .toString(),
                      style: TextStyle(
                          fontFamily: kfontfamily2,
                          color: context.colorScheme.onBackground),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? Color(0xFF56ccf2)
                              : Colors.grey,
                      child: (Provider.of<UserProvider>(context, listen: true)
                                  .currentUser
                                  .img_image
                                  ?.isNotEmpty ??
                              false)
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: CachedNetworkImage(
                                  width: 500,
                                  height: 500,
                                  fit: BoxFit.fill,
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                            child: CircularProgressIndicator(
                                              value: progress.progress,
                                            ),
                                          ),
                                  imageUrl: Provider.of<UserProvider>(context,
                                          listen: true)
                                      .currentUser
                                      .img_image!),
                            )
                          : Text(
                              Provider.of<UserProvider>(context, listen: true)
                                  .currentUser
                                  .nameUser
                                  .toString()
                                  .substring(0, 1)),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'الملف الشخصي',
                      style: TextStyle(
                        fontFamily: kfontfamily2,
                        fontSize: 20,
                      ),
                    ),
                    leading: Icon(
                      Icons.shop,
                      color: kMainColor,
                    ),
                    onTap: () => AppNavigator.push(UserScreen(
                      ismyprofile: 'yes',
                      userModel:
                          Provider.of<UserProvider>(context, listen: false)
                              .currentUser,
                    )),
                  ),
                  ListTile(
                    title: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontFamily: kfontfamily2,
                        fontSize: 20,
                      ),
                    ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: kMainColor,
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
                        fontFamily: kfontfamily2,
                        fontSize: 20,
                      ),
                    ),
                    leading: Icon(
                      Icons.delete_rounded,
                      color: Colors.red,
                    ),
                    onTap: () async {
                      AnimatedDialog.show(
                        context,
                        child: DeleteAccountDialog(),
                      );
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
                          child: Text(
                            'تحقق من وجود تحديثات',
                            style: context.textTheme.titleSmall?.copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
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

      if (!isUpdateAvailable) {
        await shorebirdCodePush.downloadUpdateIfAvailable();
        await Future.delayed(const Duration(milliseconds: 500));
        AppConstants.showSnakeBar(
          'تم تحميل التحديث بنجاح',
        );
        AppConstants.showSnakeBar(
          'سيتم إعادة تشغيل التطبيق لتفعيل التحديث',
        );
        waitForSnackbar(
          2,
          () async {
            await SystemChannels.platform
                .invokeMethod('SystemNavigator.pop', true);
          },
        );
        return;
      }
      AppConstants.showSnakeBar('لا يوجد تحديثات جديدة');
    } catch (e) {
      debugPrint('Error while checking for updates: $e');
    }
  }
}
