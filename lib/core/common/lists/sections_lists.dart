import 'package:crm_smart/core/config/navigator/app_routes_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../features/common/regions/presentation/manager/regions_cubit.dart';
import '../../../features/home/presentation/pages/sales_section.dart';
import '../../../features/task_management/presentation/pages/task_management_list_page.dart';
import '../../../view_model/maincity_vm.dart';
import '../models/sections/section_model.dart';
import '../widgets/sections_and_subsections/sub_sections_list_view.dart';
import 'all_sub_sections_lists.dart';
import 'sales_sub_sections_lists.dart';

abstract class SectionsLists {
  /* Home Sections */

  static final List<SectionModel> HomeSections = [
    SectionModel(
      page: SalesSection(),
      title: 'المبيعات',
      icon: FontAwesomeIcons.peopleGroup,
      path: AppRoutesPaths.homeSections.sales,
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الدعم الفني',
        subSections: AllSubSectionsLists.supportSubSections,
        onInit: (context) async {
          await Future.wait([
            context.read<RegionsCubit>().getRegions(),
            context.read<MainCityProvider>().getmaincity(),
          ]);
        },
      ),
      // page: SupportSection(),
      title: 'الدعم الفني',
      icon: FontAwesomeIcons.screwdriverWrench,
      path: AppRoutesPaths.homeSections.support,
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'العناية بالعملاء',
        subSections: AllSubSectionsLists.careSubSections,
      ),
      title: 'العناية بالعملاء',
      icon: FontAwesomeIcons.headset,
      path: AppRoutesPaths.homeSections.care,
    ),

    // PageModel(
    //   page: marketingpage(),
    //   title: 'التسويق الإلكتروني',
    //   image: 'assest/images/digitalmarketing.png',
    // ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الإدارة',
        subSections: AllSubSectionsLists.managementSubSections,
      ),
      title: 'إدارة',
      icon: FontAwesomeIcons.usersGear,
      path: AppRoutesPaths.homeSections.management,
    ),

    // PageModel(
    //   page: financepage(),
    //   title: 'الإدارة المالية',
    //   image: 'assest/images/money.png',
    // ),
    // PageModel
    //   page: race_page(),
    //   title: 'السباقات',
    //   image:
    // 'assest/images/race.png',
    // ),

    SectionModel(
      page: TaskManagementListPage(),
      title: 'إدارة المهام',
      icon: FontAwesomeIcons.listCheck,
      path: AppRoutesPaths.homeSections.taskManagement,
    ),
  ];

  /* Sales Sections */

  static final List<SectionModel> salesSections = [
    SectionModel(
      page: SubSectionsListView(
        title: 'العملاء',
        subSections: SalesSubSectionsLists.clientsSubSections,
      ),
      title: 'العملاء',
      icon: FontAwesomeIcons.users,
      path: AppRoutesPaths.salesSections.clients,
      subSections: SalesSubSectionsLists.clientsSubSections,
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الفواتير',
        subSections: SalesSubSectionsLists.invoiceSections,
      ),
      title: 'الفواتير',
      icon: FontAwesomeIcons.fileInvoiceDollar,
      path: AppRoutesPaths.salesSections.invoices,
      subSections: SalesSubSectionsLists.invoiceSections,
    ),

    SectionModel(
      page: SubSectionsListView(
        title: 'العلاقات العامة',
        subSections: SalesSubSectionsLists.relationSections,
      ),
      title: 'العلاقات العامة',
      icon: FontAwesomeIcons.solidHandshake,
      path: AppRoutesPaths.salesSections.relations,
      subSections: SalesSubSectionsLists.relationSections,
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
    SectionModel(
      page: SubSectionsListView(
        title: 'التقارير',
        subSections: SalesSubSectionsLists.reportsSections,
      ),
      title: 'تقارير واحصائيات',
      icon: FontAwesomeIcons.chartPie,
      path: AppRoutesPaths.salesSections.reports,
      subSections: SalesSubSectionsLists.reportsSections,
    ),

    SectionModel(
      page: SubSectionsListView(
        title: 'السباقات',
        subSections: SalesSubSectionsLists.raceSections,
      ),
      title: 'السباقات',
      icon: FontAwesomeIcons.flagCheckered,
      path: AppRoutesPaths.salesSections.races,
      subSections: SalesSubSectionsLists.raceSections,
    ),

    // PageModel(
    //   page: TaskManagementListPage(),
    //   title: 'إدارة المهام',
    //   image: 'assest/images/managetask1.png',
    // ),
  ];
}
