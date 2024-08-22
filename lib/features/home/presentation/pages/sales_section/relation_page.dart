import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../ui/screen/config/company_view.dart';
import '../../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../../ui/screen/user/usertest_view.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../sales/public_relations/links/presentation/pages/manage_links_page.dart';
import '../../../../sales/public_relations/participates/presentation/pages/participate_list_page.dart';

class relation_page extends StatefulWidget {
  const relation_page({Key? key}) : super(key: key);

  @override
  _relation_pageState createState() => _relation_pageState();
}

class _relation_pageState extends State<relation_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'علاقات عامة',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            //تاريخ الفاتورة جنبو اسم المؤسسة
            context.read<PrivilegeCubit>().checkPrivilege('113') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              ParticipateListPage(),
                        ),
                      );
                    },
                    title: 'المتعاونين')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('114') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              AgentsAndDistributorsPage(),
                        ),
                      );
                    },
                    title: "الوكلاء والموزعين",
                  )
                : Container(),

            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          company_view(type: 'ticket'),
                    ),
                  );
                },
                title: 'الشركات المنافسة'),
            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => ManageLinkPage(),
                    ),
                  );
                },
                title: 'الروابط الهامة'),
            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => usertest_view(),
                    ),
                  );
                },
                title: 'يوزرات تجريبية'),

            //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
