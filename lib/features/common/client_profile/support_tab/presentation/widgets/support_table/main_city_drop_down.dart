import 'package:crm_smart/core/common/widgets/custom_multi_selection_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainCityDropdown extends StatefulWidget {
  @override
  State<MainCityDropdown> createState() => _MainCityDropdownState();
}

class _MainCityDropdownState extends State<MainCityDropdown> {
  late final SupportTabCubit supportTabCubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
    mainCityProvider = context.read<MainCityProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer2<MainCityProvider, EventProvider>(
        builder: (context, mainCityProvider, eventProvider, child) {
          return BlocBuilder<SupportTabCubit, SupportTabState>(
            buildWhen: (previous, current) {
              return previous.refreshUi != current.refreshUi;
            },
            builder: (context, state) {
              return CustomMultiSelectionDropdown<MainCityModel>(
                items: supportTabCubit.allMainCities,
                selectedItems: supportTabCubit.filterSelectedMainCity,
                hint: 'المنطقة',
                onSave: (data) {
                  _onSave(
                    context: context,
                    data: data,
                    eventProvider: eventProvider,
                    mainCityProvider: mainCityProvider,
                  );
                },
                onItemAdded: (selectedItems, addedItem) {
                  supportTabCubit.filterSelectedMainCity = selectedItems;
                },
                onItemRemoved: (selectedItems, removedItem) {
                  supportTabCubit.filterSelectedMainCity = selectedItems;
                },
                itemAsString: (u) => u!.userAsString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.messageEmpty;
                  }
                  return null;
                },
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              );
            },
          );
        },
      ),
    );
  }

  void _onSave({
    required BuildContext context,
    required List<MainCityModel> data,
    required EventProvider eventProvider,
    required MainCityProvider mainCityProvider,
  }) {
    supportTabCubit.getDateInstallation(
      GetDateInstallationParams(
        fkCountry: AppConstants.currentCountry(context)!,
      ),
      onSuccess: (eventsList) {
        eventProvider.handleEventsMap(eventsList);
      },
    );
  }
}
