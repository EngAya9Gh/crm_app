import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class QuarterPage extends StatelessWidget {
    QuarterPage({Key? key, required this.targetList}) : super(key: key);

  final List<BranchRaceModel> targetList;
  DateTime datefrom=DateTime(1,1,1);
  DateTime dateto=DateTime(1,1,3);

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
                final years = vm.quarterYearsFilter;
                final selectedYear = vm.selectedQuarterYearFilter;

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
                final quarters = vm.quartersFilter;
                final selectedQuarter = vm.selectedQuarterFilter;

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

                    switch(quarter){
                      case 'Q1':
                          datefrom=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),1,1);
                          dateto=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),3,31);

                        break;
                        case 'Q2':
                          datefrom=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),4,1);
                          dateto=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),7,31);

                        break;
                        case 'Q3':
                          datefrom=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),6,1);
                          dateto=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),9,31);

                        break;
                        case 'Q4':
                          datefrom=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),10,1);
                          dateto=DateTime(int.parse(vm.selectedQuarterYearFilter.toString()),12,31);

                        break;
                    }
                    vm.onChangeQuarter(quarter,
                        Provider.of<user_vm_provider>
                      (context,listen: false).currentUser.fkCountry.toString(),datefrom,dateto);
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
        Expanded(child: BranchList(targetList:  Provider.of<BranchRaceViewmodel>
          (context,listen: false).targetList)),
      ],
    );
  }
}
