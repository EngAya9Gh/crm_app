import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_reset_icon.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/employees_sales_reports_cubit.dart';
import '../widgets/employees_sales_reports_body.dart';
import '../widgets/filter_employees_sales_reports_sheet.dart';

class EmployeesSalesReportsPage extends StatefulWidget {
  const EmployeesSalesReportsPage({super.key});

  @override
  State<EmployeesSalesReportsPage> createState() =>
      _EmployeesSalesReportsState();
}

class _EmployeesSalesReportsState extends State<EmployeesSalesReportsPage> {
  late final EmployeesSalesReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<EmployeesSalesReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getEmployeesSalesReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقارير مبيعات الموظفين',
        actions: [
          ListenableBuilder(
            listenable: Listenable.merge(_cubit.filterEntity.listenables()),
            builder: (context, child) {
              return CustomResetIcon(
                onTap: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                    ? () {
                        _cubit.filterEntity.clearFilters();
                        _cubit.getEmployeesSalesReports();
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
                child: FilterEmployeesSalesReportsSheet(),
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
                child: BlocBuilder<EmployeesSalesReportsCubit,
                    EmployeesSalesReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getEmployeesSalesReportsStatus !=
                        current.getEmployeesSalesReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getEmployeesSalesReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => EmployeesSalesReportsBody(),
                      empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getEmployeesSalesReports(),
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
