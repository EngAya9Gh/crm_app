import 'package:crm_smart/core/config/navigator/app_routes_paths.dart';
import 'package:crm_smart/features/home/presentation/pages/finance_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../features/clients_care/crud_activites/presentation/pages/crud_activities_page.dart';
import '../../../features/common/regions/presentation/manager/regions_cubit.dart';
import '../../../features/home/presentation/pages/sales_section.dart';
import '../../../features/sales/packages_offers/presentation/pages/packages_offers_page.dart';
import '../../../features/task_management/presentation/pages/task_management_list_page.dart';
import '../../../features/task_management/presentation/pages/task_managment_page.dart';
import '../../../view_model/maincity_vm.dart';
import '../models/sections/section_model.dart';
import '../widgets/app_adaptive_builder.dart';
import '../widgets/sections_and_subsections/sub_sections_list_view.dart';
import 'all_sub_sections_lists.dart';
import 'sales_sub_sections_lists.dart';

abstract class SectionsLists {
  /* Home Sections */

  static final List<SectionModel> homeSections = [
    SectionModel(
      page: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (_) => SalesSection(),
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('Body Medium'),
            builder: (_) => SalesSection(), //WebHomePage(),
          ),
        },
      ),
      title: 'المبيعات',
      icon: FontAwesomeIcons.peopleGroup,
      path: AppRoutesPaths.homeSections.sales,
      subSections: salesSections,
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
      title: 'الدعم الفني',
      icon: FontAwesomeIcons.screwdriverWrench,
      path: AppRoutesPaths.homeSections.support,
      subSections: AllSubSectionsLists.supportSubSections,
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'العناية بالعملاء',
        subSections: AllSubSectionsLists.careSubSections,
      ),
      title: 'العناية بالعملاء',
      icon: FontAwesomeIcons.headset,
      path: AppRoutesPaths.homeSections.care,
      subSections: AllSubSectionsLists.careSubSections,
    ),
    SectionModel(
      page: Directionality(
        textDirection: TextDirection.ltr,
        child: FinancesSection(),
      ),
      title: 'المالية',
      icon: FontAwesomeIcons.moneyBills,
      path: AppRoutesPaths.homeSections.finance,
      subSections: AllSubSectionsLists.financeSubSection,
    ),
    SectionModel(
      page: SubSectionsListView(
        title: 'الإدارة',
        subSections: AllSubSectionsLists.managementSubSections,
      ),
      title: 'إدارة',
      icon: FontAwesomeIcons.usersGear,
      path: AppRoutesPaths.homeSections.management,
      subSections: AllSubSectionsLists.managementSubSections,
    ),
    SectionModel(
      page: Directionality(
        textDirection: TextDirection.rtl,
        child: AppLayoutBuilder(
          smallBuilder: (context) => TaskManagementListPage(),
          mediumBuilder: (context) => TaskManagementPage(),
        ),
      ),
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
      page: CrudActivitiesPage(),
      title: 'الانشطة',
      privilegeId: "306",
      icon: FontAwesomeIcons.listCheck,
      path: AppRoutesPaths.salesSections.crudActivities,
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
      SectionModel(
        page: PackagesOffersPage(),
        title: 'عروض الباقات',
        icon: FontAwesomeIcons.flagCheckered,
        path: AppRoutesPaths.salesSections.packagesOffer,
        subSections: [],
      ),
  ];
}
