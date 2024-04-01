import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class QuarterPage extends StatefulWidget {
  const QuarterPage({Key? key}) : super(key: key);

  @override
  State<QuarterPage> createState() => _QuarterPageState();
}

class _QuarterPageState extends State<QuarterPage> {
  DateTime datefrom = DateTime(1, 1, 1);

  DateTime dateto = DateTime(1, 1, 3);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          10.height,
          RowEdit(name: 'اختر السنة', des: '*'),
          10.height,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
              final years = vm.quarterYearsFilter;
              final selectedYear = vm.selectedQuarterYearFilter;

              return DropdownButtonFormField<String>(
                padding: EdgeInsets.zero,
                isExpanded: true,
                validator: (value) {
                  if (value == null) {
                    return "هذا الحقل مطلوب";
                  }
                  return null;
                },
                icon:
                    Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                hint: Text("حدد السنة"),
                items: years.map((String str) {
                  return DropdownMenuItem<String>(
                    child: Text(str, textDirection: TextDirection.rtl),
                    value: str,
                  );
                }).toList(),
                value: selectedYear,
                onChanged: (quarterYear) {
                  if (quarterYear == null) {
                    return;
                  }

                  vm.onChangeQuarterYear(quarterYear);
                },
                onSaved: (country) {
                  if (country == null) {
                    return;
                  }
                },
              );
            }),
          ),
          15.height,
          RowEdit(name: 'اختر الربع', des: '*'),
          10.height,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
              final quarters = vm.quartersFilter;
              final selectedQuarter = vm.selectedQuarterFilter;

              return DropdownButtonFormField<String>(
                isExpanded: true,
                validator: (value) {
                  if (value == null) {
                    return "هذا الحقل مطلوب";
                  }
                  return null;
                },
                icon:
                    Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                hint: Text("حدد الربع"),
                items: quarters.map((String str) {
                  return DropdownMenuItem<String>(
                    child: Text(str, textDirection: TextDirection.rtl),
                    value: str,
                  );
                }).toList(),
                value: selectedQuarter,
                onChanged: (quarter) {
                  if (quarter == null) {
                    return;
                  }

                  switch (quarter) {
                    case 'Q1':
                      datefrom = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          01,
                          01);
                      dateto = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          03,
                          31);

                      break;
                    case 'Q2':
                      datefrom = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          04,
                          01);
                      dateto = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          06,
                          30);

                      break;
                    case 'Q3':
                      datefrom = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          07,
                          01);
                      dateto = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          09,
                          30);

                      break;
                    case 'Q4':
                      datefrom = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          10,
                          01);
                      dateto = DateTime(
                          int.parse(vm.selectedQuarterYearFilter.toString()),
                          12,
                          31);
                      break;
                  }
                  vm.onChangeQuarter(quarter);
                },
                onSaved: (country) {
                  if (country == null) {
                    return;
                  }
                },
              );
            }),
          ),
          SizedBox(height: 5),
          Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
            final quarterState = vm.quarterState;

            if (quarterState.isLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (quarterState.isFailure) {
              return Center(
                child: IconButton(
                    onPressed: () {}, // viewmodel.getTargets,
                    icon: Icon(Icons.refresh)),
              );
            }

            final list = quarterState.data ?? [];
            return Expanded(child: BranchList(targetList: list));
          }),
        ],
      ),
    );
  }
}
