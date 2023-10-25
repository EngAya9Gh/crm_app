import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../view_model/privilge_vm.dart';
import '../../barnch_race/pages/branch_race_view.dart';
import '../../employee_race/pages/employee_race_page.dart';
import '../widgethomeitem.dart';

class financepage extends StatelessWidget {
  const financepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'التحصيل',
          style: TextStyle(color: kWhiteColor,
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child:
        Column(children: [
          // Provider.of<privilge_vm>(context,listen: true)
          //     .checkprivlge('118')==true?
          // buildSelectCategory(
          //     colorbag:   Colors.white,
          //     colortitle: Colors.black,
          //     colorarrow: Colors.black,
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         CupertinoPageRoute<void>(builder: (BuildContext context) => EmployeeRacePage()),
          //       );
          //     }, title:  'سباق الموظفين' ):Container(),
          //
          // Provider.of<privilge_vm>(context,listen: true)
          //     .checkprivlge('117')==true?
          // buildSelectCategory(
          //     colorbag:   Colors.white,
          //     colortitle: Colors.black,
          //     colorarrow: Colors.black,
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         CupertinoPageRoute<void>(builder: (BuildContext context) => BranchRaceView()),
          //       );
          //     }, title:'سباق الفروع'  ):Container(),

        ],),

      ),
    );
  }
}
