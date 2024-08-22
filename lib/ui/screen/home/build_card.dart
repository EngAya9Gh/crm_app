import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/models/page_model.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_navigator.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    super.key,
    required this.pages,
  });

  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        itemCount: pages.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.9,
          mainAxisExtent: 170,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          maxCrossAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return buildCardCategory(
            image: pages[index].image ?? '',
            item: pages[index].title,
            onTap: () => AppNavigator.push(pages[index].page),
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
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppFonts.fontFamily3,
                        color: Colors.black),
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
