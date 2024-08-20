import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_reset_icon.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_debts_reports_cubit.dart';
import '../widgets/clients_debts_reports_body.dart';
import '../widgets/filter_clients_debts_reports_sheet.dart';

class ClientsDebtsReportsPage extends StatefulWidget {
  const ClientsDebtsReportsPage({super.key});

  @override
  State<ClientsDebtsReportsPage> createState() => _ClientDebtsReportsState();
}

class _ClientDebtsReportsState extends State<ClientsDebtsReportsPage> {
  late final ClientsDebtsReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsDebtsReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getClientDebtsReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقارير ديون العملاء',
        actions: [
          ListenableBuilder(
            listenable: Listenable.merge(_cubit.filterEntity.listenables()),
            builder: (context, child) {
              return CustomResetIcon(
                onTap: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                    ? () {
                        _cubit.filterEntity.clearFilters();
                        _cubit.getClientDebtsReports();
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
                child: FilterClientsDebtsReportsSheet(),
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
                child: BlocBuilder<ClientsDebtsReportsCubit,
                    ClientsDebtsReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getClientsDebtsReportsStatus !=
                        current.getClientsDebtsReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getClientsDebtsReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => ClientsDebtsReportsBody(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getClientDebtsReports(),
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
