import 'package:crm_smart/ui/screen/barnch_race/pages/yearly_page.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import '../../../../constants.dart';

class BranchRaceView extends StatefulWidget {
  const BranchRaceView({Key? key}) : super(key: key);

  @override
  State<BranchRaceView> createState() => _BranchRaceViewState();
}

class _BranchRaceViewState extends State<BranchRaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سباق الفروع"),
        centerTitle: true,
      ),
      body: Column(
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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GroupButton(
                controller: GroupButtonController(selectedIndex: 0),
                options: GroupButtonOptions(
                    selectedColor: kMainColor,
                    buttonWidth: (MediaQuery.of(context).size.width - 60) / 3,
                    borderRadius: BorderRadius.circular(10)),
                buttons: [
                  'سنوي',
                  "ربعي",
                  "شهري",
                ],
                onSelected: (_, index, isselected) {},
              ),
            ),
          ),
          SizedBox(height: 15),
          // Expanded(child: MonthlyPage()),
          // Expanded(child: QuarterPage()),
          Expanded(child: YearlyPage()),
        ],
      ),
    );
  }
}
