import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserDropdown extends StatefulWidget {
  const UserDropdown();

  @override
  State<UserDropdown> createState() => _UserDropdownState();
}

class _UserDropdownState extends State<UserDropdown> {
  late final SupportTabCubit supportTabCubit;

  @override
  void initState() {
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
    super.initState();
  }

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
                    // eventProvider.onChangeFkUser('');
                    supportTabCubit.getDateInstallation(
                      GetDateInstallationParams(
                        fkCountry: AppConstants.currentCountry(context)!,
                        fkUser: '',
                        mainCityFks: eventProvider.selectedMainCityFks,
                      ),
                    );
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
                    supportTabCubit.getDateInstallation(
                      GetDateInstallationParams(
                        fkCountry: AppConstants.currentCountry(context)!,
                        fkUser: idUser,
                        mainCityFks: eventProvider.selectedMainCityFks,
                      ),
                    );
                    // eventProvider.onChangeFkUser(idUser);
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
