import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_logo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/app_dynamic_links.dart';
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
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final NotificationsCubit _notificationsCubit;
  late final UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    _notificationsCubit = context.read<NotificationsCubit>()..init();
    _userProvider = context.read<UserProvider>();

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
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 60)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 303.scaleWidth,
          height: double.infinity,
          color: AppColors.primaryMain,
          child: ListView(
            children: [
              CustomLogo(height: 100.scaleHeight),
              ...SectionsLists.homeSections.mapIndexed(
                (index, e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DrawerExpansionTile(
                      title: e.title,
                      icon: e.icon,
                      children: _prepareChildren(e.subSections),
                      initiallyExpanded: index == 0,
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: AppColors.background,
                child: Column(
                  children: [
                    24.vertical,
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
                                imageUrl: AppConstants.currentUser.img_image,
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
                            ...SectionsLists.salesSections.mapIndexed(
                              (index, element) {
                                return AppChip(
                                  text: element.title,
                                  width: constraints.maxWidth / 3.3,
                                );
                              },
                            ),
                            // ...List.generate(
                            //   20,
                            //   (index) {
                            //     return AppChip(text: "AppChip");
                            //   },
                            // ),
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
      ],
    );
  }

  List<Widget> _prepareChildren(List<SectionModel> subSections) {
    return subSections
        .map(
          (e) => ListTile(
            leading: AppIcon(
              Icons.circle,
              color: AppColors.secondaryMain,
            ),
            title: AppText(
              e.title,
              style: AppStyles.regular18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            onTap: () {},
          ),
        )
        .toList();
  }
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.text,
    this.width,
  });

  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
