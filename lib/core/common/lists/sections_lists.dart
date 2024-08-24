import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../features/common/regions/presentation/manager/regions_cubit.dart';
import '../../../features/home/presentation/pages/sales_section.dart';
import '../../../features/task_management/presentation/pages/task_management_list_page.dart';
import '../../../view_model/maincity_vm.dart';
import '../models/sections/section_model.dart';
import '../widgets/sections_and_subsections/sub_sections_list_view.dart';
import 'home_sub_sections_lists.dart';
import 'sales_sub_sections_lists.dart';

abstract class SectionsLists {
  /* Home Sections */

  static final List<SectionModel> HomeSections = [
    SectionModel(
      page: SalesSection(),
      title: 'المبيعات',
      icon: FontAwesomeIcons.peopleGroup,
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الدعم الفني',
        subSections: SubSectionsLists.supportSubSections,
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
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'العناية بالعملاء',
        subSections: SubSectionsLists.careSubSections,
      ),
      title: 'العناية بالعملاء',
      icon: FontAwesomeIcons.headset,
    ),

    // PageModel(
    //   page: marketingpage(),
    //   title: 'التسويق الإلكتروني',
    //   image: 'assest/images/digitalmarketing.png',
    // ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الإدارة',
        subSections: SubSectionsLists.managementSubSections,
      ),
      title: 'إدارة',
      icon: FontAwesomeIcons.usersGear,
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
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الفواتير',
        subSections: SalesSubSectionsLists.invoiceSections,
      ),
      title: 'الفواتير',
      icon: FontAwesomeIcons.fileInvoiceDollar,
    ),

    SectionModel(
      page: SubSectionsListView(
        title: 'العلاقات العامة',
        subSections: SalesSubSectionsLists.relationSections,
      ),
      title: 'العلاقات العامة',
      icon: FontAwesomeIcons.solidHandshake,
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
    ),

    SectionModel(
      page: SubSectionsListView(
        title: 'السباقات',
        subSections: SalesSubSectionsLists.raceSections,
      ),
      title: 'السباقات',
      icon: FontAwesomeIcons.flagCheckered,
    ),

    // PageModel(
    //   page: TaskManagementListPage(),
    //   title: 'إدارة المهام',
    //   image: 'assest/images/managetask1.png',
    // ),
  ];
}
