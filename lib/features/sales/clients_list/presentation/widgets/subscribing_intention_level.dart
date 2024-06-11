import 'package:crm_smart/core/common/enums/client/subscribing_intention_level_enum.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribingIntentionLevelWidget extends StatelessWidget {
  const SubscribingIntentionLevelWidget({
    super.key,
    this.subscribingIntentionLevel,
    this.onChanged,
  });

  final SubscribingIntentionLevelEnum? subscribingIntentionLevel;
  final Function(SubscribingIntentionLevelEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropDown<SubscribingIntentionLevelEnum>(
            hint: "priority",
            items: SubscribingIntentionLevelEnum.values,
            itemAsString: (value) => value!.name,
            height: 120.h,
            selectedItem: subscribingIntentionLevel,
            onChanged: onChanged,
            itemAsIcon: (value) {
              return Icon(
                Icons.flag,
                color: value!.color,
                size: 20.sp,
              );
            },
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 15,
            ),
          ),
        ),
        ...[
          SizedBox(width: 10),
          Icon(
            Icons.flag,
            color: subscribingIntentionLevel?.color,
            size: 20.sp,
          ),
        ],
      ],
    );
  }
}
