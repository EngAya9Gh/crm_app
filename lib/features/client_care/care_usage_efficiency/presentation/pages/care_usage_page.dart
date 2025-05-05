import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../manager/care_usage_cubit/care_usage_cubit.dart';
import '../widgets/care_usage_card.dart';
import '../widgets/care_usage_paginated_list.dart';
import '../widgets/filter_care_usage_sheet.dart';

class CareUsagePage extends StatefulWidget {
  const CareUsagePage({Key? key}) : super(key: key);

  @override
  State<CareUsagePage> createState() => _CareUsagePageState();
}

class _CareUsagePageState extends State<CareUsagePage>
    with SingleTickerProviderStateMixin {
  late final CareUsageCubit _cubit;
  late TabController _tabController;
  late ValueNotifier<int> _currentTabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    _currentTabIndex = ValueNotifier(0);
    _cubit = getIt<CareUsageCubit>();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _currentTabIndex.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      _currentTabIndex.value = _tabController.index;
      _cubit.toggleCommunicationTab(_tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'متابعة كفاءة الاستخدام',
          showBackButton: true,
          leadingColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TabBar(
                controller: _tabController,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 8),
                labelPadding: const EdgeInsets.only(left: 25, right: 25),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontFamily: AppFonts.fontFamily2,
                  fontSize: 15.scaleFontSize,
                  fontWeight: FontWeight.bold,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.white,
                indicatorWeight: 6,
                isScrollable: true,
                unselectedLabelStyle: TextStyle(
                  fontFamily: AppFonts.fontFamily2,
                  fontSize: 14.scaleFontSize,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: AppColors.white,
                onTap: (value) => _currentTabIndex.value = value,
                tabAlignment: TabAlignment.center,
                tabs: const [
                  Tab(text: 'متابعة العملاء'),
                  Tab(text: 'تواصل الكفاءة'),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list_rounded),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const FilterCareUsageSheet(),
                );
              },
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(height: 15.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchWidget(
                        searchController: _cubit.pageVariables.searchController,
                        onChanged: (value) => _cubit.getCareUsageList(
                          isDebounced: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: CountPaginatedList<CareUsageCubit, CareUsageState>(
                  countSelector: (state) {
                    return _cubit.pageVariables.allList.length;
                  },
                  totalCount: (state) {
                    return _cubit.pageVariables.totalCount;
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<CareUsageCubit, CareUsageState>(
                  buildWhen: (previous, current) {
                    return previous.getCareUsageListStatus !=
                            current.getCareUsageListStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getCareUsageListStatus.when(
                      success: (_) => const CareUsagePaginatedList(),
                      failure: (error, _) => AppErrorWidget(
                        message: error ?? 'حدث خطأ ما',
                        onPressed: () => _cubit.getCareUsageList(),
                      ),
                      loading: () => const AppLoader(),
                      empty: () =>
                          const AppErrorWidget(message: 'لا يوجد بيانات'),
                      initial: () => const SizedBox(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
