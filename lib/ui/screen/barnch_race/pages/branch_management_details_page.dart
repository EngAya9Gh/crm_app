import 'dart:async';
import 'package:crm_smart/helper/get_month_name.dart';
import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:crm_smart/view_model/vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../widgets/custom_widget/row_edit.dart';

class BranchManagementDetailsPage extends StatefulWidget {
  const BranchManagementDetailsPage({Key? key, required this.branchRaceModel}) : super(key: key);
  final BranchRaceModel branchRaceModel;

  @override
  State<BranchManagementDetailsPage> createState() => _BranchManagementDetailsPageState();
}

class _BranchManagementDetailsPageState extends State<BranchManagementDetailsPage>
    with StateViewModelMixin<BranchManagementDetailsPage, BranchRaceViewmodel> {
  BranchRaceModel get branchRaceModel => widget.branchRaceModel;
  TextEditingController targetBranchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    targetBranchController.text = branchRaceModel.valueTarget ?? '';
    context.read<UserProvider>().currentUser.fkCountry!;
    super.initState();

    scheduleMicrotask(() => viewmodel.onEditBranchTarget(targetBranchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'فرع المدينة',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
          centerTitle: true,
          backgroundColor: kMainColor,
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            infoWidget("الفرع", "فرع المدينة"),
            infoWidget("الشهر",
                "${branchRaceModel.typeTarget != "2" ? '${branchRaceModel.typeTarget == "0" ? getMonthName(int.parse(branchRaceModel.nameTarget ?? "1")) : branchRaceModel.nameTarget}-' : ''}${branchRaceModel.yearTarget}"),
            Selector<BranchRaceViewmodel, String?>(
              selector: (p0, vm) => vm.updateBranchTarget,
              builder: (_, updateBranchTarget, __) {
                return infoWidget("الهدف الشهري", updateBranchTarget ?? branchRaceModel.valueTarget ?? '');
              },
            ),
            // infoWidget("المجموع الشهري للفرع", "8415"),
            // infoWidget("نسبة التحقيق الشهري", "6.47%"),
            // SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'تعديل الهدف الشهري', des: '*'),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: targetBranchController,
                obscureText: false,
                cursorColor: Colors.black,
                readOnly: false,
                onChanged: (value) => viewmodel.onEditBranchTarget(value),
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                ),
              ),
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
                return ElevatedButton(
                  onPressed: () {
                    bool isValidated = _formKey.currentState?.validate() ?? false;

                    if (!isValidated) {
                      return;
                    }
                    viewmodel.onAddTarget(
                      onSuccess: () => Navigator.pop(context),
                      branchRaceModel: branchRaceModel,
                    );
                  },
                  child: Text("حفظ"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width - 60, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      primary: kMainColor),
                );
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget infoWidget(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 16)),
              Text(value, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        divider,
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
