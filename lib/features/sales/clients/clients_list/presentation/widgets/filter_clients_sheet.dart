import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/enums/activity_type_size_enum.dart';
import '../../../../../../core/common/enums/client/client_classification_enum.dart';
import '../../../../../../core/common/enums/client/client_registration_type_enum.dart';
import '../../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/models/user_entity.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/ActivityModel.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../../view_model/regoin_vm.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../../common/cities/presentation/pages/cities_searchable_drop_down.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/clients_list_bloc.dart';
import 'subscribing_intention_level.dart';

class FilterClientsSheet extends StatefulWidget {
  const FilterClientsSheet({
    Key? key,
    required this.val,
  });

  final bool val;

  @override
  State<FilterClientsSheet> createState() => _FilterClientsSheetState();
}

class _FilterClientsSheetState extends State<FilterClientsSheet> {
  late ClientsListBloc _bloc;
  late final UserModel userModel;
  late PrivilegesCubit _privilegeCubit;
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<ClientsListBloc>();
    userProvider = context.read<UserProvider>();
    _privilegeCubit = context.read<PrivilegesCubit>();
    userModel = userProvider.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(_bloc.filterEntity.listenables()),
                builder: (context, child) =>
                    AppTextButton(
                      onPressed: _bloc.filterEntity.checkIfFilterIsNotEmpty()
                          ? () {
                        _bloc.filterEntity.clearFilters();
                        _fetchClients(context);
                      }
                          : null,
                      text: "إعادة الافتراضي",
                      appButtonStyle: AppButtonStyle.secondary,
                    ),
              ),
            ),
            20.height,
            Consumer<ClientTypeProvider>(
              builder: (context, clientTypeVm, child) {
                return CustomMultiSelectionDropdown<String?>(
                  hint: 'الحالة',
                  items: TypeClientEnum.values.map((e) => e.text,).toList(),
                  selectedItems: _bloc.filterEntity.statusNotifier.value,
                  itemAsString: (item) => item!,
                  onSave: (selectedItems) {
                    _bloc.filterEntity.statusNotifier.value = TypeClientEnum.values.where((value) => selectedItems.contains(value.text)).map((e) => e.value).toList();
                  },
                  compareFn: (a, b) => a == b,
                );
              },
            ),
            10.height,
            Row(
              children: [
                Consumer<ClientTypeProvider>(
                  builder: (context, clientTypeVm, child) {
                    return Expanded(
                      child: ValueListenableBuilder<String?>(
                        valueListenable: _bloc.filterEntity.recordTypeNotifier,
                        builder: (context, value, _) {
                          return CustomDropDown<String>(
                            hint: 'التسجيل',
                            items: ClientRegistrationType.values
                                .map((e) => e.value)
                                .toList(),
                            itemAsString: (item) => item!,
                            selectedItem: value,
                            onChanged: (value) {
                              if (value == null) return;

                              _bloc.filterEntity.recordTypeNotifier.value =
                                  value;
                            },
                            height: 140.scaleHeight,
                          );
                        },
                      ),
                    );
                  },
                ),
                8.width,
                Consumer<UserProvider>(
                  builder: (context, vm, child) {
                    return Expanded(
                      child: ValueListenableBuilder<String?>(
                        valueListenable: _bloc.filterEntity.classTypeNotifier,
                        builder: (context, value, _) {
                          return CustomDropDown<String>(
                            hint: 'نوع التصنيف',
                            items: ClientsClassification.values
                                .map((e) => e.value)
                                .toList(),
                            itemAsString: (item) => item!,
                            selectedItem: value,
                            onChanged: (value) {
                              if (value == null) return;

                              _bloc.filterEntity.classTypeNotifier.value =
                                  value;
                            },
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
            10.height,
            Row(
              children: [
                Expanded(
                  child: CitiesSearchableDropDown(
                    selectedCityId:
                    _bloc.filterEntity.cityNotifier.value?.cityId,
                    onSelected: (city) {
                      if (city == null) return;
                      _bloc.filterEntity.cityNotifier.value = city;
                    },
                  ),
                ),
                8.width,
                if (_privilegeCubit.checkPrivilege('8') || widget.val) ...{
                  Expanded(
                    child: Consumer<RegionProvider>(
                      builder: (context, regionVm, child) {
                        return ValueListenableBuilder<String?>(
                          valueListenable: _bloc.filterEntity.regionIdNotifier,
                          builder: (context, value, child) {
                            return BranchSearchableDropDown(
                              showAllChoice: true,
                              selectedBranchId:
                              _bloc.filterEntity.regionIdNotifier.value,
                              onSelected: (branch) {
                                _bloc.filterEntity.regionIdNotifier.value =
                                    branch!.branchId;
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                },
              ],
            ),
            10.height,
            if (_privilegeCubit.checkPrivilege('15') ||
                _privilegeCubit.checkPrivilege('8') ||
                widget.val) ...[
              BlocBuilder<ClientsListBloc, ClientsListState>(
                builder: (context, state) {
                  return CustomSearchableDropDown<UserEntity>(
                    hint: 'الموظف',
                    items: state.usersSales.data??[],
                    compareFn:  (item, selectedItem) => item.id == selectedItem.id,
                    itemAsString: (u) => u!.name,
                    onChanged: (data) {
                      if (data == null) return;
                      _bloc.filterEntity.userNotifier.value = data;
                    },
                    selectedItem: _bloc.filterEntity.userNotifier.value,
                    filterFn: (user, filter) =>
                        user.name.toLowerCase().contains(filter.toLowerCase()),
                  );
                },
              ),
              10.height,
            ],
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return ValueListenableBuilder<int?>(
                    valueListenable: _bloc.filterEntity.activityNotifier,
                    builder: (context, selectedActivity, _) {
                      return Row(
                        children: [
                          Flexible(
                            child: CustomSearchableDropDown<ActivityModel>(
                              hint: 'النشاط',
                              items: activityVm.activitiesList,
                              compareFn:  (item, selectedItem) => item.id_activity_type == selectedItem.id_activity_type,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                if (data == null) return;
                                _bloc.filterEntity.activityNotifier.value =
                                    int.parse(data.id_activity_type!);
                              },
                              selectedItem: activityVm.activitiesList
                                  .firstWhereOrNull((element) =>
                              int.parse(element.id_activity_type!) ==
                                  selectedActivity),
                              filterFn: (user, filter) =>
                                  user.getFilterActivityType(filter),
                            ),
                          ),
                          8.width,
                          Flexible(
                            child: CustomDropDown<ActivitySizeTypeEnum>(
                              hint: "حجم النشاط*",
                              height: 100.h,
                              compareFn: (item, selectedItem) => item.index == selectedItem.index,
                              items: ActivitySizeTypeEnum.values,
                              itemAsString: (item) => item!.value,
                              selectedItem:
                              _bloc.filterEntity.activitySizeNotifier.value,
                              onChanged: (value) {
                                _bloc.filterEntity.activitySizeNotifier.value =
                                    value;
                              },
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            10.height,
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return CustomSearchableDropDown<ClientSourceEnum>(
                  hint: "مصدر العميل",
                  items: ClientSourceEnum.values,
                  selectedItem: _bloc.filterEntity.clientSourceNotifier.value,
                  itemAsString: (item) => item!.value,
                  validator: (value) {
                    if (value == null) {
                      return 'هذا الحقل مطلوب.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _bloc.filterEntity.clientSourceNotifier.value = value;
                  },
                  filterFn: (clientSource, filter) {
                    return clientSource.value
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                  compareFn: (a, b) => a.value == b.value,
                );
              },
            ),
            10.height,
            StatefulBuilder(
              builder: (context, setState) {
                return SubscribingIntentionLevelWidget(
                  subscribingIntentionLevel:
                  SubscribingIntentionLevelEnum.fromString(
                      _bloc.filterEntity.subscribingIntentionLevel.value),
                  onChanged: (value) {
                    _bloc.filterEntity.subscribingIntentionLevel.value =
                        value?.name;
                    setState(() {});
                  },
                );
              },
            ),
            10.height,
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return ValueListenableBuilder<int?>(
                    valueListenable: _bloc.filterEntity.activityNotifier,
                    builder: (context, selectedActivity, _) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'من تاريخ',
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController:
                              _bloc.filterEntity.fromController,
                              style2: true,
                            ),
                          ),
                          8.width,
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'الي تاريخ',
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController:
                              _bloc.filterEntity.toController,
                              style2: true,
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            20.height,
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                text: "فلترة",
                onPressed: () {
                  _fetchClients(context);
                },
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _fetchClients(BuildContext context) {
    _bloc.add(GetAllClientsListEvent(
      onSuccess: () => _bloc.filterEntity.savePreviousState(),
    ));
    AppNavigator.pop();
  }
}
