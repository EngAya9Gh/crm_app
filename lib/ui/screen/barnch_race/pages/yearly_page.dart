import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class YearlyPage extends StatelessWidget {
  const YearlyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RowEdit(name: 'اختر السنة', des: '*'),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
                final years = vm.yearsFilter;
                final selectedYear = vm.selectedYearFilter;

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
                  onChanged: (year) {
                    if (year == null) {
                      return;
                    }
                    vm.onChangeYear(year);
                  },
                  onSaved: (country) {
                    if (country == null) {
                      return;
                    }
                  },
                );
              }),
            ),
          ),
        ),
        SizedBox(height: 5),
        Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
          final yearlyState = vm.yearlyState;

          if (yearlyState.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (yearlyState.isFailure) {
            return Center(
              child: IconButton(
                  onPressed: () {}, // viewmodel.getTargets,
                  icon: Icon(Icons.refresh)),
            );
          }

          final list = yearlyState.data ?? [];
          return Expanded(child: BranchList(targetList: list));
        }),
      ],
    );
  }
}
