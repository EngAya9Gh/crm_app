import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/ui/widgets/custom_widget/appbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'client/clients.dart';
import 'invoice/invoces.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  _main_pageState createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  final controllerUsers = Get.find<AllUserVMController>();

  final _key = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0; //New

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState()  {
    //controllerUsers.getcurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //controllerUsers.getcurrentUser();

    //var indexProvider= Provider.of<navigatorProvider>(context);
    print("after build");
    return Scaffold(
      appBar:customAppbar(),
        drawer:
        //Obx(() {
       CustomDrawer(),
       // }),
          bottomNavigationBar:Consumer<navigatorProvider>(
            builder: (context, indexProvider, child) {
              return BottomNavigationBar(
                //showSelectedLabels: false,
                //showUnselectedLabels: false,
                unselectedFontSize: 10,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey.withOpacity(0.7),
                backgroundColor: Colors.white,
                currentIndex: indexProvider.get(),
                onTap: (index) {
                  indexProvider.setCurrentIndex(index);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.person, color: kMainColor,),
                      icon: Icon(Icons.person),
                      label: 'العملاء',
                      backgroundColor: kMainColor
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.description, color: kMainColor,),
                    icon: Icon(Icons.description),
                    label: 'الفواتير',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.insert_chart, color: kMainColor,),
                    icon: Icon(Icons.insert_chart),
                    label: 'التقارير',
                  ),
                ],
              );
            }),
        body: Consumer<navigatorProvider>(
        builder: (context, indexProvider, child) {
          return
            IndexedStack(
              index: indexProvider.get(),
              children: indexProvider.pages, //New
            );
        })
    );
  }
}
