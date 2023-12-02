import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../barnch_race/pages/branch_race_view.dart';
import '../../employee_race/pages/employee_race_page.dart';
import '../widgethomeitem.dart';

class race_page extends StatelessWidget {
  const race_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'السباقات',
          style: TextStyle(
            color: kWhiteColor,
            fontFamily: kfontfamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            context.read<PrivilegeCubit>().checkPrivilege('118')
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(builder: (BuildContext context) => EmployeeRacePage()),
                      );
                    },
                    title: 'سباق الموظفين')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('117')
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(builder: (BuildContext context) => BranchRaceView()),
                      );
                    },
                    title: 'سباق الفروع')
                : Container(),
          ],
        ),
      ),
    );
  }
}
