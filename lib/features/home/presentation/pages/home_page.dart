import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/config/app_dynamic_links.dart';
import '../../../../ui/widgets/custom_widget/customDrawer.dart';
import '../../../../ui/widgets/custom_widget/home_app_bar.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../widgets/adaptive_body.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final NotificationsCubit _notificationsCubit;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = new GlobalKey<ScaffoldState>();
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
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 60)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: HomeAppBar(
          backgroundColor: Colors.grey.withOpacity(0.1),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: context.colorScheme.black,
              size: 25.scaleIconsSize,
            ),
            tooltip: 'Menu',
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        drawer: CustomDrawer(),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: AdaptiveBody(pages: SectionsLists.HomeSections),
          ),
        ),
      ),
    );
  }
}
