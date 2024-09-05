import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_reset_icon.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_care_reports_cubit.dart';
import '../widgets/clients_care_reports_body.dart';
import '../widgets/filter_clients_care_reports_sheet.dart';

class ClientsCareReportsPage extends StatefulWidget {
  const ClientsCareReportsPage({super.key});

  @override
  State<ClientsCareReportsPage> createState() => _ClientsCareReportsState();
}

class _ClientsCareReportsState extends State<ClientsCareReportsPage> {
  late final ClientsCareReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsCareReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getClientsCareReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'تقارير العناية بالعملاء',
        actions: [
          ListenableBuilder(
            listenable: Listenable.merge(_cubit.filterEntity.listenables()),
            builder: (context, child) {
              return CustomResetIcon(
                onTap: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                    ? () {
                        _cubit.filterEntity.clearFilters();
                        _cubit.getClientsCareReports();
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
                child: FilterClientsCareReportsSheet(),
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
                child: BlocBuilder<ClientsCareReportsCubit,
                    ClientsCareReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getClientsCareReportsStatus !=
                        current.getClientsCareReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getClientsCareReportsStatus.when(
                      success: (data) => ClientsCareReportsBody(),
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getClientsCareReports(),
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
