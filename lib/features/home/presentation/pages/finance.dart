import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class financepage extends StatelessWidget {
  const financepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'التحصيل',
          style: TextStyle(
            color: AppColors.kWhiteColor,
            fontFamily: AppFonts.fontFamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
