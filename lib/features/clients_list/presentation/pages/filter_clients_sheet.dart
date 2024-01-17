import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/responsive_padding.dart';
import '../../../../common/constants/constants.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../domain/use_cases/get_clients_with_filter_usecase.dart';
import '../../../../model/ActivityModel.dart';
import '../../../../model/usermodel.dart';
import '../../../../view_model/activity_vm.dart';
import '../../../../view_model/privilge_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import 'action_client_page.dart';

class FilterClientsSheet extends StatefulWidget {
  const FilterClientsSheet({Key? key, required this.onFilter});

  final ValueChanged<GetClientsWithFilterParams> onFilter;

  @override
  State<FilterClientsSheet> createState() => _FilterClientsSheetState();
}

class _FilterClientsSheetState extends State<FilterClientsSheet> {
  late ValueNotifier<int?> _regionNotifier;
  late ValueNotifier<int?> _activityNotifier;
  late ValueNotifier<int?> _userNotifier;
  late ValueNotifier<String?> _statusNotifier;
  late ClientsListBloc _clientsListBloc;
  late final UserModel userModel;
  late PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    _privilegeCubit = GetIt.I<PrivilegeCubit>();
    userModel = context.read<UserProvider>().currentUser;
    _regionNotifier = ValueNotifier(_clientsListBloc.state.getClientsWithFilterParams?.regionId);
    _activityNotifier = ValueNotifier(_clientsListBloc.state.getClientsWithFilterParams?.activityTypeId);
    _userNotifier = ValueNotifier(_clientsListBloc.state.getClientsWithFilterParams?.userId);
    _statusNotifier = ValueNotifier(_clientsListBloc.state.getClientsWithFilterParams?.typeClient);
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
                  style: context.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
                ),
                ListenableBuilder(
                  listenable:
                  Listenable.merge([_regionNotifier, _activityNotifier, _userNotifier, _statusNotifier]),
                  builder: (context, child) => AppTextButton(
                    onPressed: _regionNotifier.value != null ||
                        _activityNotifier.value != null ||
                        _userNotifier.value != null ||
                        _statusNotifier.value != null
                        ? () {
                      _regionNotifier.value = null;
                      _activityNotifier.value = null;
                      _userNotifier.value = null;
                      _statusNotifier.value = null;
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
                if (_privilegeCubit.checkPrivilege('8')) ...{
                  Expanded(
                    child: Consumer<RegionProvider>(
                      builder: (context, regionVm, child) {
                        return ValueListenableBuilder<int?>(
                          valueListenable: _regionNotifier,
                          builder: (context, value, child) {
                            return AppDropdownButtonFormField<RegionModel, String?>(
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
                  10.horizontalSpace,
                },
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
                )
              ],
            ),
            10.verticalSpace,
            if (_privilegeCubit.checkPrivilege('15') || _privilegeCubit.checkPrivilege('8')) ...{
              Consumer<UserProvider>(
                builder: (context, userVm, child) {
                  return ValueListenableBuilder<int?>(
                      valueListenable: _userNotifier,
                      builder: (context, selectedUserId, _) {
                        return Row(
                          children: [
                            if (selectedUserId != null) ...{
                              IconButton(
                                  onPressed: () {
                                    _userNotifier.value = null;
                                  },
                                  icon: Icon(Icons.highlight_off)),
                              SizedBox(width: 10),
                            },
                            Expanded(
                              child: DropdownSearch<UserModel>(
                                mode: Mode.DIALOG,
                                filterFn: (user, filter) => user!.getfilteruser(filter!),
                                compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
                                items: userVm.usersSalesManagement,
                                popupItemBuilder:_customPopupItemBuilderForEmployeeList,
                                itemAsString: (u) => '${u!.userAsString()}',
                                onChanged: (data) {
                                  if (data == null) return;

                                  _userNotifier.value = int.parse(data.idUser!);
                                },
                                selectedItem: userVm.usersSalesManagement
                                    .firstWhereOrNull((element) => int.parse(element.idUser!) == selectedUserId),
                                showSearchBox: true,
                                dropdownSearchDecoration: InputDecoration(
                                  isCollapsed: true,
                                  hintText: '   الموظف',
                                  hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                                  alignLabelWithHint: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  contentPadding: EdgeInsets.only(right: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor),
                                    borderRadius: BorderRadius.circular(10).r,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor),
                                    borderRadius: BorderRadius.circular(10).r,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor),
                                    borderRadius: BorderRadius.circular(10).r,
                                  ),
                                ),
                              ),
                            ),
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
                          if (selectedActivity != null) ...{
                            IconButton(
                              onPressed: () {
                                _activityNotifier.value = null;
                              },
                              icon: Icon(Icons.highlight_off),
                            ),
                            SizedBox(width: 10),
                          },
                          Expanded(
                            child: DropdownSearch<ActivityModel>(
                              mode: Mode.DIALOG,
                              filterFn: (user, filter) => user!.getFilterActivityType(filter!),
                              compareFn: (item, selectedItem) =>
                              item?.id_activity_type == selectedItem?.id_activity_type,
                              items: activityVm.activitiesList,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                if (data == null) return;
                                _activityNotifier.value = int.parse(data.id_activity_type);
                              },
                              selectedItem: activityVm.activitiesList.firstWhereOrNull(
                                      (element) => int.parse(element.id_activity_type) == selectedActivity),
                              showSearchBox: true,
                              popupItemBuilder:customPopupItemBuilderForActivityTypeList,
                              dropdownSearchDecoration: InputDecoration(
                                isCollapsed: true,
                                hintText: 'النشاط',
                                alignLabelWithHint: true,
                                hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                                fillColor: Colors.grey.withOpacity(0.2),
                                contentPadding: EdgeInsets.only(right: 10),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                              ),
                              // InputDecoration(border: InputBorder.none),
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
                  Navigator.pop(context);
                  widget.onFilter(
                    _clientsListBloc.state.getClientsWithFilterParams!.copyWith(
                      regionId: Nullable.value(_regionNotifier.value),
                      activityTypeId: Nullable.value(_activityNotifier.value),
                      typeClient: Nullable.value(_statusNotifier.value),
                      userId: Nullable.value(_userNotifier.value),
                    ),
                  );
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
  Widget _customPopupItemBuilderForEmployeeList(BuildContext context, UserModel item, bool isSelected) {
    return Container(
        margin: const EdgeInsetsDirectional.only(start: 2, end: 2, top: 2,bottom: 2),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
       ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: context.colorScheme.primary, width: 1),
                ),
              ),
              child:  Text(item.nameUser!, style: context.textTheme.titleSmall,textDirection: TextDirection.rtl,),

    ) )
    );
  }

}
