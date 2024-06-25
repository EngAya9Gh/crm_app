import 'package:collection/collection.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../manager/dates_table_cubit.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserDropdown extends StatefulWidget {
  const UserDropdown();

  @override
  State<UserDropdown> createState() => _UserDropdownState();
}

class _UserDropdownState extends State<UserDropdown> {
  late final DatesTableCubit datesTableCubit;

  @override
  void initState() {
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return BlocBuilder<DatesTableCubit, DatesTableState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: CustomSearchableDropDown<UserModel>(
                      hint: 'الموظف',
                      items: userProvider.usersSupportManagement,
                      itemAsString: (u) => u!.userAsString(),
                      onChanged: (user) {
                        datesTableCubit.filterIdUser = user!.idUser;
                        _reFetchEvents(context);
                      },
                      selectedItem: userProvider.usersSupportManagement
                          .firstWhereOrNull((element) {
                        return element.idUser == datesTableCubit.filterIdUser;
                      }),
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
                  if (datesTableCubit.filterIdUser?.isNotEmpty ?? false) ...[
                    IconButton(
                      onPressed: () {
                        datesTableCubit.filterIdUser = null;
                        _reFetchEvents(context);
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

  void _reFetchEvents(BuildContext context) {
    datesTableCubit.getDateInstallation(
      GetDateInstallationParams(
        fkCountry: AppConstants.currentCountry(context)!,
      ),
    );
  }
}
