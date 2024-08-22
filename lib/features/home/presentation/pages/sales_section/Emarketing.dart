import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../ui/screen/client/marketing/clientmarketing.dart';
import '../../../../../ui/screen/client/marketing/invoice_marketing.dart';
import '../../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

class marketingpage extends StatelessWidget {
  const marketingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'التسويق',
          style: TextStyle(
            color: AppColors.kWhiteColor,
            fontFamily: kfontfamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            context.read<PrivilegeCubit>().checkPrivilege('53')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => clientmarketing()));
                    },
                    title: 'عملاء التسويق الإلكتروني')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('54')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => invoice_marketing()));
                    },
                    title: 'فواتير عملاء التسويق الإلكتروني')
                : Container(),
            // Provider.of<privilge_vm>(context,listen: true)
            //     .checkprivlge('55')==true ?
            // buildSelectCategory(
            //     colorbag: Colors.white,
            //     colortitle: Colors.black,
            //     colorarrow: Colors.black,
            //     onTap: () {
            //       // Navigator.push(context, CupertinoPageRoute(
            //       //     builder: (context)=>
            //       //         invoice_marketing()
            //       // ));
            //     },
            //     title: 'تقرير التسويق الإلكتروني'):Container(),
          ],
        ),
      ),
    );
  }
}
