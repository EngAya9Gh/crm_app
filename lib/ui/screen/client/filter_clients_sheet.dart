import 'package:collection/collection.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/responsive_padding.dart';
import '../../../features/app/presentation/widgets/app_drop_down.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/ActivityModel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/activity_vm.dart';
import '../../../view_model/privilge_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';

class FilterClientsSheet extends StatefulWidget {
  const FilterClientsSheet({
    Key? key,
    required this.onChangeRegion,
    required this.onChangeClientType,
    required this.onResetEmployee,
    required this.onChangeEmployee,
    required this.onChangeActivity,
    required this.onResetActivity,
  });

  final ValueChanged onChangeRegion;
  final ValueChanged onChangeClientType;
  final ValueChanged onChangeEmployee;
  final ValueChanged onChangeActivity;
  final ValueChanged<BuildContext> onResetActivity;
  final ValueChanged<BuildContext> onResetEmployee;

  @override
  State<FilterClientsSheet> createState() => _FilterClientsSheetState();
}

class _FilterClientsSheetState extends State<FilterClientsSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<PrivilegeProvider>(builder: (context, privilege, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              AppText(
                "فلترة العملاء:",
                style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
              ),
              20.verticalSpace,
              Row(
                children: [
                  if (privilege.checkPrivilege('8')) ...{
                    Expanded(
                      child: Consumer<RegionProvider>(
                        builder: (context, regionVm, child) {
                          return AppDropdownButtonFormField<RegionModel, String?>(
                            items: regionVm.listRegionFilter,
                            value: regionVm.listRegionFilter
                                .firstWhereOrNull((element) => element.regionId == regionVm.selectedRegionId)
                                ?.regionId,
                            itemAsString: (item) => item!.regionName,
                            itemAsValue: (item) => item!.regionId,
                            onChange: (value) {
                              if (value == null) {
                                return;
                              }
                              regionVm.changeVal(value.toString());
                              widget.onChangeRegion(value);
                              Navigator.pop(context);
                            },
                            hint: "الفرع",
                          );
                        },
                      ),
                    ),
                    10.horizontalSpace,
                  },
                  Consumer<ClientTypeProvider>(
                    builder: (context, clientTypeVm, child) {
                      return Expanded(
                        child: AppDropdownButtonFormField<String, String>(
                          hint: 'الحالة',
                          items: clientTypeVm.typeOfClientFilter,
                          itemAsValue: (item) => item,
                          itemAsString: (item) => item!,
                          value: clientTypeVm.selectedValufilter,
                          onChange: (value) {
                            if (value == null) return;

                            clientTypeVm.changevaluefilter(value.toString());
                            widget.onChangeClientType(value);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              10.verticalSpace,
              if (privilege.checkPrivilege('15') || privilege.checkPrivilege('8')) ...{
                Consumer<UserProvider>(
                  builder: (context, userVm, child) {
                    return Row(
                      children: [
                        if (userVm.selectedUser != null) ...{
                          IconButton(
                              onPressed: () {
                                userVm.changevalueuser(null);
                                widget.onResetEmployee(context);
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
                            itemAsString: (u) => '${u!.userAsString()}',
                            onChanged: (data) {
                              if (data == null) return;
                              userVm.changevalueuser(data);
                              widget.onChangeEmployee(data);
                              Navigator.pop(context);
                            },
                            selectedItem: userVm.selectedUser,
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
                  },
                ),
                10.verticalSpace,
              },
              Consumer<ActivityProvider>(
                builder: (context, activityVm, child) {
                  return Row(
                    children: [
                      if (activityVm.selectedActivity?.id_activity_type != null) ...{
                        IconButton(
                          onPressed: () {
                            activityVm.onChangeSelectedActivity(null);
                            widget.onResetActivity(context);
                          },
                          icon: Icon(Icons.highlight_off),
                        ),
                        SizedBox(width: 10),
                      },
                      Expanded(
                        child: DropdownSearch<ActivityModel>(
                          mode: Mode.DIALOG,
                          filterFn: (user, filter) => user!.getfilter_actv(filter!),
                          compareFn: (item, selectedItem) => item?.id_activity_type == selectedItem?.id_activity_type,
                          items: activityVm.activitiesList,
                          itemAsString: (u) => u!.userAsString(),
                          onChanged: (data) {
                            if (data == null) return;
                            activityVm.onChangeSelectedActivity(data);
                            widget.onChangeActivity(data);
                            Navigator.pop(context);
                          },
                          selectedItem: activityVm.selectedActivity,
                          showSearchBox: true,
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
                },
              ),
              20.verticalSpace,
            ],
          );
        }),
      ),
    );
  }
}
