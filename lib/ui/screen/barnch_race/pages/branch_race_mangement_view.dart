import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../../constants.dart';
import '../widgets/branch_management_card.dart';
import '../widgets/branch_management_list.dart';
import 'add_target_page.dart';

class BranchRaceManagementView extends StatefulWidget {
  const BranchRaceManagementView({Key? key}) : super(key: key);

  @override
  State<BranchRaceManagementView> createState() => _BranchRaceManagementViewState();
}

class _BranchRaceManagementViewState extends State<BranchRaceManagementView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سباق الفروع',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade50,
                isCollapsed: true,
                hintText: "Search..",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(65),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          child: Icon(Icons.add_outlined, size: 35),
          backgroundColor: kMainColor,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTargetPage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "يونيو-2023",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: kfontfamily),
            ),
          ),
          Expanded(child: BranchManagementList()),
        ],
      ),
    );
  }
}
