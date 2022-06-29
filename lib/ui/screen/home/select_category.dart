import 'package:crm_smart/constants.dart';
import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/this_title_category.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategory extends StatelessWidget {
  final int index;
  final List list;

   SelectCategory({required this.index, required this.list, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          itemCategory[index],
          style: TextStyle(
            fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
          Column(children: [
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {  }, title: ''),
            buildSelectCategory(         colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,onTap: () {  }, title: ''),

          ],),
        // ListView.builder(
        //   itemCount: list.length,
        //   itemBuilder: (context, index) {
        //     return  buildSelectCategory(
        //         title: list[index],
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context)=>
        //                   tabclients()
        //           ));
        //               // Navigator.push(context, MaterialPageRoute(builder: (context)=>
        //               //     ThisTitleCategory(
        //               //       // userModel: controllerUsers.usersList[index],
        //               //       index: index,
        //               //       list: list,
        //               //     )
        //               // ));
        //
        //         });
        //   },
        // ),
      ),
    );
  }

//buildSelectCategory
}
