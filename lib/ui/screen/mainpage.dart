import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/ui/widgets/custom_widget/appbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  _main_pageState createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        drawer: CustomDrawer(),
        bottomNavigationBar: Consumer<navigatorProvider>(builder: (context, indexProvider, child) {
          return BottomNavigationBar(
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
                  activeIcon: Icon(
                    Icons.person,
                    color: kMainColor,
                  ),
                  icon: Icon(Icons.person),
                  label: 'العملاء',
                  backgroundColor: kMainColor),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.description,
                  color: kMainColor,
                ),
                icon: Icon(Icons.description),
                label: 'الفواتير',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.insert_chart,
                  color: kMainColor,
                ),
                icon: Icon(Icons.insert_chart),
                label: 'التقارير',
              ),
            ],
          );
        }),
        body: Consumer<navigatorProvider>(builder: (context, indexProvider, child) {
          return IndexedStack(
            index: indexProvider.get(),
            children: indexProvider.pages, //New
          );
        }));
  }
}
