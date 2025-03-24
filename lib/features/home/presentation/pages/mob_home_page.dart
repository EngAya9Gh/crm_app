import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../ui/widgets/custom_widget/customDrawer.dart';
import '../../../../ui/widgets/custom_widget/home_app_bar.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../widgets/adaptive_body.dart';

class MobHomePage extends StatefulWidget {
  MobHomePage({super.key});

  @override
  _MobHomePageState createState() => _MobHomePageState();
}

class _MobHomePageState extends State<MobHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        // context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        Provider.of<RegionProvider>(context, listen: false).getRegions(),
        Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket'),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        scaffoldKey: _scaffoldKey,
        appBar: HomeAppBar(
          backgroundColor: Colors.grey.withOpacity(0.1),
          leading: IconButton(
            icon: AppIcon(
              Icons.menu,
              color: context.colorScheme.black,
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
            child: AdaptiveBody(pages: SectionsLists.homeSections),
          ),
        ),
      ),
    );
  }
}
