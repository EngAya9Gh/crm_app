import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helper/get_month_name.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class MonthlyPage extends StatefulWidget {
  const MonthlyPage({Key? key, required this.targetList}) : super(key: key);
  final List<BranchRaceModel> targetList;

  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}
class _MonthlyPageState extends State<MonthlyPage> {
  late String selectedYear='2020';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: RowEdit(name: 'اختر الشهر', des: 'Required'),
        ),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
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
          items: [2020,2021,2022,2023,2024,2025,2026,2027].map((int str) {
            return DropdownMenuItem<String>(
              child: Text(str.toString(), textDirection: TextDirection.rtl),
              value: str.toString(),
            );
          }).toList(),
          value: selectedYear,
          onChanged: (year) {
            if (year == null) {
              return;
            }
            setState(() {
              selectedYear=year;
            });
          },
          onSaved: (country) {
            if (country == null) {
              return;
            }
          },
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(
                builder: (context, vm, _) {
                  final months = vm.monthsFilter;
                  final selectedMonth = vm.selectedMonthFilter;

                  return DropdownButtonFormField<String>(
                    isExpanded: true,
                    validator: (value) {
                      // if (value == null) {
                      //   return "هذا الحقل مطلوب";
                      // }
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
                    hint: Text("حدد الشهر"),
                    items: months.map((String str) {
                      return DropdownMenuItem<String>(
                        child: Text(str, textDirection: TextDirection.rtl),
                        value: str,
                      );
                    }).toList(),
                    value: selectedMonth,
                    onChanged: (month) {
                      if (month == null) {
                        return;
                      }

                      DateTime datemonth=
                      DateTime(int.parse(selectedYear),
                          int.parse(getMonthIndex(month!).toString()),1);
                      vm.onChangeMonth(datemonth,month, Provider.of<user_vm_provider>
                        (context,listen: false).currentUser.fkCountry.toString());
                    },
                    onSaved: (country) {
                      if (country == null) {
                        return;
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Expanded(child: BranchList(targetList: Provider.of<BranchRaceViewmodel>
          (context,listen: false).targetList)),
      ],
    );
  }
}
