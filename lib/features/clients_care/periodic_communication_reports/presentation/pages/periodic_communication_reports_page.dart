import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_reset_icon.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/periodic_communication_reports_cubit.dart';
import '../widgets/filter_periodic_communication_reports_sheet.dart';
import '../widgets/periodic_communication_reports_body.dart';

class PeriodicCommunicationReportsPage extends StatefulWidget {
  const PeriodicCommunicationReportsPage({super.key});

  @override
  State<PeriodicCommunicationReportsPage> createState() =>
      _PeriodicCommunicationReportsState();
}

class _PeriodicCommunicationReportsState
    extends State<PeriodicCommunicationReportsPage> {
  late final PeriodicCommunicationReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PeriodicCommunicationReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getPeriodicCommunicationReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: AppStrings.periodicCommunicaitonReportsLabel,
        actions: [
          ListenableBuilder(
            listenable: Listenable.merge(_cubit.filterEntity.listenables()),
            builder: (context, child) {
              return CustomResetIcon(
                onTap: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                    ? () {
                        _cubit.filterEntity.clearFilters();
                        _cubit.getPeriodicCommunicationReports();
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
                child: FilterPeriodicCommunicationReportsSheet(),
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
                child: BlocBuilder<PeriodicCommunicationReportsCubit,
                    PeriodicCommunicationReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getPeriodicCommunicationReportsStatus !=
                        current.getPeriodicCommunicationReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getPeriodicCommunicationReportsStatus.when(
                      success: (data) => PeriodicCommunicationReportsBody(),
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                        onPressed: () =>
                            _cubit.getPeriodicCommunicationReports(),
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
