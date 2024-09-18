import 'dart:async';

import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../../view_model/vm.dart';

class BranchManagementDetailsPage extends StatefulWidget {
  const BranchManagementDetailsPage({Key? key, required this.branchRaceModel})
      : super(key: key);
  final BranchRaceModel branchRaceModel;

  @override
  State<BranchManagementDetailsPage> createState() =>
      _BranchManagementDetailsPageState();
}

class _BranchManagementDetailsPageState
    extends State<BranchManagementDetailsPage>
    with StateViewModelMixin<BranchManagementDetailsPage, BranchRaceViewmodel> {
  BranchRaceModel get branchRaceModel => widget.branchRaceModel;
  TextEditingController targetBranchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    targetBranchController.text = branchRaceModel.valueTarget ?? '';
    context.read<UserProvider>().currentUser.fkCountry!;
    super.initState();

    scheduleMicrotask(
        () => viewmodel.onEditBranchTarget(targetBranchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'فرع المدينة'),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _formKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoWidget("الفرع", "فرع المدينة"),
                divider,
                infoWidget("الشهر",
                    "${branchRaceModel.typeTarget != "2" ? '${branchRaceModel.typeTarget == "0" ? getMonthName(int.parse(branchRaceModel.nameTarget ?? "1")) : branchRaceModel.nameTarget}-' : ''}${branchRaceModel.yearTarget}"),
                divider,
                Selector<BranchRaceViewmodel, String?>(
                  selector: (p0, vm) => vm.updateBranchTarget,
                  builder: (_, updateBranchTarget, __) {
                    return infoWidget(
                        "الهدف الشهري",
                        updateBranchTarget ??
                            branchRaceModel.valueTarget ??
                            '');
                  },
                ),
                divider,
                AppText('تعديل الهدف الشهري*'),
                SizedBox(height: 5),
                AppTextField(
                  controller: targetBranchController,
                  inputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: InputValidator.requiredFiled,
                  onChange: (value) => viewmodel.onEditBranchTarget(value!),
                ),
                Spacer(),
                Selector<BranchRaceViewmodel, bool>(
                  selector: (p0, vm) => vm.isLoadingAction,
                  builder: (_, isLoadingAction, __) {
                    if (isLoadingAction) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Center(
                      child: AppElevatedButton(
                        text: "حفظ",
                        onPressed: () {
                          bool isValidated =
                              _formKey.currentState?.validate() ?? false;

                          if (!isValidated) {
                            return;
                          }
                          viewmodel.onAddTarget(
                            onSuccess: () => Navigator.pop(context),
                            branchRaceModel: branchRaceModel,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoWidget(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(title),
        AppText(value),
      ],
    );
  }

  Widget get divider {
    return Divider(
      indent: 15,
      endIndent: 15,
      height: 20,
    );
  }
}
