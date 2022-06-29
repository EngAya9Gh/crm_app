import 'dart:ffi';

import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/screen/config/addreson.dart';
import 'package:crm_smart/ui/screen/config/config_view.dart';
import 'package:crm_smart/ui/screen/config/maincityview.dart';
import 'package:crm_smart/ui/screen/config/manageview.dart';
import 'package:crm_smart/ui/screen/config/regoin_view.dart';
import 'package:crm_smart/ui/screen/config/reson_view.dart';
import 'package:crm_smart/ui/screen/privilges/addmanage.dart';
import 'package:crm_smart/ui/screen/privilges/checklevel.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/user/alluser.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../widgethomeitem.dart';

class managmentpage extends StatefulWidget {
  const managmentpage({Key? key}) : super(key: key);

  @override
  _managmentpageState createState() => _managmentpageState();
}

class _managmentpageState extends State<managmentpage> {
  @override void didChangeDependencies()async {

    Provider.of<config_vm>(context, listen: false).getAllConfig();

    super.didChangeDependencies();
  }
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      await Provider.of<privilge_vm>(context, listen: false)
          .getprivlg_usercurrent();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'الإدارة',
          style: TextStyle(color: kWhiteColor,
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Consumer<privilge_vm>(
    builder: (context, privilge, child){
          return Column(children: [
            privilge.checkprivlge('3')==true?
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      AllUserScreen()));
            }, title: 'إدارة المستخدمين'):Container(),

            privilge.checkprivlge('17')==true?
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      check_level()));
            }, title: 'ادارة الصلاحيات'):Container(),

            privilge.checkprivlge('4')==true?
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context)
                  => ProductView(),
                  fullscreenDialog: true,
                ),
              );
            }, title: 'المنتجات '):Container(),
            privilge.checkprivlge('20')==true?
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context)
                  => config_view(),

                ),
              );
            }, title: 'ملف الإعدادات '):Container(),
            privilge.checkprivlge('52')==true?
            buildSelectCategory(
                subtitle:Provider.of<user_vm_provider>
                  (context,listen:  false).currentUser.nameCountry,
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context)
                  //     => config_view(),
                  //
                  //   ),
                  // );
                }, title: 'تغيير الدولة'):Container(),
            privilge.checkprivlge('63')==true?
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context)
                      => regoinview(),

                    ),
                  );
                }, title: 'إداراة الفروع'):Container(),
            privilge.checkprivlge('64')==true?
        buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context)
                      => managview(),
                    ),
                  );
                }, title: 'إضافة الإدارات'):Container(),
            privilge.checkprivlge('73')==true?
        buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context)
                      => resoan_view(type:'client'),

                    ),
                  );
                }, title: 'أسباب الانسحاب'):Container(),
           privilge.checkprivlge('77')==true?
        buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context)
                      => maincityview(),

                    ),
                  );
                }, title: ' ادارة المناطق والمدن'):Container(),
  privilge.checkprivlge('74')==true?
        buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context)
                      => resoan_view(type:'ticket'),

                    ),
                  );
                }, title: 'أنواع التذاكر'):Container(),

            //config_view
          ],);}
        ),

      ),
    );
  }
}
