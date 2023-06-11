import 'package:flutter/material.dart';

import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class MonthlyPage extends StatefulWidget {
  const MonthlyPage({Key? key}) : super(key: key);

  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: RowEdit(name: 'اختر الشهر', des: 'Required'),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
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
                    fillColor: Colors.grey.shade300,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  hint: Text("حدد الشهر"),
                  items: (['asdas', 'asdsadas']).map((String str) {
                    return DropdownMenuItem<String>(
                      child: Text(str, textDirection: TextDirection.rtl),
                      value: str,
                    );
                  }).toList(),
                  value: null,
                  onChanged: (country) {},
                  onSaved: (country) {
                    if (country == null) {
                      return;
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(child: BranchList()),
        ],
      );
  }
}
