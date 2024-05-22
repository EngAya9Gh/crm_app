import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDropdown extends StatelessWidget {
  const UserDropdown();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer2<UserProvider, EventProvider>(
        builder: (context, userProvider, eventProvider, child) {
          return Row(
            children: [
              if (eventProvider.selectedFkUser != null &&
                  eventProvider.appointmentsState.isSuccess) ...[
                IconButton(
                  onPressed: () {
                    userProvider.changevalueuser(null);
                    eventProvider.onChangeFkUser('');
                  },
                  icon: Icon(Icons.highlight_off),
                ),
                SizedBox(width: 10),
              ],
              Expanded(
                child: CustomSearchableDropDown<UserModel>(
                  hint: 'الموظف',
                  items: userProvider.usersSupportManagement,
                  itemAsString: (u) => u!.userAsString(),
                  onChanged: (data) {
                    final idUser = data!.idUser!;
                    userProvider.changevalueuser(data);
                    eventProvider.onChangeFkUser(idUser);
                  },
                  selectedItem: userProvider.selectedUser,
                  filterFn: (user, filter) => user.getfilteruser(filter),
                  compareFn: (item, selectedItem) =>
                      item.idUser == selectedItem.idUser,
                  validator: (value) {
                    if (value == null) {
                      return 'يرجى اختيار الموظف';
                    }
                    return null;
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
