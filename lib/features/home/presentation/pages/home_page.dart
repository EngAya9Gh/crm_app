import 'package:crm_smart/core/common/widgets/app_adaptive_builder.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_dynamic_links.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import 'mob_home_page.dart';
import 'web_home_page.dart';

class HomePage extends StatefulWidget {
  HomePage({ this.child, super.key});
  final Widget? child;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NotificationsCubit _notificationsCubit;

  @override
  void initState() {
    super.initState();
    _notificationsCubit = context.read<NotificationsCubit>()..init();
    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {
    //   if (message != null) {
    //     String typeNotify = message.data['Typenotify'];
    //     AppDynamicLinks.routeNotifyTo(typeNotify, context, message.data, null);
    //   }
    // });
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   if (message.notification != null) {}
    //   _notificationsCubit.increaseNotificationCount();
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   _notificationsCubit.increaseNotificationCount();
    //   String typeNotify = event.data['Typenotify'];
    //   AppDynamicLinks.routeNotifyTo(typeNotify, context, event.data, null);
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Future.wait([
    //     context.read<NotificationsCubit>().getUnreadNotificationsCount(),
    //     Provider.of<UserProvider>(context, listen: false).getAllUsers(),
    //     Provider.of<RegionProvider>(context, listen: false).getRegions(),
    //     Provider.of<product_vm>(context, listen: false).getproduct_vm(),
    //     Provider.of<ClientTypeProvider>(context, listen: false)
    //         .getreasons('ticket'),
    //   ]);
    // });
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
      child: AppLayoutBuilder(
        smallBuilder: (context) => MobHomePage(),
        mediumBuilder: (context) => WebHomePage(child: widget.child,),
      ),
    );
  }
}
