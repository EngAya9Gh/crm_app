import 'package:flutter/material.dart';

import '../../../../core/common/models/page_model.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../widgets/adaptive_body.dart';
import 'sales_section/All_clinets_page.dart';
import 'sales_section/All_invoice_page.dart';
import 'sales_section/race_all.dart';
import 'sales_section/relation_page.dart';
import 'sales_section/reports_page.dart';

class SalesSection extends StatefulWidget {
  const SalesSection({super.key});

  @override
  State<SalesSection> createState() => _SalesSectionState();
}

class _SalesSectionState extends State<SalesSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: 'المبيعات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AdaptiveBody(pages: salesPages),
        ),
      ),
    );
  }
}

final List<PageModel> salesPages = [
  PageModel(
    page: sales_client(),
    title: 'العملاء',
    image: 'assest/images/All_clients1.png',
  ),
  PageModel(
    page: All_invoice_page(),
    title: 'الفواتير',
    image: 'assest/images/All_invoice.png',
  ),
  PageModel(
    page: relation_page(),
    title: 'علاقات عامة',
    image: 'assest/images/relationship.png',
  ),
  // PageModel(
  //   page: marketingpage(),
  //   title: 'التسويق الإلكتروني',
  //   image: 'assest/images/digitalmarketing.png',
  // ),
  // PageModel(
  //   page: ManagementPage(),
  //   title: 'إدارة',
  //   image: 'assest/images/administrator.png',
  // ),
  PageModel(
    page: reports_page(),
    title: 'تقارير واحصائيات',
    image: 'assest/images/reports.png',
  ),
  PageModel(
    page: race_page(),
    title: 'السباقات',
    image: 'assest/images/race.png',
  ),
  // PageModel(
  //   page: TaskManagementListPage(),
  //   title: 'إدارة المهام',
  //   image: 'assest/images/managetask1.png',
  // ),
];
