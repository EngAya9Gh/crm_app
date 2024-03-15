import 'package:crm_smart/constants.dart';
import 'package:crm_smart/constantsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCard extends StatelessWidget {
  BuildCard({
    required this.imageList,
    required this.itemCategory,
    required this.type,
    Key? key

  }) : super(key: key);
  String type='';
  List<String > imageList=[];
  List<String > itemCategory=[];
  @override
  Widget build(BuildContext context) {
    return
      Center(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        itemCount: itemCategory.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.9,
          mainAxisExtent: 170,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          maxCrossAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return buildCardCategory(
              image: imageList[index],
              item: itemCategory[index],
              onTap: () =>
              type=='home'?  Navigator.push(context, CupertinoPageRoute(builder: (context) => listwidget[index]))
              :Navigator.push(context, CupertinoPageRoute(builder: (context) => listwidget_sales[index]))
          );
        },
      ),
    );
  }

  Widget buildCardCategory({
    required String image,
    required String item,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image == 'assest/images/race.png'
                      ? SizedBox(
                          height: 50,
                          child: Image.asset(
                            image,
                            color: Colors.blue,
                          ),
                        )
                      : SizedBox(
                          height: 50,
                          child: Image.asset(image),
                        ),
                  SizedBox(height: 5),
                  Text(
                    item,
                    style: TextStyle(fontSize: 15, fontFamily: kfontfamily3, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
