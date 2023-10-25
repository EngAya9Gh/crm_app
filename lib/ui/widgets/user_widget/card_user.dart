

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import '../custom_widget/text_uitil.dart';
import 'carduserbuild.dart';

class CardUsers extends StatefulWidget {
  CardUsers({Key? key}) : super(key: key);

  @override
  _CardUsersState createState() => _CardUsersState();
}

class _CardUsersState extends State<CardUsers> {
  //final controllerUsers = Get.find<AllUserVMController>();
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUsersVm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final controllerUsers =
    Provider.of<UserProvider>(context, listen: true);


    //return Obx( () {
    if (controllerUsers.allUsers.length == 0) {
      return Consumer<UserProvider>(builder: (context, cart, child) {
        return const Center(
          child: Text('لا يوجد مستخدمين'),
          // CircularProgressIndicator(
          //   color: kMainColor,
          // ),
        );
      });
    } else {
      return
        Directionality(
        textDirection: TextDirection.rtl,
        child: Expanded(
          child: ListView.separated(
            itemCount: controllerUsers.allUsers.length,
            itemBuilder: (context, index) {
              return Consumer<UserProvider>(
                  builder: (context, cart, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildCardUsers(
                        usermodell: controllerUsers.allUsers[index],
                      ),
                    );
                  });
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 30, left: 20, bottom: 5),
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              );
            },
          ),

        ),
      );
    }
    //   },
    // );
  }
}