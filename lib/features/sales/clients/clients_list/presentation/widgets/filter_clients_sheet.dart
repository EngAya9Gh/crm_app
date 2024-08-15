import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/common/enums/activity_type_size_enum.dart';
import '../../../../../../core/common/enums/client/client_classification_enum.dart';
import '../../../../../../core/common/enums/client/client_registration_type_enum.dart';
import '../../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../core/utils/extensions/build_context.dart';
import '../../../../../../model/ActivityModel.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../../view_model/regoin_vm.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_drop_down.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
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
  late ClientsListBloc _clientsListBloc;
  late final UserModel userModel;
  late PrivilegeCubit _privilegeCubit;
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();

    _clientsListBloc = context.read<ClientsListBloc>();
    userProvider = context.read<UserProvider>();
    _privilegeCubit = context.read<PrivilegeCubit>();
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
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  (() {
                    return "فلترة العملاء:";
                  }()),
                  style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
                ),
                ListenableBuilder(
                  listenable: Listenable.merge(
                      _clientsListBloc.filterEntity.listenables()),
                  builder: (context, child) => AppTextButton(
                    onPressed:
                        _clientsListBloc.filterEntity.checkIfFilterIsNotEmpty()
                            ? () {
                                _clientsListBloc.filterEntity.clearFilters();
                                _fetchClients(context);
                              }
                            : null,
                    text: "إعادة الافتراضي",
                    appButtonStyle: AppButtonStyle.secondary,
                  ),
                )
              ],
            ),
            20.verticalSpace,
            Consumer<ClientTypeProvider>(
              builder: (context, clientTypeVm, child) {
                return CustomMultiSelectionDropdown<String?>(
                  hint: 'الحالة',
                  items: clientTypeVm.typeOfClientFilter,
                  selectedItems:
                      _clientsListBloc.filterEntity.statusNotifier.value,
                  itemAsString: (item) => item!,
                  onSave: (selectedItems) {
                    _clientsListBloc.filterEntity.statusNotifier.value =
                        selectedItems;
                  },
                );
              },
            ),
            20.verticalSpace,
            Row(
              children: [
                // 10.horizontalSpace,
                Consumer<ClientTypeProvider>(
                  builder: (context, clientTypeVm, child) {
                    return Expanded(
                      child: ValueListenableBuilder<String?>(
                          valueListenable:
                              _clientsListBloc.filterEntity.recordTypeNotifier,
                          builder: (context, value, _) {
                            return AppDropdownButtonFormField<String, String>(
                              hint: 'التسجيل',
                              items: ClientRegistrationType.values
                                  .map((e) => e.value)
                                  .toList(),
                              itemAsValue: (item) => item,
                              itemAsString: (item) => item!,
                              value: value,
                              onChange: (value) {
                                if (value == null) return;

                                _clientsListBloc.filterEntity.recordTypeNotifier
                                    .value = value;
                              },
                            );
                          }),
                    );
                  },
                ),
                10.horizontalSpace,
                Consumer<UserProvider>(
                  builder: (context, vm, child) {
                    return Expanded(
                      child: ValueListenableBuilder<String?>(
                          valueListenable:
                              _clientsListBloc.filterEntity.classTypeNotifier,
                          builder: (context, value, _) {
                            return AppDropdownButtonFormField<String?, String?>(
                              items: ClientsClassification.values
                                  .map((e) => e.value)
                                  .toList(),
                              hint: "نوع التصنيف",
                              itemAsValue: (String? item) => item!,
                              itemAsString: (item) => item!,
                              value: _clientsListBloc
                                  .filterEntity.classTypeNotifier.value,
                              onChange: (value) {
                                if (value == null) return;

                                _clientsListBloc.filterEntity.classTypeNotifier
                                    .value = value;
                              },
                            );
                          }),
                    );
                  },
                )
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                if (_privilegeCubit.checkPrivilege('8') || widget.val) ...{
                  Expanded(
                    child: Consumer<RegionProvider>(
                      builder: (context, regionVm, child) {
                        return ValueListenableBuilder<int?>(
                          valueListenable:
                              _clientsListBloc.filterEntity.regionNotifier,
                          builder: (context, value, child) {
                            return AppDropdownButtonFormField<RegionModel,
                                String?>(
                              items: regionVm.listRegionFilter,
                              value: value?.toString(),
                              itemAsString: (item) => item!.regionName,
                              itemAsValue: (item) => item!.regionId,
                              onChange: (value) {
                                if (value == null) {
                                  return;
                                }

                                _clientsListBloc.filterEntity.regionNotifier
                                    .value = int.parse(value);
                              },
                              hint: "الفرع",
                            );
                          },
                        );
                      },
                    ),
                  ),
                },
              ],
            ),
            10.verticalSpace,
            if (_privilegeCubit.checkPrivilege('15') ||
                _privilegeCubit.checkPrivilege('8') ||
                widget.val) ...[
              Consumer<UserProvider>(
                builder: (context, userVm, child) {
                  return CustomSearchableDropDown<UserModel>(
                    hint: 'الموظف',
                    items: userVm.usersSalesManagement,
                    itemAsString: (u) => u!.userAsString(),
                    onChanged: (data) {
                      if (data == null) return;
                      _clientsListBloc.filterEntity.userNotifier.value = data;
                    },
                    selectedItem:
                        _clientsListBloc.filterEntity.userNotifier.value,
                    filterFn: (user, filter) => user.getfilteruser(filter),
                  );
                },
              ),
              10.verticalSpace,
            ],
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return ValueListenableBuilder<int?>(
                    valueListenable:
                        _clientsListBloc.filterEntity.activityNotifier,
                    builder: (context, selectedActivity, _) {
                      return Row(
                        children: [
                          Flexible(
                            child: CustomSearchableDropDown<ActivityModel>(
                              hint: 'النشاط',
                              items: activityVm.activitiesList,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                if (data == null) return;
                                _clientsListBloc.filterEntity.activityNotifier
                                    .value = int.parse(data.id_activity_type);
                              },
                              selectedItem: activityVm.activitiesList
                                  .firstWhereOrNull((element) =>
                                      int.parse(element.id_activity_type) ==
                                      selectedActivity),
                              filterFn: (user, filter) =>
                                  user.getFilterActivityType(filter),
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: CustomDropDown<ActivitySizeTypeEnum>(
                              hint: "حجم النشاط*",
                              height: 100.h,
                              items: ActivitySizeTypeEnum.values,
                              itemAsString: (item) => item!.value,
                              selectedItem: _clientsListBloc
                                  .filterEntity.activitySizeNotifier.value,
                              onChanged: (value) {
                                _clientsListBloc.filterEntity
                                    .activitySizeNotifier.value = value;
                              },
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            10.verticalSpace,
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return CustomSearchableDropDown<ClientSourceEnum>(
                  hint: "مصدر العميل",
                  items: ClientSourceEnum.values,
                  selectedItem: userProvider.filterSourceClient,
                  itemAsString: (item) => item!.value,
                  validator: (value) {
                    if (value == null) {
                      return 'هذا الحقل مطلوب.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    userProvider.filterSourceClient = value;
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
            10.verticalSpace,
            StatefulBuilder(
              builder: (context, setState) {
                return SubscribingIntentionLevelWidget(
                  subscribingIntentionLevel:
                      SubscribingIntentionLevelEnum.fromString(_clientsListBloc
                          .filterEntity.subscribingIntentionLevel.value),
                  onChanged: (value) {
                    _clientsListBloc.filterEntity.subscribingIntentionLevel
                        .value = value?.name;
                    setState(() {});
                  },
                );
              },
            ),
            10.verticalSpace,
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return ValueListenableBuilder<int?>(
                    valueListenable:
                        _clientsListBloc.filterEntity.activityNotifier,
                    builder: (context, selectedActivity, _) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'من تاريخ',
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController:
                                  _clientsListBloc.filterEntity.fromController,
                              style2: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'الي تاريخ',
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController:
                                  _clientsListBloc.filterEntity.toController,
                              style2: true,
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            20.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                text: "فلترة",
                onPressed: () {
                  _fetchClients(context);
                },
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _fetchClients(BuildContext context) {
    _clientsListBloc.add(GetAllClientsListEvent(
      fkCountry: AppConstants.currentUser(context)?.fkCountry ?? '',
      onSuccess: () => _clientsListBloc.filterEntity.savePreviousState(),
    ));
    AppNavigator.pop();
  }
}
