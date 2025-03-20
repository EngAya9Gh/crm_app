import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/vm.dart';

class AddTargetPage extends StatefulWidget {
  const AddTargetPage({super.key});

  @override
  State<AddTargetPage> createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage>
    with StateViewModelMixin<AddTargetPage, BranchRaceViewmodel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController branchTarget = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'Form',
          backgroundColor: AppColors.primaryMain,
          actions: [
            Selector<BranchRaceViewmodel, bool>(
              selector: (p0, vm) => vm.isLoadingAction,
              builder: (_, isLoadingAction, __) {
                if (isLoadingAction) {
                  return Center(child: AppLoader());
                }
                return AppTextButton(
                  text: 'Submit',
                  onPressed: onAddTarget,
                  textStyle: AppStyles.textStyle.copyWith(color: Colors.white),
                );
              },
            ),
            SizedBox(width: 15),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                SizedBox(height: 15),
                AppCardContainer(
                  child: Selector<BranchRaceViewmodel, DateFilterType>(
                    selector: (p0, vm) => vm.selectedDateFilterAddTarget,
                    builder: (_, selectedDateFilterAddTarget, __) {
                      return AppGroupButton(
                        groupButtonController: GroupButtonController(
                            selectedIndex: selectedDateFilterAddTarget.index),
                        buttons: ["شهري", "ربعي", 'سنوي'],
                        onSelected: (_, index, isselected) => viewmodel
                            .onChangeSelectedFilterTypeAddTarget(index),
                      );
                    },
                  ),
                ),
                10.height,
                AppText('السنة*', textDirection: TextDirection.rtl),
                5.height,
                Selector<BranchRaceViewmodel, String?>(
                  selector: (p0, vm) => vm.selectedYearAddTarget,
                  builder: (_, selectedYearAddTarget, __) {
                    return CustomDropDown(
                      hint: 'حدد السنة',
                      items: getYearList(),
                      compareFn:  (item, selectedItem) => item == selectedItem,
                      itemAsString: (item) => item!,
                      selectedItem: selectedYearAddTarget,
                      onChanged: (value) {
                        viewmodel.onChangeSelectedYearAddTarget(value!);
                      },
                      height: 215.scaleHeight,
                      validator: InputValidator.requiredFiled,
                    );
                  },
                ),
                10.height,
                Selector<BranchRaceViewmodel, DateFilterType>(
                  selector: (p0, vm) => vm.selectedDateFilterAddTarget,
                  builder: (_, selectedDateFilterAddTarget, __) {
                    if (selectedDateFilterAddTarget == DateFilterType.yearly) {
                      return SizedBox();
                    } else if (selectedDateFilterAddTarget ==
                        DateFilterType.quarterly) {
                      return buildQuarterDropDowns();
                    } else {
                      return buildMonthDropDowns();
                    }
                  },
                ),
                10.height,
                AppText('الفرع*', textDirection: TextDirection.rtl),
                5.height,
                Consumer2<RegionProvider, BranchRaceViewmodel>(
                  builder: (_, regionVm, branchViewModel, __) {
                    final listRegion = regionVm.listRegionFilter
                        .where((element) => element.branchId != "0")
                        .toList();
                    final selectedRegionId = branchViewModel.selectedRegionId;

                    return CustomDropDown(
                      hint: 'اختر الفرع',
                      items: listRegion.map((BranchModel region) {
                        return region.branchId;
                      }).toList(),
                      compareFn:  (item, selectedItem) => item == selectedItem,
                      itemAsString: (item) => listRegion
                          .firstWhere((region) => region.branchId == item)
                          .branchName,
                      selectedItem: selectedRegionId,
                      onChanged: (id_regoin) {
                        if (id_regoin == null) {
                          return;
                        }
                        viewmodel.onChangeBranch(id_regoin);
                      },
                      validator: InputValidator.requiredFiled,
                    );
                  },
                ),
                10.height,
                AppText('الهدف الفرعي', textDirection: TextDirection.rtl),
                5.height,
                AppTextField(
                  hintText: 'ادخل الهدف الفرعي',
                  controller: branchTarget,
                  inputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: InputValidator.requiredFiled,
                  onSaved: (text) => viewmodel.onSaveBranchTarget(text!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMonthDropDowns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('الشهر*', textDirection: TextDirection.rtl),
        5.height,
        CustomDropDown(
          hint: 'حدد الشهر',
          items: monthList,
          compareFn:  (item, selectedItem) => item == selectedItem,
          itemAsString: (item) => item!,
          selectedItem: viewmodel.selectedMonthAddTarget,
          onChanged: (value) {
            viewmodel.onChangeSelectedMonthAddTarget(value!);
          },
          validator: InputValidator.requiredFiled,
        ),
      ],
    );
  }

  Widget buildQuarterDropDowns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('الربع', textDirection: TextDirection.rtl),
        5.height,
        CustomDropDown(
          hint: 'حدد الربع',
          items: quarterList,
          compareFn:  (item, selectedItem) => item == selectedItem,
          itemAsString: (item) => item!,
          selectedItem: viewmodel.selectedQuarterAddTarget,
          onChanged: (value) {
            viewmodel.onChangeSelectedQuarterAddTarget(value!);
          },
          height: 175.scaleHeight,
          validator: InputValidator.requiredFiled,
        ),
      ],
    );
  }

  void onAddTarget() {
    final isValidated = _formKey.currentState?.validate() ?? false;

    if (!isValidated) {
      return;
    }
    _formKey.currentState!.save();

    viewmodel.onAddTarget(onSuccess: () => Navigator.pop(context));
  }
}
