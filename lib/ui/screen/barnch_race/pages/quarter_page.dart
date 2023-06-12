import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class QuarterPage extends StatelessWidget {
  const QuarterPage({Key? key, required this.targetList}) : super(key: key);

  final List<BranchRaceModel> targetList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RowEdit(name: 'اختر السنة', des: 'Required'),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
                final years = vm.quarterYears;
                final selectedYear = vm.selectedQuarterYear;

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
                  onChanged: (quarterYear) {
                    if(quarterYear == null){
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
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RowEdit(name: 'اختر الربع', des: 'Required'),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
                final quarters = vm.quarters;
                final selectedQuarter = vm.selectedQuarter;

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
                  hint: Text("حدد الربع"),
                  items: quarters.map((String str) {
                    return DropdownMenuItem<String>(
                      child: Text(str, textDirection: TextDirection.rtl),
                      value: str,
                    );
                  }).toList(),
                  value: selectedQuarter,
                  onChanged: (quarter) {
                    if(quarter == null){
                      return;
                    }

                    vm.onChangeQuarter(quarter);
                  },                  onSaved: (country) {
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
        Expanded(child: BranchList(targetList: targetList)),
      ],
    );
  }
}
