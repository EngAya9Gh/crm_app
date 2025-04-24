import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/section_with_action.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/data/models/elevation_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/widgets/card_elevation_sys_support.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_manual_task_page.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../view_model/communication_vm.dart';
import 'communcation_view_widget.dart';

class CareClientView extends StatefulWidget {
  CareClientView({
    required this.fk_client,
    Key? key,
    this.tabCareIndex = 0,
    required this.idCommunication,
  }) : super(key: key);
  String fk_client;
  int tabCareIndex;
  String idCommunication;

  @override
  _CareClientViewState createState() => _CareClientViewState();
}

class _CareClientViewState extends State<CareClientView> {
  Map tabsToIndex = {
    0: "ترحيب",
    1: "تركيب",
    2: "دوري",
  };

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<CommunicationVm>(
          builder: (context, communicationVm, _) {
            final carteClientState = communicationVm.careClientState;
            final isLoading = communicationVm.isLoadingCareClient;

            if (isLoading) return AppLoader();

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SectionWithAction(
                      title: 'Tasks',
                      onAddPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (context) => AddManualTaskPage(list: PublicType.values, clientId: widget.fk_client),
                        );
                      },
                      child: Container(),
                    ),
                  ),
                  SliverToBoxAdapter(child: 20.height),
                  ...carteClientState.entries.map((entry) {
                    final title = entry.key;
                    final list = entry.value;
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SectionWithAction(
                            title: title,
                            hasPlus: tabsToIndex.values.contains(title),
                            addButtonText: '',
                            onAddPressed: () {
                              // TODO: Implement add action based on section
                            },
                            child: list.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: AppText(
                                      fontSize: 15.scaleFontSize,
                                      'لا يوجد بيانات',
                                      color: Colors.grey,
                                    ),
                                  )
                                : Column(
                                    children: list.map((item) {
                                      return (tabsToIndex.values.contains(title))
                                          ? CommunicationExpandedWidget(
                                              communicationModel: item,
                                              initiallyExpanded: item.idCommunication == widget.idCommunication,
                                            )
                                          : ElevationSysOrSupportCard(
                                              elevationModel: (item as ElevationModel), tabElevationIndex: item.rateType ?? 1);
                                    }).toList(),
                                  ),
                          ),
                          50.height,
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
