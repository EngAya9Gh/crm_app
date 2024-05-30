import 'package:collection/collection.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/enums/client_enums.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../../model/ActivityModel.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/activity_vm.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_drop_down.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../domain/use_cases/get_clients_with_filter_usecase.dart';

class FilterClientsSheet extends StatefulWidget {
  const FilterClientsSheet({
    Key? key,
    required this.onFilter,
    required this.val,
  });

  final ValueChanged<GetClientsWithFilterParams> onFilter;
  final bool val;

  @override
  State<FilterClientsSheet> createState() => _FilterClientsSheetState();
}

class _FilterClientsSheetState extends State<FilterClientsSheet> {
  late ValueNotifier<int?> _regionNotifier;
  late ValueNotifier<int?> _activityNotifier;
  late ValueNotifier<int?> _userNotifier;
  late ValueNotifier<String?> _statusNotifier;
  late ValueNotifier<String?> _recordTypeNotifier;
  late ValueNotifier<String?> _classTypeNotifier;
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  late ClientsListBloc _clientsListBloc;
  late final UserModel userModel;
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    _privilegeCubit = getIt<PrivilegeCubit>();
    userModel = context.read<UserProvider>().currentUser;
    _regionNotifier = ValueNotifier(
        _clientsListBloc.state.getClientsWithFilterParams?.fkRegion);
    _activityNotifier = ValueNotifier(
        _clientsListBloc.state.getClientsWithFilterParams?.activityTypeId);
    _userNotifier = ValueNotifier(
        _clientsListBloc.state.getClientsWithFilterParams?.fkUser);
    _statusNotifier = ValueNotifier(
        _clientsListBloc.state.getClientsWithFilterParams?.typeClient);
    _recordTypeNotifier = ValueNotifier(
        _clientsListBloc.state.getClientsWithFilterParams?.typeClient_record);
    _classTypeNotifier = ValueNotifier(
        _clientsListBloc.state.getClientsWithFilterParams?.typeClassfication);
    fromController.text =
        _clientsListBloc.state.getClientsWithFilterParams?.from ?? '';
    toController.text =
        _clientsListBloc.state.getClientsWithFilterParams?.to ?? '';
    super.initState();
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
                  listenable: Listenable.merge([
                    _regionNotifier,
                    _activityNotifier,
                    _userNotifier,
                    _statusNotifier,
                    _recordTypeNotifier,
                    _classTypeNotifier,
                  ]),
                  builder: (context, child) => AppTextButton(
                    onPressed: _regionNotifier.value != null ||
                            _activityNotifier.value != null ||
                            _userNotifier.value != null ||
                            _recordTypeNotifier.value != null ||
                            _classTypeNotifier.value != null ||
                            _statusNotifier.value != null ||
                            fromController.text.isNotEmpty ||
                            toController.text.isNotEmpty
                        ? () {
                            _regionNotifier.value = null;
                            _activityNotifier.value = null;
                            _userNotifier.value = null;
                            _recordTypeNotifier.value = null;
                            _classTypeNotifier.value = null;
                            _statusNotifier.value = null;
                            fromController.text = '';
                            toController.text = '';
                          }
                        : null,
                    text: "إعادة الافتراضي",
                    appButtonStyle: AppButtonStyle.secondary,
                  ),
                )
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                Consumer<ClientTypeProvider>(
                  builder: (context, clientTypeVm, child) {
                    return Expanded(
                      child: ValueListenableBuilder<String?>(
                          valueListenable: _statusNotifier,
                          builder: (context, value, _) {
                            return AppDropdownButtonFormField<String, String>(
                              hint: 'الحالة',
                              items: clientTypeVm.typeOfClientFilter,
                              itemAsValue: (item) => item,
                              itemAsString: (item) => item!,
                              value: value,
                              onChange: (value) {
                                if (value == null) return;

                                _statusNotifier.value = value;
                              },
                            );
                          }),
                    );
                  },
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                // 10.horizontalSpace,
                Consumer<ClientTypeProvider>(
                  builder: (context, clientTypeVm, child) {
                    return Expanded(
                      child: ValueListenableBuilder<String?>(
                          valueListenable: _recordTypeNotifier,
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

                                _recordTypeNotifier.value = value;
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
                          valueListenable: _classTypeNotifier,
                          builder: (context, value, _) {
                            return AppDropdownButtonFormField<String?, String?>(
                              items: ClientsClassification.values
                                  .map((e) => e.value)
                                  .toList(),
                              hint: "نوع التصنيف",
                              itemAsValue: (String? item) => item!,
                              itemAsString: (item) => item!,
                              value: _classTypeNotifier.value,
                              onChange: (value) {
                                if (value == null) return;

                                _classTypeNotifier.value = value;
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
                          valueListenable: _regionNotifier,
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

                                _regionNotifier.value = int.parse(value);
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
                widget.val) ...{
              Consumer<UserProvider>(
                builder: (context, userVm, child) {
                  return ValueListenableBuilder<int?>(
                      valueListenable: _userNotifier,
                      builder: (context, selectedUserId, _) {
                        return Row(
                          children: [
                            Expanded(
                              child: CustomSearchableDropDown<UserModel>(
                                hint: 'الموظف',
                                items: userVm.usersSalesManagement,
                                itemAsString: (u) => u!.userAsString(),
                                onChanged: (data) {
                                  if (data == null) return;

                                  _userNotifier.value = int.parse(data.idUser!);
                                },
                                selectedItem: userVm.usersSalesManagement
                                    .firstWhereOrNull((element) =>
                                        int.parse(element.idUser!) ==
                                        selectedUserId),
                                filterFn: (user, filter) =>
                                    user.getfilteruser(filter),
                              ),
                            ),
                            if (selectedUserId != null) ...[
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () {
                                    _userNotifier.value = null;
                                  },
                                  icon: Icon(
                                    Icons.highlight_off,
                                  )),
                            ],
                          ],
                        );
                      });
                },
              ),
              10.verticalSpace,
            },
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return ValueListenableBuilder<int?>(
                    valueListenable: _activityNotifier,
                    builder: (context, selectedActivity, _) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomSearchableDropDown<ActivityModel>(
                              hint: 'النشاط',
                              items: activityVm.activitiesList,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                if (data == null) return;
                                _activityNotifier.value =
                                    int.parse(data.id_activity_type);
                              },
                              selectedItem: activityVm.activitiesList
                                  .firstWhereOrNull((element) =>
                                      int.parse(element.id_activity_type) ==
                                      selectedActivity),
                              filterFn: (user, filter) =>
                                  user.getFilterActivityType(filter),
                            ),
                          ),
                          if (selectedActivity != null) ...[
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                _activityNotifier.value = -1;
                              },
                              icon: Icon(Icons.highlight_off),
                            ),
                          ],
                        ],
                      );
                    });
              },
            ),
            10.verticalSpace,
            Consumer<ActivityProvider>(
              builder: (context, activityVm, child) {
                return ValueListenableBuilder<int?>(
                    valueListenable: _activityNotifier,
                    builder: (context, selectedActivity, _) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'من تاريخ',
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController: fromController,
                              style2: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomDateTimePicker(
                              hintText: 'الي تاريخ',
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController: toController,
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
              child: ElevatedButton(
                onPressed: () {
                  AppNavigator.pop();

                  if (_userNotifier.value == null) {
                    _userNotifier.value = -1;
                  }

                  GetClientsWithFilterParams params = _clientsListBloc
                      .state.getClientsWithFilterParams!
                      .copyWith(
                    fkRegion: _regionNotifier.value ?? 0,
                    activityTypeId: _activityNotifier.value ?? -1,
                    typeClient_record: _recordTypeNotifier.value ?? '',
                    typeClassfication: _classTypeNotifier.value ?? '',
                    fkUser: _userNotifier.value ?? -1,
                    from: fromController.text,
                    to: toController.text,
                    typeClient: _statusNotifier.value ?? '',
                  );
                  if (widget.val) {
                    params = params.copyWith(
                      typeClient: 'مشترك',
                    );
                  }
                  widget.onFilter(params);
                },
                child: AppText("فلترة"),
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
