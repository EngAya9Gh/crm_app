import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/regions/presentation/pages/regions_searchable_drop_down.dart';
import '../manager/greeting_communication_cubit.dart';

class FilterGreetingCommunicationSheet extends StatefulWidget {
  const FilterGreetingCommunicationSheet({super.key});

  @override
  State<FilterGreetingCommunicationSheet> createState() =>
      _FilterGreetingCommunicationSheetState();
}

class _FilterGreetingCommunicationSheetState
    extends State<FilterGreetingCommunicationSheet> {
  late final GreetingCommunicationCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<GreetingCommunicationCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _cubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _cubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            StatefulBuilder(
              builder: (context, refresh) {
                return SwitchListTile(
                  value: _cubit.filterEntity.isMyClientsNotifier.value,
                  onChanged: (value) {
                    _cubit.filterEntity.isMyClientsNotifier.value = value;
                    refresh(() {});
                    if (value) {
                      _cubit.filterEntity.userIdNotifier.value =
                          AppConstants.currentUser(context)!.idUser;
                    } else {
                      _cubit.filterEntity.userIdNotifier.value = null;
                    }
                  },
                  title: AppText("عملائي"),
                );
              },
            ),
            10.height,
            RegionSearchableDropDown(
              hint: "الفرع",
              selectedRegionId:
                  _cubit.filterEntity.regionIdNotifier.value?.regionId,
              onSelected: (region) {
                _cubit.filterEntity.regionIdNotifier.value = region;
              },
            ),
            10.height,
            Consumer<ClientTypeProvider>(builder: (context, cart, child) {
              return CustomDropDown<String>(
                hint: "الحالة",
                items: cart.type_of_welcome,
                itemAsString: (item) => item!,
                selectedItem: _cubit.filterEntity.statusNotifier.value,
                onChanged: (value) {
                  _cubit.filterEntity.statusNotifier.value = value;
                },
                height: 105.h,
              );
            }),
            20.height,
            AppElevatedButton(
              text: "فلترة",
              onPressed: () => _filterAndCloseDialog(),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _cubit.getGreetingCommunication(
        fkCountry: AppConstants.currentCountry(context) ?? '');
    AppNavigator.pop(result: true);
  }
}
