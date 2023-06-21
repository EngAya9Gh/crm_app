import 'dart:async';

import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/view_model/vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../../../../constants.dart';
import '../../../../helper/get_month_name.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../widgets/custom_widget/row_edit.dart';

class AddTargetPage extends StatefulWidget {
  const AddTargetPage({Key? key}) : super(key: key);

  @override
  State<AddTargetPage> createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage> with StateViewModelMixin<AddTargetPage, BranchRaceViewmodel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController branchTarget = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Form',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
          centerTitle: true,
          backgroundColor: kMainColor,
          actions: [
            Selector<BranchRaceViewmodel, bool>(
              selector: (p0, vm) => vm.isLoadingAction,
              builder: (_, isLoadingAction, __) {
                if (isLoadingAction) {
                  return Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white))),
                  );
                }
                return TextButton(
                  onPressed: onAddTarget,
                  child: Text("Submit"),
                  style: TextButton.styleFrom(primary: Colors.white),
                );
              },
            ),
            SizedBox(width: 15),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 8.0,
                    color: Colors.black87.withOpacity(0.2),
                  ),
                ],
                color: Colors.white,
              ),
              child: Selector<BranchRaceViewmodel, DateFilterType>(
                selector: (p0, vm) => vm.selectedDateFilterAddTarget,
                builder: (_, selectedDateFilterAddTarget, __) {
                  return GroupButton(
                    controller: GroupButtonController(selectedIndex: selectedDateFilterAddTarget.index),
                    options: GroupButtonOptions(
                        selectedColor: kMainColor,
                        buttonWidth: (MediaQuery.of(context).size.width - 60) / 3,
                        borderRadius: BorderRadius.circular(10)),
                    buttons: ["شهري", "ربعي", 'سنوي'],
                    onSelected: (_, index, isselected) => viewmodel.onChangeSelectedFilterTypeAddTarget(index),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'السنة', des: '*'),
            ),
            SizedBox(height: 5),
            Selector<BranchRaceViewmodel, String?>(
              selector: (p0, vm) => vm.selectedYearAddTarget,
              builder: (_, selectedYearAddTarget, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        validator: (value) {
                          if (value == null) {
                            return "هذا الحقل مطلوب";
                          }
                        },
                        icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        hint: Text("اختر السنة"),
                        items: getYearList().map((year) {
                          return DropdownMenuItem<String>(
                            child: Text(year, textDirection: TextDirection.rtl),
                            value: year,
                          );
                        }).toList(),
                        value: selectedYearAddTarget,
                        onChanged: (year) {
                          if (year == null) {
                            return;
                          }
                          viewmodel.onChangeSelectedYearAddTarget(year);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Selector<BranchRaceViewmodel, DateFilterType>(
              selector: (p0, vm) => vm.selectedDateFilterAddTarget,
              builder: (_, selectedDateFilterAddTarget, __) {
                if (selectedDateFilterAddTarget == DateFilterType.yearly) {
                  return SizedBox();
                } else if (selectedDateFilterAddTarget == DateFilterType.quarterly) {
                  return buildQuarterDropDowns();
                } else {
                  return buildMonthDropDowns();
                }
              },
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'الفرع', des: '*'),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Consumer2<regoin_vm, BranchRaceViewmodel>(
                    builder: (_, regionVm, branchViewModel, __) {
                      final listRegion =
                          regionVm.listregoinfilter.where((element) => element.id_regoin != "0").toList();
                      final selectedRegionId = branchViewModel.selectedRegionId;

                      return DropdownButtonFormField<String>(
                        isExpanded: true,
                        validator: (value) {
                          if (value == null) {
                            return "هذا الحقل مطلوب";
                          }
                        },
                        icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        hint: Text("اختر الفرع"),
                        items: listRegion.map((RegoinModel region) {
                          return DropdownMenuItem<String>(
                            child: Text(region.name_regoin, textDirection: TextDirection.rtl),
                            value: region.id_regoin,
                          );
                        }).toList(),
                        value: selectedRegionId,
                        onChanged: (id_regoin) {
                          if (id_regoin == null) {
                            return;
                          }
                          viewmodel.onChangeBranch(id_regoin);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: RowEdit(name: 'الهدف الفرعي', des: '*'),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: branchTarget,
                  obscureText: false,
                  cursorColor: Colors.black,
                  readOnly: false,
                  onSaved: (text) => viewmodel.onSaveBranchTarget(text!),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMonthDropDowns() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: [
          RowEdit(name: 'الشهر', des: '*'),
          SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Selector<BranchRaceViewmodel, Tuple2<String?, DateFilterType>>(
              selector: (p0, vm) => Tuple2(vm.selectedMonthAddTarget, vm.selectedDateFilterAddTarget),
              builder: (_, values, __) {
                final selectedMonthAddTarget = values.item1;
                final selectedDateFilterAddTarget = values.item2;

                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    validator: (value) {
                      if (selectedDateFilterAddTarget != DateFilterType.monthly) {
                        return null;
                      }

                      if (value == null) {
                        return "هذا الحقل مطلوب";
                      }

                      return null;
                    },
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    hint: Text("اختر الشهر"),
                    items: monthList.map((month) {
                      return DropdownMenuItem<String>(
                        child: Text(month, textDirection: TextDirection.rtl),
                        value: getMonthNumber(month).toString(),
                      );
                    }).toList(),
                    value: selectedMonthAddTarget,
                    onChanged: (month) {
                      if (month == null) {
                        return;
                      }
                      viewmodel.onChangeSelectedMonthAddTarget(month);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQuarterDropDowns() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: [
          RowEdit(name: 'الربع', des: '*'),
          SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Selector<BranchRaceViewmodel, Tuple2<String?, DateFilterType>>(
              selector: (p0, vm) => Tuple2(vm.selectedQuarterAddTarget, vm.selectedDateFilterAddTarget),
              builder: (_, values, __) {
                final selectedQuarterAddTarget = values.item1;
                final selectedDateFilterAddTarget = values.item2;

                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    validator: (value) {
                      if (selectedDateFilterAddTarget != DateFilterType.quarterly) {
                        return null;
                      }

                      if (value == null) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    hint: Text("اختر الربع"),
                    items: quarterList.map((quarter) {
                      return DropdownMenuItem<String>(
                        child: Text(quarter, textDirection: TextDirection.rtl),
                        value: quarter,
                      );
                    }).toList(),
                    value: selectedQuarterAddTarget,
                    onChanged: (quarter) {
                      if (quarter == null) {
                        return;
                      }
                      viewmodel.onChangeSelectedQuarterAddTarget(quarter);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
