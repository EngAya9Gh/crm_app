import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
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
          return BlocBuilder<SupportTabCubit, SupportTabState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: CustomSearchableDropDown<UserModel>(
                      hint: 'الموظف',
                      items: userProvider.usersSupportManagement,
                      itemAsString: (u) => u!.userAsString(),
                      onChanged: (data) {
                        supportTabCubit.filterIdUser = data!.idUser;
                        supportTabCubit.getDateInstallation(
                          GetDateInstallationParams(
                            fkCountry: AppConstants.currentCountry(context)!,
                          ),
                          onSuccess: (eventsList) {
                            eventProvider.handleEventsMap(eventsList);
                          },
                        );
                      },
                      selectedItem: userProvider.usersSupportManagement
                          .firstWhereOrNull((element) =>
                              element.idUser == supportTabCubit.filterIdUser),
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
                  if (supportTabCubit.filterIdUser?.isNotEmpty ?? true) ...[
                    IconButton(
                      onPressed: () {
                        supportTabCubit.filterIdUser = null;
                        supportTabCubit.getDateInstallation(
                          GetDateInstallationParams(
                            fkCountry: AppConstants.currentCountry(context)!,
                          ),
                          onSuccess: (appointmentsList) {
                            eventProvider.handleEventsMap(appointmentsList);
                          },
                        );
                      },
                      icon: Icon(Icons.highlight_off),
                    ),
                    SizedBox(width: 10),
                  ],
                ],
              );
            },
          );
        },
      ),
    );
  }
}
