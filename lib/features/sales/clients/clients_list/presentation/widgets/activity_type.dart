import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/client/client_registration_type_enum.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../model/ActivityModel.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../../view_model/user_vm_provider.dart';

class ActivityType extends StatelessWidget {
  const ActivityType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Consumer<ActivityProvider>(
          builder: (context, cart, child) {
            return CustomSearchableDropDown<ActivityModel>(
              hint: _isRequiredActivity(value) ? "نوع النشاط*" : "نوع النشاط",
              items: cart.activitiesList,
              itemAsString: (u) => u!.userAsString(),
              selectedItem: cart.selectedActivity,
              onChanged: (data) {
                cart.onChangeSelectedActivity(data);
              },
              filterFn: (activity, filter) =>
                  activity.getFilterActivityType(filter),
              validator: (val) {
                if (_isRequiredActivity(value) && val == null) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
            );
          },
        );
      },
    );
  }

  bool _isRequiredActivity(UserProvider userProvider) {
    return !ClientRegistrationType.isWrongFromString(
        userProvider.selectedClientRegistrationType);
  }
}
