import 'package:crm_smart/constants.dart';
import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/ui/screen/home/select_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCard extends StatelessWidget {
  BuildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: GridView.builder(
            itemCount: itemCategory.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.9,
              mainAxisExtent: 170,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              maxCrossAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return buildCardCategory(
                  image: imageList[index],
                  item: itemCategory[index],
                  ontap: () =>
                     Navigator.push(context,
                         MaterialPageRoute(
                             builder: (context)=>
                             listwidget[index]
                     ))
              );},
            ),
    ));
  }

  Widget buildCardCategory({
    required String image,
    required String item,
    required Function() ontap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: ontap,
        child: Container(
          //width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     spreadRadius: 3,
            //     blurRadius: 5,
            //   ),
            // ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image(image: AssetImage('assest/images/bill.png')),

                SizedBox(
                  height: 50,
                  child: Image.asset(
                    image,
                   // color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item,
                  style: TextStyle(fontSize: 15,
                      fontFamily: kfontfamily3,
                      color: Colors.black),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
