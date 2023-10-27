import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';

class FilterClientsSheet extends StatefulWidget {
  const FilterClientsSheet({ key});

  @override
  State<FilterClientsSheet> createState() => _FilterClientsSheetState();
}

class _FilterClientsSheetState extends State<FilterClientsSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "فلترة العملاء:",
                style: context.textTheme.bodyLarge ,
              ),
               TextButton(
                // text: "إلغاء الكل",
                style: context.theme.textButtonTheme.style?.copyWith(
                  foregroundColor: MaterialStatePropertyAll(context.colorScheme.error),
                  overlayColor: MaterialStatePropertyAll(context.colorScheme.error.withOpacity(0.1))
                ),
                onPressed: () {}, child: Text("إلغاء الكل"),
              ),
            ],
          ),
          // 20.verticalSpace,
          // Row(
          //   children: [
          // //     Expanded(
          // //       child: AppDropdownButtonFormField(
          // //         items: List.generate(5, (index) => "item $index"),
          // //         onChange: (value) {},
          // //         hint: "الفرع",
          // //       ),
          // //     ),
          // //     // 10.horizontalSpace,
          // //     SizedBox(width: 3,),
          // //     Expanded(
          // //       child: AppDropdownButtonFormField(
          // //         items: List.generate(5, (index) => "item $index"),
          // //         onChange: (value) {},
          // //         hint: "الحالة",
          // //       ),
          // //     ),
          //   ],
          // ),
          // // 10.verticalSpace,
          // // AppDropdownSearch(
          // //     items: List.generate(5, (index) => "item $index"),
          // //   hintText: "الموظف",
          // //   hintSearch: "ابحث حسب اسم الموظف....",
          // // ),
          // // 10.verticalSpace,
          // SizedBox(height: 10),
          // AppDropdownButtonFormField(
          //   items: List.generate(5, (index) => "item $index"),
          //   onChange: (value) {},
          //   hint: "النشاط",
          // ),
          // 20.verticalSpace,
        ],
      ),
    );
  }
}
