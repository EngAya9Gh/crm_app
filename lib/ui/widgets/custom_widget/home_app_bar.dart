import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/theme/theme.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../core/utils/extensions/build_context.dart';
import '../../../generated/assets.dart';
import '../../../view_model/notify_vm.dart';
import '../../screen/notification/notifypage.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
    this.leading,
    this.backgroundColor,
  });

  final Widget? leading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var notify = Provider.of<notifyvm>(context, listen: true);
    return AppBar(
      key: key,
      leading: leading,
      backgroundColor: backgroundColor,
      title: Image.asset(
        Assets.imagesLogoCrmLong,
        height: 50,
        width: 150,
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 20,
                  color: context.colorScheme.black,
                ),
                onPressed: () {
                  notify.setRead_notify_vm();
                  AppNavigator.push(notify_pageview());
                },
              ),
              notify.countnotify != 0
                  ? Positioned(
                      top: 5,
                      right: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            notify.countnotify.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                        ),
                        height: 15,
                        width: 15,
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ],
      iconTheme: IconThemeData(size: 10),
      foregroundColor: AppColors.kWhiteColor,
      // leading: Image(image:
      //  AssetImage('images/Image-3.jpg'),fit: BoxFit.fill,height: 10,width: 10,
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
