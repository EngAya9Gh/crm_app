import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';

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
            hint: "نية الاشتراك",
            items: SubscribingIntentionLevelEnum.values,
            itemAsString: (value) => value!.value,
            height: 165.scaleHeight,
            selectedItem: subscribingIntentionLevel,
            onChanged: onChanged,
            itemAsIcon: (value) {
              return Icon(
                Icons.flag,
                color: value!.color,
                size: 25.scaleIconsSize,
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
          AppIcon(
            Icons.flag,
            color: subscribingIntentionLevel?.color,
          ),
        ],
      ],
    );
  }
}
