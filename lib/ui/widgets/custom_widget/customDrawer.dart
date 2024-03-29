import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/ui/screen/user/usertest_view.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/di_container.dart';
import '../../../features/links/presentation/pages/manage_links_page.dart';
import '../animated_dialog.dart';
import '../delete_acconut_dialog.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  //final controllerUsers = Get.find<AllUserVMController>();
  @override
  Widget build(BuildContext context) {
    var controllerUsers = Provider.of<UserProvider>(context, listen: true);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Colors.white24 //Color(0xFF56ccf2),
                      ),
              accountName: Text(
                controllerUsers.currentUser.nameUser.toString(),
                style: TextStyle(
                    fontFamily: kfontfamily2,
                    color: context.colorScheme.onBackground),
              ),

              accountEmail: Text(
                controllerUsers.currentUser.email.toString(),
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
                      // Image.network(Provider.of<user_vm_provider>(context,listen: true)
                      //     .currentUser!.img_image! ,
                      //width: 200,height: 200,fit: BoxFit.fill,

                      // FileImage(
                      //     File(Provider.of<user_vm_provider>(context,listen: true).currentUser!.img_image!))
                      //     as ImageProvider
                      : Text(Provider.of<UserProvider>(context, listen: true)
                          .currentUser
                          .nameUser
                          .toString()
                          .substring(0, 1))),
              // Provider.of<user_vm_provider>(context,listen: false).currentUser!.img_image!.isNotEmpty
              //     ?
              //FileImage(
              // File(Provider.of<user_vm_provider>(context,listen: false).currentUser!.img_image!)
              //)
              //as ImageProvider
              //     :
              // Text("AG",
              //   style: TextStyle(
              //     fontSize: 50,
              //     color: Colors.amber,),),
              //  ),
            ),
            // ListTile(
            //   title: Text(' الدولة',  style: TextStyle(
            //       fontFamily: kfontfamily2),
            // ),
            //   leading: Icon(Icons.location_city_rounded,color: kMainColor,),
            //   onTap: (){
            //     Navigator.push(
            //       context,
            //       CupertinoPageRoute<void>(
            //         builder: (BuildContext context)
            //         => select_country(),
            //         fullscreenDialog: true,
            //       ),
            //     );
            //   },
            // ),

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
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<void>(
                      builder: (BuildContext context) => UserScreen(
                          ismyprofile: 'yes',
                          userModel:
                              Provider.of<UserProvider>(context, listen: false)
                                  .currentUser
                          //index: index,
                          )),
                );
                // ProductView();
              },
            ),
            // ListTile(
            //   title: Text(
            //     'يوزرات تجريبية',
            //     style: TextStyle(
            //       fontFamily: kfontfamily2,
            //       fontSize: 20,
            //     ),
            //   ),
            //   leading: Icon(
            //     Icons.supervised_user_circle,
            //     color: kMainColor,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       CupertinoPageRoute<void>(
            //           builder: (BuildContext context) => usertest_view()),
            //     );
            //     // ProductView();
            //   },
            // ),
            // ListTile(
            //   title: Text(
            //     'الروابط الهامة',
            //     style: TextStyle(
            //       fontFamily: kfontfamily2,
            //       fontSize: 20,
            //     ),
            //   ),
            //   leading: Icon(
            //     Icons.supervised_user_circle,
            //     color: kMainColor,
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         CupertinoPageRoute(builder: (context) => ManageLinkPage()));
            //     // ProductView();
            //   },
            // ),
            // Provider.of<privilge_vm>(context, listen: true).checkprivlge('117') == true
            //     ? ListTile(
            //   title: Text(
            //     'سباق الفروع',
            //     style: TextStyle(fontFamily: kfontfamily2),
            //   ),
            //   leading: Icon(
            //     Icons.account_tree_rounded,
            //     color: kMainColor,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       CupertinoPageRoute<void>(builder: (BuildContext context) => BranchRaceView()),
            //     );
            //     // ProductView();
            //   },
            // ):Container(),
            // Provider.of<privilge_vm>(context, listen: true).checkprivlge('118') == true
            //     ? ListTile(
            //         title: Text(
            //           'سباق الموظفين',
            //           style: TextStyle(fontFamily: kfontfamily2),
            //         ),
            //         leading: Icon(
            //           Icons.bar_chart,
            //           color: kMainColor,
            //         ),
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             CupertinoPageRoute<void>(builder: (BuildContext context) => EmployeeRacePage()),
            //           );
            //           // ProductView();
            //         },
            //       )
            //     : Container(),
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
                SharedPreferences preferences = getIt<SharedPreferences>();
                await preferences.clear();
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => login()),
                      (route) => false);
                }

                // preferences.setBool(kKeepMeLoggedIn, false);
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
    );
  }
}
