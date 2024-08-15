import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';
import '../../../../core/common/models/page_model.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../app/presentation/widgets/app_text.dart';

class GridCardCategory extends StatelessWidget {
  const GridCardCategory({
    super.key,
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => AppNavigator.push(page.page),
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
                  page.image == 'assest/images/race.png'
                      ? SizedBox(
                          height: 50,
                          child: Image.asset(
                            page.image ?? '',
                            color: Colors.blue,
                          ),
                        )
                      : SizedBox(
                          height: 50,
                          child: Image.asset(page.image ?? ''),
                        ),
                  SizedBox(height: 5),
                  AppText(
                    page.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: kfontfamily3,
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
