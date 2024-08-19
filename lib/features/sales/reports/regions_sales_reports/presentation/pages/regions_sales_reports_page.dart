import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_reset_icon.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/regions_sales_reports_cubit.dart';
import '../widgets/filter_regions_sales_reports_sheet.dart';
import '../widgets/regions_sales_reports_body.dart';

class RegionsSalesReportsPage extends StatefulWidget {
  const RegionsSalesReportsPage({super.key});

  @override
  State<RegionsSalesReportsPage> createState() => _RegionsSalesReportsState();
}

class _RegionsSalesReportsState extends State<RegionsSalesReportsPage> {
  late final RegionsSalesReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<RegionsSalesReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getRegionsSalesReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقارير مبيعات الفروع',
        actions: [
          ListenableBuilder(
            listenable: Listenable.merge(_cubit.filterEntity.listenables()),
            builder: (context, child) {
              return CustomResetIcon(
                onTap: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                    ? () {
                        _cubit.filterEntity.clearFilters();
                        _cubit.getRegionsSalesReports();
                      }
                    : null,
              );
            },
          ),
          5.width,
          CustomFilterIcon(
            onTap: () async {
              final value = await AppBottomSheet.show(
                context: context,
                child: FilterRegionsSalesReportsSheet(),
              );
              if (value != true) _cubit.returnToPreviousState();
            },
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<RegionsSalesReportsCubit,
                    RegionsSalesReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getRegionsSalesReportsStatus !=
                        current.getRegionsSalesReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getRegionsSalesReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => RegionsSalesReportsBody(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getRegionsSalesReports(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
