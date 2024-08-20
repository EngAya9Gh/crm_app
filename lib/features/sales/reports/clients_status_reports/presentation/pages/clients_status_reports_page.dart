import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_reset_icon.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_status_reports_cubit.dart';
import '../widgets/clients_status_reports_body.dart';
import '../widgets/filter_clients_status_reports_sheet.dart';

class ClientsStatusReportsPage extends StatefulWidget {
  const ClientsStatusReportsPage({super.key});

  @override
  State<ClientsStatusReportsPage> createState() => _ClientsStatusReportsState();
}

class _ClientsStatusReportsState extends State<ClientsStatusReportsPage> {
  late final ClientsStatusReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsStatusReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getClientsStatusReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقارير حالات العملاء',
        actions: [
          ListenableBuilder(
            listenable: Listenable.merge(_cubit.filterEntity.listenables()),
            builder: (context, child) {
              return CustomResetIcon(
                onTap: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                    ? () {
                        _cubit.filterEntity.clearFilters();
                        _cubit.getClientsStatusReports();
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
                child: FilterClientsStatusReportsSheet(),
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
                child: BlocBuilder<ClientsStatusReportsCubit,
                    ClientsStatusReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getClientsStatusReportsStatus !=
                        current.getClientsStatusReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getClientsStatusReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => ClientsStatusReportsBody(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getClientsStatusReports(),
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
