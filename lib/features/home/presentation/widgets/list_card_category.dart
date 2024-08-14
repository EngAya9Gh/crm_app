import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';
import '../../../../core/common/models/page_model.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../app/presentation/widgets/app_text.dart';

class ListCardCategory extends StatelessWidget {
  const ListCardCategory({
    super.key,
    required this.page,
  });

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.push(page.page),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              page.title,
              style: TextStyle(
                fontSize: 15,
                fontFamily: kfontfamily3,
                color: Colors.black,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12).r,
              child: page.image == 'assest/images/race.png'
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
            ),
          ],
        ),
      ),
    );
  }
}
