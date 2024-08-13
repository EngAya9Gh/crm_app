import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_install_reports_cubit.dart';
import '../widgets/clients_install_reports_body.dart';
import '../widgets/filter_clients_install_reports_sheet.dart';

class ClientsInstallReportsPage extends StatefulWidget {
  const ClientsInstallReportsPage({super.key});

  @override
  State<ClientsInstallReportsPage> createState() =>
      _ClientsInstallReportsState();
}

class _ClientsInstallReportsState extends State<ClientsInstallReportsPage> {
  late final ClientsInstallReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsInstallReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getClientsInstallReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقارير التركيب للعملاء',
        actions: [
          CustomFilterIcon(
            onTap: () async {
              final value = await AppBottomSheet.show(
                context: context,
                child: FilterClientsInstallReportsSheet(),
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
                child: BlocBuilder<ClientsInstallReportsCubit,
                    ClientsInstallReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getClientsInstallReportsStatus !=
                        current.getClientsInstallReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getClientsInstallReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => ClientsInstallReportsBody(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getClientsInstallReports(),
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
